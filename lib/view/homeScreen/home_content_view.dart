import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../model/athleteModel/athlete_model.dart';
import '../../providers/athleteProviders/athlete_list_provider.dart';

// Provider برای مدیریت متن جستجو
final searchQueryProvider = StateProvider<String>((ref) => '');

class HomeContent extends ConsumerWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final athleteController = ref.watch(athleteProvider);
    final athletesFuture = athleteController.getAllAthletes();
    final searchQuery = ref.watch(searchQueryProvider);

    return FutureBuilder<List<Athlete>>(
      future: athletesFuture,
      builder: (context, snapshot) {
        return Stack(
          children: [
            // لایه overlay برای بهبود خوانایی
            Container(
              color: Colors.black.withValues(alpha: 0.4),
            ),
            _buildContent(snapshot, searchQuery, ref),
          ],
        );
      },
    );
  }

  Widget _buildContent(
    AsyncSnapshot<List<Athlete>> snapshot,
    String searchQuery,
    WidgetRef ref,
  ) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: Colors.grey[850]!.withValues(alpha: 0.9),
        ),
        child: Column(
          children: [
            // نمایش باکس سرچ فقط اگر لیست ورزشکاران خالی نباشد
            if (snapshot.hasData && snapshot.data!.isNotEmpty)
              Column(
                children: [
                  _buildSearchBar(ref),
                  SizedBox(height: 16.h),
                ],
              ),
            // لیست ورزشکاران
            Expanded(
              child: _handleSnapshot(snapshot, searchQuery),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar(WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(12.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: TextField(
        onChanged: (value) {
          ref.read(searchQueryProvider.notifier).state = value;
        },
        style: TextStyle(
          fontSize: 14.sp,
          color: Colors.grey[100],
        ),
        decoration: InputDecoration(
          hintText: 'جستجوی ورزشکار...',
          hintStyle: TextStyle(
            fontSize: 14.sp,
            color: Colors.grey[400],
          ),
          border: InputBorder.none,
          icon: Icon(
            Icons.search,
            color: Colors.blue[200],
            size: 24.sp,
          ),
        ),
      ),
    );
  }

  Widget _handleSnapshot(
      AsyncSnapshot<List<Athlete>> snapshot, String searchQuery) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return Center(
        child: CircularProgressIndicator(
          color: Colors.blue[200],
          strokeWidth: 3,
        ),
      );
    }

    if (snapshot.hasError) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              color: Colors.red[300],
              size: 40.sp,
            ),
            SizedBox(height: 16.h),
            Text(
              'خطا در ارتباط با سرور!',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Colors.red[300],
              ),
            ),
          ],
        ),
      );
    }

    if (!snapshot.hasData || snapshot.data!.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.people_alt_outlined,
              color: Colors.grey[400],
              size: 60.sp,
            ),
            SizedBox(height: 16.h),
            Text(
              'لیست ورزشکاران خالی است',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: Colors.grey[300],
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'برای افزودن ورزشکار جدید از منوی پایین استفاده کنید',
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey[400],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    // فیلتر کردن لیست بر اساس جستجو
    final filteredAthletes = snapshot.data!.where((athlete) {
      final fullName = '${athlete.firstName} ${athlete.lastName}'.toLowerCase();
      return fullName.contains(searchQuery.toLowerCase());
    }).toList();

    if (filteredAthletes.isEmpty) {
      return Center(
        child: Text(
          'هیچ ورزشکاری با این نام یافت نشد!',
          style: TextStyle(
            fontSize: 16.sp,
            color: Colors.grey[300],
          ),
        ),
      );
    }

    return ListView.separated(
      padding: EdgeInsets.all(16.w),
      itemCount: filteredAthletes.length,
      separatorBuilder: (context, index) => SizedBox(height: 12.h),
      itemBuilder: (context, index) {
        final athlete = filteredAthletes[index];
        return _buildExpandableAthleteCard(athlete);
      },
    );
  }

  Widget _buildExpandableAthleteCard(Athlete athlete) {
    return Material(
      borderRadius: BorderRadius.circular(12.r),
      elevation: 4,
      color: Colors.grey[800],
      child: ExpansionTile(
        title: Row(
          children: [
            Icon(
              Icons.person_pin,
              color: Colors.blue[200],
              size: 28.sp,
            ),
            SizedBox(width: 12.w),
            Text(
              '${athlete.firstName} ${athlete.lastName}',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Colors.grey[100],
                shadows: [
                  Shadow(
                    color: Colors.black.withValues(alpha: 0.3),
                    blurRadius: 2,
                    offset: Offset(1, 1),
                  )
                ],
              ),
            ),
          ],
        ),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInfoRow(Icons.cake, 'سن', '${athlete.age} سال'),
                _buildInfoRow(Icons.height, 'قد',
                    '${athlete.height.toStringAsFixed(1)} متر'),
                _buildInfoRow(Icons.monitor_weight, 'وزن',
                    '${athlete.weight.toStringAsFixed(1)} کیلوگرم'),
                _buildInfoRow(
                  Icons.transgender,
                  'جنسیت',
                  athlete.gender == Gender.male ? 'مرد' : 'زن',
                ),
                if (athlete.goal != null)
                  _buildInfoRow(Icons.flag, 'هدف', athlete.goal!),
                if (athlete.coachNotes != null)
                  _buildInfoRow(Icons.comment, 'نظر مربی', athlete.coachNotes!),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: Colors.blue[200],
            size: 20.sp,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey[400],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey[100],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
