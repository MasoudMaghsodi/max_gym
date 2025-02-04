import 'package:flutter_riverpod/flutter_riverpod.dart';

// StateNotifier برای مدیریت شاخص تب‌های نوار ناوبری پایینی
class BottomNavBarNotifier extends StateNotifier<int> {
  BottomNavBarNotifier() : super(0); // شاخص اولیه صفر

  // به‌روزرسانی شاخص تب‌ها
  void updateIndex(int newIndex) {
    if (newIndex != state) {
      state = newIndex; // تنها در صورت تغییر، شاخص را به‌روز کن
    }
  }
}

// StateNotifierProvider برای BottomNavBarNotifier
final bottomNavBarProvider =
    StateNotifierProvider<BottomNavBarNotifier, int>((ref) {
  return BottomNavBarNotifier();
});
