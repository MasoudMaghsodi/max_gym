import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/providers.dart';
import '../widgets/athlete_list_item_widget.dart';
import '../widgets/athlete_search.dart';
import 'add_edit_athlete_page.dart';

class AthleteListPage extends ConsumerWidget {
  const AthleteListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final athletesAsync = ref.watch(athletesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('لیست ورزشکاران'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () =>
                showSearch(context: context, delegate: AthleteSearch(ref)),
          ),
        ],
      ),
      body: athletesAsync.when(
        data: (athletes) => athletes.isEmpty
            ? const Center(child: Text('ورزشکاری وجود ندارد!'))
            : ListView.builder(
                itemCount: athletes.length,
                itemBuilder: (_, index) =>
                    AthleteListItem(athlete: athletes[index]),
              ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('خطا: $error')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (_) => const AddEditAthletePage())),
        child: const Icon(Icons.add),
      ),
    );
  }
}
