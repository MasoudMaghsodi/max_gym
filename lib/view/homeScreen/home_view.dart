import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:max_gym/view/profileScreen/profile_view.dart';
import '../../controller/homeController/btm_controller.dart';
import '../../widgets/homeWidgets/homeView/btm_bar_widget.dart';
import '../exerciseScreen/workout_view.dart.dart';
import 'home_content_view.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the current index from the bottom navigation bar provider
    final currentIndex = ref.watch(bottomNavBarProvider);

    // List of pages corresponding to each tab
    final List<Widget> pages = [
      const HomeContent(), // Main home page
      const ProfileView(), // Athlete profile page
      const WorkoutPage(), // Weekly workout page
    ];

    // Titles for each page
    final List<String> titles = [
      'باشگاه مکس', // Title for the main home page
      'پروفایل ورزشکار', // Title for the athlete profile page
      'تمرینات هفتگی', // Title for the weekly workout page
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
        child: pages[currentIndex], // Display the current page
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}
