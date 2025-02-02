import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:max_gym/model/athleteModel/athlete_model.dart';
import 'package:max_gym/providers/athleteProviders/athlete_list_provider.dart';
import 'package:max_gym/view/profileScreen/profile_view.dart';

import '../../widgets/homeWidgets/athlete_card.dart';
import '../../widgets/homeWidgets/empty_state.dart';
import '../../widgets/homeWidgets/search_bar.dart';

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
    return FutureBuilder<List<Athlete>>(
      future: _athletesFuture,
      builder: (context, snapshot) {
        return Stack(
          children: [
            Container(color: Colors.black.withOpacity(0.3)),
            _buildContent(context, snapshot),
          ],
        );
      },
    );
  }

  Widget _buildContent(
    BuildContext context,
    AsyncSnapshot<List<Athlete>> snapshot,
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
                        const HomeSearchBar(),
                        SizedBox(height: 16.h),
                      ],
                      Expanded(
                        child: _handleSnapshot(context, snapshot),
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

  Widget _handleSnapshot(
    BuildContext context,
    AsyncSnapshot<List<Athlete>> snapshot,
  ) {
    final searchQuery = ref.watch(searchQueryProvider);
    final athletes = snapshot.data ?? [];
    final filteredAthletes = athletes.where((a) {
      final name = '${a.firstName} ${a.lastName}'.toLowerCase();
      return name.contains(searchQuery.toLowerCase());
    }).toList();

    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    }

    if (filteredAthletes.isEmpty) {
      return const EmptyState();
    }

    return ListView.separated(
      physics: const AlwaysScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.all(16.w),
      itemCount: filteredAthletes.length,
      separatorBuilder: (_, i) => SizedBox(height: 8.h),
      itemBuilder: (context, i) {
        final athlete = filteredAthletes[i];
        return AthleteCard(
          athlete: athlete,
          onDelete: () => _loadData(),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProfileView(athlete: athlete),
            ),
          ),
        );
      },
    );
  }
}
