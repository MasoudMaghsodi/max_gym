import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import '../widgets/profileWidgets/profile_form.dart';
import '../providers/profile_provider.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileFormKey = GlobalKey<ProfileFormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'پروفایل ورزشکار',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 800) {
            // حالت لپ‌تاپ و دسکتاپ
            return Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/image/max.png'),
                        fit: BoxFit.fill,
                        colorFilter: ColorFilter.mode(
                            Colors.white.withValues(alpha: 0.6),
                            BlendMode.dstATop),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Card(
                      color: Colors.white.withValues(alpha: 0.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ProfileForm(
                              key: profileFormKey,
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () {
                                if (profileFormKey.currentState
                                        ?.validateForm() ==
                                    true) {
                                  final profileData = profileFormKey
                                      .currentState
                                      ?.collectFormData();
                                  _showConfirmationDialog(
                                      context, profileData!, ref);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 24),
                              ),
                              child: const Text('ثبت پروفایل',
                                  style: TextStyle(fontSize: 16)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            // حالت موبایل
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image/max.png'),
                  fit: BoxFit.fill,
                  colorFilter: ColorFilter.mode(
                      Colors.white.withValues(alpha: 0.6), BlendMode.dstATop),
                ),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Card(
                      color: Colors.white.withValues(alpha: 0.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ProfileForm(
                          key: profileFormKey,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        if (profileFormKey.currentState?.validateForm() ==
                            true) {
                          final profileData =
                              profileFormKey.currentState?.collectFormData();
                          _showConfirmationDialog(context, profileData!, ref);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 24),
                      ),
                      child: const Text('ثبت پروفایل',
                          style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
      floatingActionButton: SpeedDial(
        icon: Icons.menu,
        activeIcon: Icons.close,
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        overlayColor: Colors.black,
        overlayOpacity: 0.5,
        elevation: 8.0,
        spaceBetweenChildren: 12.0,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.refresh, color: Colors.white),
            backgroundColor: Colors.redAccent,
            label: 'ریست پروفایل',
            labelStyle: const TextStyle(fontSize: 16, color: Colors.black),
            labelBackgroundColor: Colors.white,
            onTap: () {
              profileFormKey.currentState?.resetForm();
              ref.read(profileProvider.notifier).resetProfile();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('اطلاعات ریست شد')),
              );
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.delete, color: Colors.white),
            backgroundColor: Colors.red,
            label: 'حذف داده‌های ذخیره شده',
            labelStyle: const TextStyle(fontSize: 16, color: Colors.black),
            labelBackgroundColor: Colors.white,
            onTap: () {
              ref.read(profileProvider.notifier).resetProfile();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('داده‌های ذخیره شده پاک شد')),
              );
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.visibility, color: Colors.white),
            backgroundColor: Colors.blue,
            label: 'نمایش داده‌های ذخیره شده',
            labelStyle: const TextStyle(fontSize: 16, color: Colors.black),
            labelBackgroundColor: Colors.white,
            onTap: () {
              final profileData = ref.watch(profileProvider);
              if (profileData.isNotEmpty) {
                _showStoredDataDialog(context, profileData);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('هیچ داده‌ای ذخیره نشده است')),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  void _showConfirmationDialog(
      BuildContext context, Map<String, String> profileData, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:
              const Text('تأیید اطلاعات پروفایل', textAlign: TextAlign.right),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildProfileDataRow(profileData['firstName'], 'نام'),
              _buildProfileDataRow(profileData['lastName'], 'نام خانوادگی'),
              _buildProfileDataRow(profileData['age'], 'سن'),
              _buildProfileDataRow(profileData['weight'], 'وزن'),
              _buildProfileDataRow(profileData['height'], 'قد'),
              _buildProfileDataRow(profileData['gender'], 'جنسیت'),
              _buildProfileDataRow(profileData['goal'], 'هدف'),
              _buildProfileDataRow(profileData['coachNotes'], 'نظر مربی'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('ویرایش', textAlign: TextAlign.right),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                ref.read(profileProvider.notifier).updateProfile(profileData);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('اطلاعات با موفقیت ثبت شد')),
                );
              },
              child: const Text('تأیید', textAlign: TextAlign.right),
            ),
          ],
        );
      },
    );
  }

  void _showStoredDataDialog(
      BuildContext context, Map<String, String> profileData) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('اطلاعات ذخیره شده', textAlign: TextAlign.right),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildProfileDataRow(profileData['firstName'], 'نام'),
                _buildProfileDataRow(profileData['lastName'], 'نام خانوادگی'),
                _buildProfileDataRow(profileData['age'], 'سن'),
                _buildProfileDataRow(profileData['weight'], 'وزن'),
                _buildProfileDataRow(profileData['height'], 'قد'),
                _buildProfileDataRow(profileData['gender'], 'جنسیت'),
                _buildProfileDataRow(profileData['goal'], 'هدف'),
                _buildProfileDataRow(profileData['coachNotes'], 'نظر مربی'),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('بستن', textAlign: TextAlign.right),
              ),
            ],
          );
        });
  }

  Widget _buildProfileDataRow(String? value, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              value ?? '',
              textAlign: TextAlign.right,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            '$label : ',
            style: const TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
        ],
      ),
    );
  }
}
