import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/constants/app_colors.dart';
import '../providers/providers.dart';
import 'athlete_list_item_widget.dart';

class AthleteSearch extends SearchDelegate<String> {
  final WidgetRef ref;
  final FocusNode _searchFocusNode = FocusNode(); // اضافه کردن FocusNode

  AthleteSearch(this.ref);

  @override
  void dispose() {
    _searchFocusNode.dispose(); // آزاد کردن FocusNode
    super.dispose();
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primary,
        elevation: 4,
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
        border: InputBorder.none,
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      AnimatedOpacity(
        opacity: query.isNotEmpty ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 300),
        child: IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = '';
            _searchFocusNode.unfocus(); // برداشتن فوکوس از TextField
          },
        ),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        _searchFocusNode.unfocus(); // برداشتن فوکوس از TextField
        close(context, '');
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
          itemBuilder: (context, index) {
            final athlete = filteredAthletes[index];
            return AthleteListItem(
              athlete: athlete,
              onDelete: () {
                _searchFocusNode.unfocus(); // برداشتن فوکوس بعد از حذف
              },
              onDuplicate: () {
                _searchFocusNode.unfocus(); // برداشتن فوکوس بعد از کپی
              },
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(child: Text('خطا: $error')),
    );
  }
}
