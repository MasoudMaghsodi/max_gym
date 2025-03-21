import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:max_gym/core/constants/app_colors.dart';
import 'package:max_gym/data/models/athlete_model.dart';
import 'package:max_gym/presentation/pages/athlete_card.dart';
import 'package:max_gym/presentation/pages/settings_page.dart';
import 'package:max_gym/presentation/providers/providers.dart';
import 'package:max_gym/presentation/widgets/custom_chip.dart';

class AthleteListPage extends ConsumerStatefulWidget {
  const AthleteListPage({super.key});

  @override
  ConsumerState<AthleteListPage> createState() => _AthleteListPageState();
}

class _AthleteListPageState extends ConsumerState<AthleteListPage>
    with SingleTickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  List<String> selectedFilters = [];
  final ScrollController _scrollController = ScrollController();
  List<Athlete> _loadedAthletes = [];
  int _loadedCount = 10;
  late AnimationController _fabController;
  late Animation<double> _fabAnimation;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_loadMore);
    _loadInitialAthletes();
    _fabController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _fabAnimation = Tween<double>(begin: 0, end: 1).animate(_fabController);
  }

  Future<void> _loadInitialAthletes() async {
    final athletes =
        await ref.read(athleteRepositoryProvider).searchAthletes('');
    setState(() {
      _loadedAthletes = athletes.take(_loadedCount).toList();
    });
  }

  void _loadMore() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      setState(() {
        _loadedCount += 10;
        _loadInitialAthletes();
      });
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    _fabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final athletesAsync = ref.watch(filteredAthletesProvider);
    final athleteRepo = ref.watch(athleteRepositoryProvider);
    final queueCount = ref.watch(offlineQueueProvider).when(
          data: (queue) => queue.length,
          loading: () => 0,
          error: (_, __) => 0,
        );

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.h,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('ورزشکاران'),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images/max.png', // لوگو به عنوان پس‌زمینه
                    fit: BoxFit.cover,
                    // ignore: deprecated_member_use
                    color: Colors.black.withOpacity(0.3),
                    colorBlendMode: BlendMode.darken,
                  ),
                  Positioned(
                    bottom: 50.h,
                    left: 16.w,
                    child: Row(
                      children: [
                        _buildStatCard(
                            'ورزشکارها', _loadedAthletes.length.toString()),
                        SizedBox(width: 10.w),
                        _buildStatCard(
                            'برنامه‌ها', 'N/A'), // بعداً با دیتا پر می‌شه
                      ],
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: () => ref.refresh(athletesProvider),
              ),
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SettingsPage()),
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(8.w),
              child: TextField(
                controller: _searchController,
                decoration: const InputDecoration(
                  hintText: 'جستجو...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  Future.delayed(const Duration(milliseconds: 300), () {
                    ref.read(searchQueryProvider.notifier).state = value;
                  });
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Wrap(
                spacing: 8.w,
                children: [
                  CustomChip(
                      label: 'مرد',
                      isSelected: selectedFilters.contains('مرد'),
                      onTap: () => _toggleFilter('مرد')),
                  CustomChip(
                      label: 'زن',
                      isSelected: selectedFilters.contains('زن'),
                      onTap: () => _toggleFilter('زن')),
                  CustomChip(
                      label: 'عضله‌سازی',
                      isSelected: selectedFilters.contains('عضله‌سازی'),
                      onTap: () => _toggleFilter('عضله‌سازی')),
                  CustomChip(
                      label: 'کاهش وزن',
                      isSelected: selectedFilters.contains('کاهش وزن'),
                      onTap: () => _toggleFilter('کاهش وزن')),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                if (index == _loadedAthletes.length) {
                  return const Center(child: CircularProgressIndicator());
                }
                return AthleteCard(athlete: _loadedAthletes[index]);
              },
              childCount: _loadedAthletes.length + 1,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          _fabController.forward().then((_) => _fabController.reverse());
          await athleteRepo.syncAll();
          // ignore: unused_result
          ref.refresh(athletesProvider);
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('داده‌ها سینک شدند')),
          );
        },
        backgroundColor: AppColors.primary,
        child: RotationTransition(
          turns: _fabAnimation,
          child: Stack(
            alignment: Alignment.center,
            children: [
              const Icon(Icons.sync),
              if (queueCount > 0)
                Positioned(
                  top: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 8.r,
                    backgroundColor: AppColors.error,
                    child: Text(
                      queueCount.toString(),
                      style: TextStyle(fontSize: 10.sp, color: Colors.white),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(String label, String value) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: BoxDecoration(
        // ignore: deprecated_member_use
        color: AppColors.primary.withOpacity(0.8),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        children: [
          Text(label, style: TextStyle(fontSize: 12.sp, color: Colors.white)),
          Text(value,
              style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  void _toggleFilter(String filter) {
    setState(() {
      if (selectedFilters.contains(filter)) {
        selectedFilters.remove(filter);
      } else {
        selectedFilters.add(filter);
      }
    });
  }
}
