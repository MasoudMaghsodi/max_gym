import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:max_gym/presentation/pages/athlete_card.dart';
import '../../core/constants/app_colors.dart';
import '../../data/models/athlete_model.dart';
import '../providers/providers.dart';
import 'add_edit_athlete_page.dart';

class AthleteListPage extends ConsumerStatefulWidget {
  const AthleteListPage({super.key});

  @override
  ConsumerState<AthleteListPage> createState() => _AthleteListPageState();
}

class _AthleteListPageState extends ConsumerState<AthleteListPage> {
  late TextEditingController _searchController;

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
        actions: [
          IconButton(
            icon: const Icon(Icons.sync),
            onPressed: () => _syncData(context, ref),
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () => _showFilterDialog(context, ref),
          ),
        ],
      ),
      body: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'جستجوی ورزشکار...',
                prefixIcon: const Icon(Icons.search),
                border: InputBorder.none,
              ),
              onChanged: (query) {
                ref.read(searchQueryProvider.notifier).state = query;
              },
            ),
          ),
          Expanded(
            child: athletesAsync.when(
              data: (athletes) => _buildAthleteList(athletes, ref),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, _) => Center(child: Text('خطا: $error')),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const AddEditAthletePage()),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildAthleteList(List<Athlete> athletes, WidgetRef ref) {
    final query = ref.watch(searchQueryProvider);
    final filteredAthletes = athletes.where((athlete) {
      return athlete.firstName.toLowerCase().contains(query.toLowerCase()) ||
          athlete.lastName.toLowerCase().contains(query.toLowerCase());
    }).toList();

    if (filteredAthletes.isEmpty) {
      return const Center(child: Text('ورزشکاری یافت نشد!'));
    }

    return ListView.builder(
      itemCount: filteredAthletes.length,
      itemBuilder: (_, index) => AthleteCard(athlete: filteredAthletes[index]),
    );
  }
}

void _showFilterDialog(BuildContext context, WidgetRef ref) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: const Text('فیلتر بر اساس جنسیت'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: const Text('همه'),
            onTap: () {
              ref.read(filterProvider.notifier).state = null;
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('مرد'),
            onTap: () {
              ref.read(filterProvider.notifier).state = 'مرد';
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('زن'),
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

void _syncData(BuildContext context, WidgetRef ref) async {
  try {
    await ref.read(athleteRepositoryProvider).syncDataToSupabase();
    // ignore: unused_result
    ref.refresh(athletesProvider);
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('داده‌ها با موفقیت سینک شدند')),
    );
  } catch (e) {
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('خطا در سینک داده‌ها: $e')),
    );
    debugPrint(e.toString());
  }
}
