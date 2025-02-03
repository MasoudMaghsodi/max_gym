import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:max_gym/model/athleteModel/athlete_model.dart';
import 'package:max_gym/providers/athleteProviders/athlete_list_provider.dart';
import 'package:max_gym/widgets/profileWidgets/profile_list_view.dart';

class ProfileView extends ConsumerWidget {
  final Athlete? athlete;
  const ProfileView({super.key, this.athlete});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileFormKey = GlobalKey<ProfileListViewState>();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: _buildResponsiveLayout(profileFormKey, ref),
      ),
    );
  }

  Widget _buildResponsiveLayout(
      GlobalKey<ProfileListViewState> profileFormKey, WidgetRef ref) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return constraints.maxWidth > 800
            ? _buildDesktopView(profileFormKey, ref, context)
            : _buildMobileView(profileFormKey, ref, context);
      },
    );
  }

  Widget _buildDesktopView(GlobalKey<ProfileListViewState> profileFormKey,
      WidgetRef ref, BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 2, child: _buildBackgroundImage()),
        Expanded(
          flex: 3,
          child: Padding(
            padding: EdgeInsets.all(32.w),
            child: _buildProfileCard(profileFormKey, ref, context),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileView(GlobalKey<ProfileListViewState> profileFormKey,
      WidgetRef ref, BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: _buildBackgroundImage()),
        Positioned.fill(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom + 20.h,
              left: 16.w,
              right: 16.w,
              top: 16.w,
            ),
            child: _buildProfileCard(profileFormKey, ref, context),
          ),
        ),
      ],
    );
  }

  Widget _buildBackgroundImage() {
    return IgnorePointer(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            opacity: 0.6,
            image: AssetImage('assets/image/max.png'),
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ),
      ),
    );
  }

  Widget _buildProfileCard(GlobalKey<ProfileListViewState> profileFormKey,
      WidgetRef ref, BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(0.8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      elevation: 8,
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ProfileListView(key: profileFormKey, athlete: athlete),
            SizedBox(height: 24.h),
            if (athlete == null)
              Row(
                children: [
                  Expanded(
                    child: _buildSubmitButton(profileFormKey, ref, context),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: _buildResetButton(profileFormKey),
                  ),
                ],
              ),
            if (athlete != null)
              _buildUpdateAndCancelButtons(profileFormKey, ref, context),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }

  Widget _buildSubmitButton(GlobalKey<ProfileListViewState> profileFormKey,
      WidgetRef ref, BuildContext context) {
    return ElevatedButton(
      onPressed: () => _handleFormSubmission(profileFormKey, ref, context),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 28.w),
      ),
      child: Text(
        'ثبت پروفایل',
        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildResetButton(GlobalKey<ProfileListViewState> profileFormKey) {
    return ElevatedButton(
      onPressed: () => profileFormKey.currentState?.resetForm(),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 28.w),
      ),
      child: Text(
        'ریست فرم',
        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildUpdateAndCancelButtons(
      GlobalKey<ProfileListViewState> profileFormKey,
      WidgetRef ref,
      BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          onPressed: () => _handleUpdateProfile(profileFormKey, ref, context),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r)),
            padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 28.w),
          ),
          child: Text(
            'آپدیت',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r)),
            padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 28.w),
          ),
          child: Text(
            'لغو',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  void _handleFormSubmission(GlobalKey<ProfileListViewState> profileFormKey,
      WidgetRef ref, BuildContext context) async {
    FocusManager.instance.primaryFocus?.unfocus();
    await Future.delayed(const Duration(milliseconds: 100));

    if (profileFormKey.currentState?.validateForm() ?? false) {
      final profileData = profileFormKey.currentState?.collectFormData();
      if (profileData != null) {
        _showConfirmationDialog(context, profileData, ref, profileFormKey);
      }
    }
  }

  void _handleUpdateProfile(GlobalKey<ProfileListViewState> profileFormKey,
      WidgetRef ref, BuildContext context) async {
    FocusManager.instance.primaryFocus?.unfocus();
    await Future.delayed(const Duration(milliseconds: 100));

    if (profileFormKey.currentState?.validateForm() ?? false) {
      final profileData = profileFormKey.currentState?.collectFormData();
      if (profileData != null) {
        final updatedAthlete = Athlete()
          ..id = athlete!.id
          ..firstName = profileData['firstName']!
          ..lastName = profileData['lastName']!
          ..age = int.parse(profileData['age']!)
          ..height = double.parse(profileData['height']!)
          ..weight = double.parse(profileData['weight']!)
          ..gender =
              profileData['gender'] == 'مرد' ? Gender.male : Gender.female
          ..goal = profileData['goal']
          ..coachNotes = profileData['coachNotes'];

        final controller = ref.read(athleteProvider);
        if (controller != null) {
          await controller.updateAthlete(updatedAthlete);

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('اطلاعات با موفقیت به‌روزرسانی شد')),
          );

          Navigator.pop(context);
        }
      }
    }
  }

  void _showConfirmationDialog(
    BuildContext context,
    Map<String, String> profileData,
    WidgetRef ref,
    GlobalKey<ProfileListViewState> profileFormKey,
  ) {
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
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'ویرایش',
                textAlign: TextAlign.right,
                style: TextStyle(color: Colors.redAccent, fontSize: 16.sp),
              ),
            ),
            TextButton(
              onPressed: () async {
                // بستن دیالوگ
                Navigator.of(context).pop();

                // با استفاده از Future.delayed برای اطمینان از اتمام بسته شدن دیالوگ
                await Future.delayed(const Duration(milliseconds: 100));

                // ایجاد شیء Athlete
                final newAthlete = Athlete()
                  ..firstName = profileData['firstName']!
                  ..lastName = profileData['lastName']!
                  ..age = int.parse(profileData['age']!)
                  ..height = double.parse(profileData['height']!)
                  ..weight = double.parse(profileData['weight']!)
                  ..gender = profileData['gender'] == 'مرد'
                      ? Gender.male
                      : Gender.female
                  ..goal = profileData['goal']
                  ..coachNotes = profileData['coachNotes'];

                // ذخیره اطلاعات
                final controller = ref.read(athleteProvider);
                if (controller != null) {
                  try {
                    // ذخیره ورزشکار جدید
                    await controller.addAthlete(newAthlete);

                    // نمایش پیام موفقیت
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('✅ اطلاعات با موفقیت ثبت شد'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }

                    // ریست فرم
                    profileFormKey.currentState?.resetForm();
                  } catch (e) {
                    // نمایش خطا در صورت عدم موفقیت
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content:
                              Text('⚠️ خطا در ذخیره‌سازی: ${e.toString()}'),
                          duration: Duration(seconds: 3),
                        ),
                      );
                    }
                  }
                } else {
                  // نمایش خطا در صورت عدم وجود کنترلر
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('⚠️ کنترلر در دسترس نیست'),
                        duration: Duration(seconds: 3),
                      ),
                    );
                  }
                }
              },
              child: Text(
                'تأیید',
                textAlign: TextAlign.right,
                style: TextStyle(color: Colors.green, fontSize: 18.sp),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildProfileDataRow(String? value, String label) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$label : ',
            style: const TextStyle(fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          Expanded(
            child: Text(
              value ?? '',
              textAlign: TextAlign.right,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
