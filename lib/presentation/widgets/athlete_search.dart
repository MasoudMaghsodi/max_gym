import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/providers.dart';
import '../widgets/athlete_list_item_widget.dart';

class AthleteSearch extends SearchDelegate<String> {
  final WidgetRef ref;

  AthleteSearch(this.ref);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        // ignore: null_check_always_fails
        close(context, null!);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildSearchResults();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildSearchResults();
  }

  Widget _buildSearchResults() {
    final athletesAsync = ref.watch(athletesProvider);

    return athletesAsync.when(
      data: (athletes) {
        final filteredAthletes = athletes
            .where((athlete) =>
                athlete.firstName.toLowerCase().contains(query.toLowerCase()) ||
                athlete.lastName.toLowerCase().contains(query.toLowerCase()))
            .toList();

        return ListView.builder(
          itemCount: filteredAthletes.length,
          itemBuilder: (_, index) =>
              AthleteListItem(athlete: filteredAthletes[index]),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(child: Text('خطا: $error')),
    );
  }
}
