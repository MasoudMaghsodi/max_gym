import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:max_gym/presentation/pages/athlete_card.dart';
import 'package:max_gym/core/constants/app_colors.dart';
import 'package:max_gym/data/models/athlete_model.dart';
import 'package:max_gym/presentation/providers/providers.dart';
import 'package:max_gym/presentation/pages/add_edit_athlete_page.dart';

class AthleteListPage extends ConsumerStatefulWidget {
  const AthleteListPage({super.key});

  @override
  ConsumerState<AthleteListPage> createState() => _AthleteListPageState();
}

class _AthleteListPageState extends ConsumerState<AthleteListPage> {
  late TextEditingController _searchController;
  final bool _isSyncing = false;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final athletesAsync = ref.watch(athletesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('لیست ورزشکاران'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: _isSyncing
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : const Icon(Icons.sync),
            onPressed:
                _isSyncing ? null : () => _syncData(context, ref, _isSyncing),
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () => _showFilterDialog(context, ref),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'جستجوی ورزشکار...',
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  prefixIcon:
                      const Icon(Icons.search, color: AppColors.primary),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                ),
                onChanged: (query) {
                  ref.read(searchQueryProvider.notifier).state = query;
                },
              ),
            ),
          ),
          Expanded(
            child: athletesAsync.when(
              data: (athletes) => _buildAthleteList(athletes, ref),
              loading: () => const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primary,
                ),
              ),
              error: (error, _) => Center(
                child: Text(
                  'خطا در دریافت داده‌ها: ${error.toString()}',
                  style: TextStyle(color: Colors.red.shade700),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const AddEditAthletePage()),
        ),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildAthleteList(List<Athlete> athletes, WidgetRef ref) {
    final query = ref.watch(searchQueryProvider);
    final filter = ref.watch(filterProvider);

    final filteredAthletes = athletes.where((athlete) {
      final matchesSearch =
          athlete.firstName.toLowerCase().contains(query.toLowerCase()) ||
              athlete.lastName.toLowerCase().contains(query.toLowerCase());
      final matchesFilter = filter == null || athlete.gender == filter;
      return matchesSearch && matchesFilter;
    }).toList();

    if (filteredAthletes.isEmpty) {
      return const Center(
        child: Text(
          'ورزشکاری یافت نشد!',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: filteredAthletes.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (_, index) => AthleteCard(
        athlete: filteredAthletes[index],
        onDelete: () => ref.refresh(athletesProvider),
      ),
    );
  }

  void _syncData(BuildContext context, WidgetRef ref, bool isSyncing) async {
    try {
      setState(() => isSyncing = true);
      await ref.read(athleteRepositoryProvider).syncDataToSupabase();
      // ignore: unused_result
      ref.refresh(athletesProvider);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('داده‌ها با موفقیت سینک شدند'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('خطا در سینک داده‌ها: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
      debugPrint(e.toString());
    } finally {
      setState(() => isSyncing = false);
    }
  }
}

void _showFilterDialog(BuildContext context, WidgetRef ref) {
  final currentFilter = ref.watch(filterProvider);

  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: const Center(child: Text('فیلتر بر اساس جنسیت')),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _FilterOption(
            title: 'همه',
            isSelected: currentFilter == null,
            onTap: () {
              ref.read(filterProvider.notifier).state = null;
              Navigator.pop(context);
            },
          ),
          _FilterOption(
            title: 'مرد',
            isSelected: currentFilter == 'مرد',
            onTap: () {
              ref.read(filterProvider.notifier).state = 'مرد';
              Navigator.pop(context);
            },
          ),
          _FilterOption(
            title: 'زن',
            isSelected: currentFilter == 'زن',
            onTap: () {
              ref.read(filterProvider.notifier).state = 'زن';
              Navigator.pop(context);
            },
          ),
        ],
      ),
    ),
  );
}

class _FilterOption extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const _FilterOption({
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing:
          isSelected ? const Icon(Icons.check, color: AppColors.primary) : null,
      onTap: onTap,
      tileColor: isSelected ? AppColors.primary.withOpacity(0.1) : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
