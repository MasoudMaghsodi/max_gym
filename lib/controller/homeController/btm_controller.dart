import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomNavBarNotifier extends StateNotifier<int> {
  BottomNavBarNotifier() : super(0);

  void updateIndex(int newIndex) {
    state = newIndex;
  }
}

final bottomNavBarProvider = StateNotifierProvider<BottomNavBarNotifier, int>(
  (ref) => BottomNavBarNotifier(),
);
