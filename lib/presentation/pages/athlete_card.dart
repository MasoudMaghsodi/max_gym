import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isar/isar.dart';
import 'package:max_gym/core/constants/app_colors.dart';
import 'package:max_gym/data/datasources/local_datasource.dart';
import 'package:max_gym/data/datasources/remote_datasource.dart';
import 'package:max_gym/data/models/athlete_model.dart';
import 'package:max_gym/data/repositories/athlete_repository.dart';
import 'package:max_gym/presentation/pages/add_edit_athlete_page.dart';
import 'package:max_gym/presentation/widgets/custom_chip.dart';
import 'package:max_gym/services/avatar_generator.dart';
import 'package:max_gym/services/isar_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AthleteCard extends StatefulWidget {
  final Athlete athlete;

  const AthleteCard({super.key, required this.athlete});

  @override
  State<AthleteCard> createState() => _AthleteCardState();
}

class _AthleteCardState extends State<AthleteCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final needsNewPlan =
        DateTime.now().difference(widget.athlete.lastModified!).inDays > 30;

    return GestureDetector(
      onLongPress: () {
        _controller.forward().then((_) => _controller.reverse());
      },
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => AddEditAthletePage(athlete: widget.athlete),
        ),
      ),
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                // ignore: deprecated_member_use
                color: Theme.of(context).cardColor.withOpacity(0.8),
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                    // ignore: deprecated_member_use
                    color: AppColors.primary.withOpacity(0.3),
                    blurRadius: 8.r,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  if (needsNewPlan)
                    Container(
                      // ignore: deprecated_member_use
                      color: AppColors.error.withOpacity(0.8),
                      padding: EdgeInsets.symmetric(vertical: 2.h),
                      child: Center(
                        child: Text(
                          'وقت برنامه جدید!',
                          style:
                              TextStyle(color: Colors.white, fontSize: 12.sp),
                        ),
                      ),
                    ),
                  Row(
                    children: [
                      AvatarGenerator.generateAvatar(
                        widget.athlete.firstName + widget.athlete.lastName,
                        size: 40.r,
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${widget.athlete.firstName} ${widget.athlete.lastName} | ${widget.athlete.age}',
                              style: TextStyle(fontSize: 16.sp),
                            ),
                            Text(
                              widget.athlete.goal!,
                              style: TextStyle(
                                  fontSize: 14.sp, color: Colors.grey),
                            ),
                            Wrap(
                              spacing: 5.w,
                              children: widget.athlete.tags
                                  .map((tag) =>
                                      CustomChip(label: tag, isSelected: true))
                                  .toList(),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        widget.athlete.isSynced
                            ? Icons.check_circle
                            : Icons.warning,
                        color: widget.athlete.isSynced
                            ? AppColors.primary
                            : Colors.orange,
                        size: 20.r,
                      ),
                      PopupMenuButton<String>(
                        onSelected: (value) => _handleAction(value, context),
                        itemBuilder: (context) => [
                          const PopupMenuItem(
                              value: 'edit', child: Text('ویرایش')),
                          const PopupMenuItem(
                              value: 'duplicate', child: Text('کپی')),
                          const PopupMenuItem(
                              value: 'delete', child: Text('حذف')),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _handleAction(String action, BuildContext context) {
    switch (action) {
      case 'edit':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => AddEditAthletePage(athlete: widget.athlete),
          ),
        );
        break;
      case 'duplicate':
        final newAthlete = widget.athlete..id = Isar.autoIncrement;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => AddEditAthletePage(athlete: newAthlete),
          ),
        );
        break;
      case 'delete':
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('حذف ورزشکار'),
            content: const Text('آیا مطمئن هستید؟'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('خیر'),
              ),
              TextButton(
                onPressed: () async {
                  await AthleteRepository(
                    LocalDataSource(IsarService.isar),
                    RemoteDataSource(Supabase.instance.client),
                  ).deleteAthlete(widget.athlete.id);
                  // ignore: use_build_context_synchronously
                  if (mounted) Navigator.pop(context);
                  setState(() {});
                },
                child: const Text('بله'),
              ),
            ],
          ),
        );
        break;
    }
  }
}
