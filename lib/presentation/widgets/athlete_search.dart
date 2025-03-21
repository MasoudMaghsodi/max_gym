// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:max_gym/core/constants/app_colors.dart';
// import 'package:max_gym/presentation/providers/providers.dart';
// import 'package:max_gym/presentation/widgets/athlete_list_item_widget.dart';

// class AthleteSearch extends SearchDelegate<String> {
//   final WidgetRef ref;
//   final FocusNode _searchFocusNode = FocusNode();

//   AthleteSearch(this.ref);

//   @override
//   void dispose() {
//     _searchFocusNode.dispose();
//     super.dispose();
//   }

//   @override
//   ThemeData appBarTheme(BuildContext context) {
//     return Theme.of(context).copyWith(
//       appBarTheme: AppBarTheme(
//         backgroundColor: AppColors.primary,
//         elevation: 4,
//         iconTheme: const IconThemeData(color: Colors.white),
//       ),
//       inputDecorationTheme: InputDecorationTheme(
//         hintStyle:
//             TextStyle(color: Colors.white.withAlpha(230)), // ~0.9 opacity
//       ),
//     );
//   }

//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       AnimatedSwitcher(
//         duration: const Duration(milliseconds: 300),
//         child: query.isNotEmpty
//             ? IconButton(
//                 icon: const Icon(Icons.clear, color: Colors.white),
//                 onPressed: () {
//                   query = '';
//                   _searchFocusNode.requestFocus();
//                 },
//               )
//             : const SizedBox.shrink(),
//       ),
//     ];
//   }

//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       icon: AnimatedIcon(
//         icon: AnimatedIcons.menu_arrow,
//         progress: transitionAnimation,
//         color: Colors.white,
//       ),
//       onPressed: () {
//         close(context, '');
//       },
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     return _buildSearchResults();
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     return _buildSearchResults();
//   }

//   Widget _buildSearchResults() {
//     final lowerQuery = query.toLowerCase();

//     return ref.watch(athletesProvider).when(
//           data: (athletes) {
//             final filteredAthletes = athletes.where((athlete) {
//               return athlete.firstName.toLowerCase().contains(lowerQuery) ||
//                   athlete.lastName.toLowerCase().contains(lowerQuery);
//             }).toList();

//             if (filteredAthletes.isEmpty) {
//               return _buildEmptyState();
//             }

//             return ListView.separated(
//               padding: const EdgeInsets.only(top: 16),
//               itemCount: filteredAthletes.length,
//               separatorBuilder: (_, __) => const Divider(height: 1),
//               itemBuilder: (_, index) {
//                 final athlete = filteredAthletes[index];
//                 return AthleteListItem(
//                   athlete: athlete,
//                   onDelete: () => _refreshList(),
//                   onDuplicate: () => _refreshList(),
//                 );
//               },
//             );
//           },
//           loading: () => const Center(
//             child: CircularProgressIndicator(color: AppColors.primary),
//           ),
//           error: (error, _) => Center(
//             child: Text(
//               'خطا در دریافت داده‌ها: ${error.toString()}',
//               style: const TextStyle(color: Colors.red),
//             ),
//           ),
//         );
//   }

//   Widget _buildEmptyState() {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(Icons.search_off, size: 80, color: Colors.grey.shade400),
//           const SizedBox(height: 16),
//           Text(
//             'نتیجه‌ای یافت نشد',
//             style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
//           ),
//         ],
//       ),
//     );
//   }

//   void _refreshList() {
//     ref.invalidate(athletesProvider);
//     _searchFocusNode.unfocus();
//   }

//   @override
//   String get searchFieldLabel => 'جستجوی ورزشکار...';
// }
