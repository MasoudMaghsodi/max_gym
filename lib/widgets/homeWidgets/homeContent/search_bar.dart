import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../providers/athleteProviders/athlete_list_provider.dart';
import '../../../view/homeScreen/home_content_view.dart';

class HomeSearchBar extends ConsumerStatefulWidget {
  const HomeSearchBar({super.key});

  @override
  ConsumerState<HomeSearchBar> createState() => _HomeSearchBarState();
}

class _HomeSearchBarState extends ConsumerState<HomeSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 8,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onChanged: (v) =>
                  ref.read(searchQueryProvider.notifier).state = v,
              style: TextStyle(fontSize: 14.sp, color: Colors.grey[100]),
              decoration: InputDecoration(
                hintText: 'جستجوی ورزشکار...',
                hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey[400]),
                border: InputBorder.none,
                icon: Icon(Icons.search, color: Colors.blue[200], size: 24.sp),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.select_all, color: Colors.blue[400], size: 28.sp),
            onPressed: _selectAllAthletes,
          ),
          IconButton(
            icon:
                Icon(Icons.delete_forever, color: Colors.red[400], size: 28.sp),
            onPressed: () => _showDeleteSelectedConfirmDialog(context),
          ),
        ],
      ),
    );
  }

  Future<void> _showDeleteSelectedConfirmDialog(BuildContext context) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[850],
        title: Text(
          'حذف ورزشکاران انتخاب شده',
          style: TextStyle(color: Colors.red[300]),
        ),
        content: Text(
          'آیا مطمئن هستید که می‌خواهید تمام ورزشکاران انتخاب شده را حذف کنید؟',
          style: TextStyle(color: Colors.grey[300]),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text('لغو', style: TextStyle(color: Colors.grey[400])),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text('حذف', style: TextStyle(color: Colors.red[400])),
          ),
        ],
      ),
    );

    if (confirm == true) {
      await _deleteSelectedAthletes();
    }
  }

  Future<void> _deleteSelectedAthletes() async {
    final provider = ref.read(athleteProvider);
    if (provider != null) {
      final selectedAthletes = ref.read(selectedAthletesProvider);
      for (final athleteId in selectedAthletes) {
        await provider.deleteAthlete(athleteId);
      }
      ref.read(selectedAthletesProvider.notifier).state = [];
      ref.read(refreshTriggerProvider.notifier).state++;
      ref.read(searchQueryProvider.notifier).state = ''; // Reset search query
    }
  }

  void _selectAllAthletes() {
    final athletesFuture = ref.read(athleteProvider)?.getAllAthletes();
    athletesFuture?.then((athletes) {
      final athleteIds = athletes.map((athlete) => athlete.id).toList();
      ref.read(selectedAthletesProvider.notifier).state = athleteIds;
    });
  }
}
