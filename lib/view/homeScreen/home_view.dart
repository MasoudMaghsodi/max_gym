import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:max_gym/view/profileScreen/profile_view.dart';
import '../../controller/homeController/btm_controller.dart';
import '../../widgets/homeWidgets/btm_bar_widget.dart';
import 'home_content_view.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavBarProvider);

    // لیست صفحات
    final List<Widget> pages = [
      const HomeContent(), // صفحه اصلی (خود همین صفحه)
      const ProfileView(), // صفحه پروفایل
      const ProfileView(), // صفحه پروفایل
    ];

    // عنوان‌های مربوط به هر صفحه
    final List<String> titles = [
      'باشگاه مکس', // عنوان صفحه اصلی
      'پروفایل ورزشکار', // عنوان صفحه پروفایل
      'پروفایل مربی', // عنوان صفحه پروفایل
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(titles[currentIndex]),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/image/max.jpg'),
            fit: BoxFit.cover,
            opacity: 0.5,
          ),
        ),
        child: pages[currentIndex], // نمایش صفحه فعلی
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}
