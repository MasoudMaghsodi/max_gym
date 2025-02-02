import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:max_gym/model/athleteModel/athlete_model.dart';
import 'package:max_gym/providers/athleteProviders/athlete_list_provider.dart';
import 'package:max_gym/view/profileScreen/profile_view.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');
final refreshTriggerProvider = StateProvider<int>((ref) => 0);

class HomeContent extends ConsumerStatefulWidget {
  const HomeContent({super.key});

  @override
  ConsumerState<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends ConsumerState<HomeContent> {
  Future<List<Athlete>>? _athletesFuture;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    _athletesFuture = ref.read(athleteProvider)?.getAllAthletes();
  }

  @override
  Widget build(BuildContext context) {
    final searchQuery = ref.watch(searchQueryProvider);
    final refreshCount = ref.watch(refreshTriggerProvider);

    return FutureBuilder<List<Athlete>>(
      future: _athletesFuture,
      builder: (context, snapshot) {
        return Stack(
          children: [
            Container(color: Colors.black.withOpacity(0.3)),
            _buildContent(context, snapshot, searchQuery, refreshCount),
          ],
        );
      },
    );
  }

  Widget _buildContent(
    BuildContext context,
    AsyncSnapshot<List<Athlete>> snapshot,
    String searchQuery,
    int refreshCount,
  ) {
    return RefreshIndicator(
      onRefresh: () async {
        ref.read(refreshTriggerProvider.notifier).state++;
        _loadData();
      },
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverPadding(
            padding: EdgeInsets.all(16.w),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  height: MediaQuery.of(context).size.height * 0.78,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    gradient: LinearGradient(
                      colors: [
                        Colors.grey[850]!.withOpacity(0.75),
                        Colors.grey[900]!.withOpacity(0.9),
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      if (snapshot.hasData && snapshot.data!.isNotEmpty) ...[
                        _buildSearchBar(),
                        SizedBox(height: 16.h),
                      ],
                      Expanded(
                        child: _handleSnapshot(
                          context,
                          snapshot,
                          searchQuery,
                          refreshCount,
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 8,
            offset: Offset(0, 4.h),
          )
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
            icon:
                Icon(Icons.delete_forever, color: Colors.red[400], size: 28.sp),
            onPressed: _showDeleteAllConfirmDialog,
          ),
        ],
      ),
    );
  }

  Future<void> _showDeleteAllConfirmDialog() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[850],
        title:
            Text('حذف همه ورزشکاران', style: TextStyle(color: Colors.red[300])),
        content: Text(
            'آیا مطمئن هستید که می‌خواهید تمام داده‌های کاربران را حذف کنید؟',
            style: TextStyle(color: Colors.grey[300])),
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
      await ref.read(athleteProvider)?.deleteAllAthletes();
      ref.read(refreshTriggerProvider.notifier).state++;
      _loadData();
    }
  }

  Widget _handleSnapshot(
    BuildContext context,
    AsyncSnapshot<List<Athlete>> snapshot,
    String searchQuery,
    int refreshCount,
  ) {
    final athletes = snapshot.data ?? [];
    final filteredAthletes = athletes.where((a) {
      final name = '${a.firstName} ${a.lastName}'.toLowerCase();
      return name.contains(searchQuery.toLowerCase());
    }).toList();

    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    }

    if (filteredAthletes.isEmpty) {
      return Center(child: _buildEmptyState());
    }

    return ListView.separated(
      physics: const AlwaysScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.all(16.w),
      itemCount: filteredAthletes.length,
      separatorBuilder: (_, i) => SizedBox(height: 8.h),
      itemBuilder: (context, i) {
        final athlete = filteredAthletes[i];
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProfileView(athlete: athlete),
            ),
          ),
          child: _buildAthleteCard(athlete),
        );
      },
    );
  }

  Widget _buildAthleteCard(Athlete athlete) {
    return Dismissible(
      key: Key('${athlete.id}-${ref.read(refreshTriggerProvider)}'),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 30.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          gradient: const LinearGradient(
            colors: [Colors.red, Colors.redAccent],
          ),
        ),
        child: AnimatedPadding(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.only(right: 20.w),
          child: Icon(Icons.delete_forever, color: Colors.white, size: 35.sp),
        ),
      ),
      confirmDismiss: (_) async => await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.grey[850],
          title: Text('حذف ورزشکار', style: TextStyle(color: Colors.red[300])),
          content: Text('این عمل غیرقابل بازگشت است!',
              style: TextStyle(color: Colors.grey[300])),
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
      ),
      onDismissed: (_) async {
        await ref.read(athleteProvider)?.deleteAthlete(athlete.id);
        ref.read(refreshTriggerProvider.notifier).state++;
        _loadData();
      },
      child: Material(
        borderRadius: BorderRadius.circular(12.r),
        elevation: 4,
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            gradient: LinearGradient(
              colors: [Colors.grey[800]!, Colors.grey[700]!],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 8,
                offset: Offset(0, 4.h),
              )
            ],
          ),
          child: ExpansionTile(
            collapsedIconColor: Colors.blue[200],
            iconColor: Colors.blue[200],
            title: Row(
              children: [
                Icon(Icons.sports_martial_arts,
                    color: Colors.blue[200], size: 28.sp),
                SizedBox(width: 12.w),
                Text(
                  '${athlete.firstName} ${athlete.lastName}',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey[100],
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
                    _buildInfoRow(
                        Icons.cake_outlined, 'سن', '${athlete.age} سال'),
                    _buildInfoRow(Icons.height, 'قد',
                        '${athlete.height.toStringAsFixed(1)} متر'),
                    _buildInfoRow(Icons.monitor_weight_outlined, 'وزن',
                        '${athlete.weight.toStringAsFixed(1)} کیلوگرم'),
                    _buildInfoRow(
                      Icons.transgender,
                      'جنسیت',
                      athlete.gender == Gender.male ? 'مرد' : 'زن',
                    ),
                    if (athlete.goal != null)
                      _buildInfoRow(Icons.flag_outlined, 'هدف', athlete.goal!),
                    if (athlete.coachNotes != null)
                      _buildInfoRow(Icons.comment_bank_outlined, 'یادداشت مربی',
                          athlete.coachNotes!),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.blue[200], size: 22.sp),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey[400],
                      fontWeight: FontWeight.w500,
                    )),
                SizedBox(height: 4.h),
                Text(value,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey[100],
                      fontWeight: FontWeight.w600,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.people_alt_outlined, color: Colors.grey[500], size: 70.sp),
          SizedBox(height: 20.h),
          Text('داده‌ای برای نمایش وجود ندارد',
              style: TextStyle(
                fontSize: 18.sp,
                color: Colors.grey[400],
                fontWeight: FontWeight.w700,
              )),
          SizedBox(height: 8.h),
          Text('برای افزودن ورزشکار جدید از دکمه پایین استفاده کنید',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13.sp,
                color: Colors.grey[500],
              )),
        ],
      ),
    );
  }
}
