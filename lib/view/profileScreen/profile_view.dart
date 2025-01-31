import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:max_gym/view/profileScreen/profile_list_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:max_gym/model/athleteModel/athlete_model.dart';
import '../../providers/athleteProviders/athlete_list_provider.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileFormKey = GlobalKey<ProfileListViewState>();
    return Scaffold(
      body: _buildResponsiveLayout(profileFormKey, ref),
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
        Expanded(
          flex: 2,
          child: _buildBackgroundImage(),
        ),
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
        _buildBackgroundImage(),
        SingleChildScrollView(
          padding: EdgeInsets.all(16.w),
          child: _buildProfileCard(profileFormKey, ref, context),
        ),
      ],
    );
  }

  Widget _buildBackgroundImage() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          opacity: 0.6,
          image: AssetImage('assets/image/max.png'),
          fit: BoxFit.fill,
          alignment: Alignment.center,
        ),
      ),
    );
  }

  // اصلاح متد _buildProfileCard
  Widget _buildProfileCard(GlobalKey<ProfileListViewState> profileFormKey,
      WidgetRef ref, BuildContext context) {
    return Card(
      color: Colors.white.withValues(alpha: 0.8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      elevation: 8,
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ProfileListView(
              key: profileFormKey,
            ),
            SizedBox(height: 24.h),
            // دکمه ثبت
            _buildSubmitButton(profileFormKey, ref, context),
            SizedBox(height: 16.h),
            // دکمه‌های عملیاتی
            _buildActionButtons(profileFormKey, context, ref),
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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 28.w),
      ),
      child: Text(
        'ثبت پروفایل',
        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
      ),
    );
  }

  void _handleFormSubmission(
    GlobalKey<ProfileListViewState> profileFormKey,
    WidgetRef ref,
    BuildContext context,
  ) async {
    if (profileFormKey.currentState?.validateForm() ?? false) {
      final profileData = profileFormKey.currentState?.collectFormData();
      if (profileData != null) {
        _showConfirmationDialog(context, profileData, ref);
      }
    }
  }

  void _handleDeleteData(BuildContext context, WidgetRef ref) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('حذف داده‌ها'),
        content:
            const Text('آیا از حذف تمام داده‌های ذخیره شده اطمینان دارید؟'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('لغو'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              final controller = ref.read(athleteProvider);
              await controller.deleteAllAthletes();
              // ignore: use_build_context_synchronously
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('داده‌ها با موفقیت حذف شدند')),
              );
            },
            child: const Text('تأیید', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _showConfirmationDialog(
    BuildContext context,
    Map<String, String> profileData,
    WidgetRef ref,
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
              onPressed: () {
                Navigator.of(context).pop(); // بستن دیالوگ
              },
              child: Text(
                'ویرایش',
                textAlign: TextAlign.right,
                style: TextStyle(color: Colors.redAccent, fontSize: 16.sp),
              ),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop(); // بستن دیالوگ

                // تبدیل داده‌های فرم به مدل Athlete
                final athlete = Athlete()
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

                // ذخیره در دیتابیس
                final controller = ref.read(athleteProvider);
                await controller.saveAthlete(athlete);

                // نمایش پیام موفقیت
                // ignore: use_build_context_synchronously
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('اطلاعات با موفقیت ثبت شد')),
                );
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

// افزودن ویجت برای دکمه‌های عملیاتی
  Widget _buildActionButtons(GlobalKey<ProfileListViewState> profileFormKey,
      BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildActionButton(
          icon: Icons.refresh,
          color: Colors.redAccent,
          label: 'ریست',
          onPressed: () => profileFormKey.currentState?.resetForm(),
        ),
        _buildActionButton(
          icon: Icons.delete,
          color: Colors.red,
          label: 'حذف',
          onPressed: () => _handleDeleteData(context, ref),
        ),
        // تغییر از نمایش به آپدیت
        _buildActionButton(
          icon: Icons.update,
          color: Colors.orange,
          label: 'آپدیت',
          onPressed: () => _handleUpdateProfile(profileFormKey, ref, context),
        ),
      ],
    );
  }

// ویجت برای ایجاد دکمه‌های یکپارچه
  Widget _buildActionButton({
    required IconData icon,
    required Color color,
    required String label,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: Colors.white),
      label: Text(
        label,
        style: TextStyle(
          color: Colors.white,
          fontSize: 12.sp,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      ),
    );
  }

  void _handleUpdateProfile(
    GlobalKey<ProfileListViewState> profileFormKey,
    WidgetRef ref,
    BuildContext context,
  ) async {
    if (profileFormKey.currentState?.validateForm() ?? false) {
      final profileData = profileFormKey.currentState?.collectFormData();
      if (profileData != null) {
        final athlete = Athlete()
          ..id = int.parse(profileData['id']!) // نیاز به فیلد ID در فرم
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
        await controller.updateAthlete(athlete);

        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('اطلاعات با موفقیت به‌روزرسانی شد')),
        );
      }
    }
  }
}
