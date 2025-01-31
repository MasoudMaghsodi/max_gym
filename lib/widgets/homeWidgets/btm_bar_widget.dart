import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controller/homeController/btm_controller.dart';

class CustomBottomNavBar extends ConsumerWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavBarProvider);
    final notifier = ref.read(bottomNavBarProvider.notifier);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.9),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) => notifier.updateIndex(index),
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          selectedFontSize: 14.sp,
          unselectedFontSize: 12.sp,
          items: [
            _buildBottomNavigationBarItem(
              icon: Icons.home,
              label: 'خانه',
              active: currentIndex == 0,
            ),
            _buildBottomNavigationBarItem(
              icon: Icons.person_add,
              label: 'افزودن',
              active: currentIndex == 1,
            ),
            _buildBottomNavigationBarItem(
              icon: Icons.fitness_center,
              label: 'تمرین',
              active: currentIndex == 2,
            ),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem({
    required IconData icon,
    required String label,
    required bool active,
  }) {
    return BottomNavigationBarItem(
      icon: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child: Icon(
          icon,
          size: active ? 30.sp : 24.sp,
          color: active ? Colors.blueAccent : Colors.grey,
        ),
      ),
      label: label,
    );
  }
}
