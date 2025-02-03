import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:max_gym/model/athleteModel/athlete_model.dart';
import 'package:max_gym/view/profileScreen/profile_view.dart';
import '../../../providers/athleteProviders/athlete_list_provider.dart';
import 'info_row.dart';

class AthleteCard extends ConsumerStatefulWidget {
  final Athlete athlete;
  final VoidCallback onDelete;
  final VoidCallback onTap;
  final bool isSelected;
  final VoidCallback onSelect;

  const AthleteCard({
    super.key,
    required this.athlete,
    required this.onDelete,
    required this.onTap,
    required this.isSelected,
    required this.onSelect,
  });

  @override
  ConsumerState<AthleteCard> createState() => _AthleteCardState();
}

class _AthleteCardState extends ConsumerState<AthleteCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onSelect,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: widget.isSelected ? Colors.blue : Colors.transparent,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Dismissible(
          key: Key(widget.athlete.id.toString()),
          direction: DismissDirection.startToEnd,
          background: _buildDismissibleBackground(),
          confirmDismiss: (_) => _showDeleteConfirmation(context),
          onDismissed: (_) => _deleteAthlete(),
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
              child: Column(
                children: [
                  ListTile(
                    leading: Checkbox(
                      value: widget.isSelected,
                      onChanged: (value) {
                        widget.onSelect();
                      },
                    ),
                    title: _buildTitle(),
                    trailing: IconButton(
                      icon: Icon(Icons.copy,
                          color: Colors.blue[200], size: 24.sp),
                      onPressed: () => _duplicateAthlete(),
                    ),
                  ),
                  ExpansionTile(
                    title: const Text('اطلاعات کاربر (پروفایل)'),
                    children: [
                      ..._buildInfoRows(),
                      TextButton(
                        onPressed: () async {
                          final result = await Navigator.push<bool>(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProfileView(athlete: widget.athlete),
                            ),
                          );

                          if (result ?? false) {
                            widget.onDelete(); // رفرش لیست پس از ذخیره تغییرات
                          }
                        },
                        child: const Text(
                          'ویرایش پروفایل',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: Text('لیست تمرینات هفتگی و روزانه'),
                    children: [
                      TextButton(
                        onPressed: () {
                          // Navigate to Training List Page
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => TrainingListPage(
                          //         athleteId: widget.athlete.id),
                          //   ),
                          // );
                        },
                        child: Text(
                          'مشاهده تمرینات',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildInfoRows() {
    return [
      InfoRow(
          icon: Icons.cake_outlined,
          title: 'سن',
          value: '${widget.athlete.age} سال'),
      InfoRow(
          icon: Icons.height,
          title: 'قد',
          value: '${widget.athlete.height.toStringAsFixed(1)} متر'),
      InfoRow(
          icon: Icons.monitor_weight_outlined,
          title: 'وزن',
          value: '${widget.athlete.weight.toStringAsFixed(1)} کیلوگرم'),
      InfoRow(
          icon: Icons.transgender,
          title: 'جنسیت',
          value: widget.athlete.gender == Gender.male ? 'مرد' : 'زن'),
      if (widget.athlete.goal != null)
        InfoRow(
            icon: Icons.flag_outlined,
            title: 'هدف',
            value: widget.athlete.goal!),
      if (widget.athlete.coachNotes != null)
        InfoRow(
            icon: Icons.comment_bank_outlined,
            title: 'یادداشت مربی',
            value: widget.athlete.coachNotes!),
    ];
  }

  Widget _buildTitle() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Icon(
            Icons.sports_martial_arts,
            color: Colors.blue[200],
            size: 28.sp,
          ),
        ),
        Expanded(
          flex: 10,
          child: Text(
            '${widget.athlete.firstName} ${widget.athlete.lastName}',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: Colors.grey[100],
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1, // اضافه کردن محدودیت به یک خط
          ),
        ),
      ],
    );
  }

  Widget _buildDismissibleBackground() {
    return Container(
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
    );
  }

  Future<bool?> _showDeleteConfirmation(BuildContext context) async {
    return await showDialog<bool>(
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
    );
  }

  Future<void> _deleteAthlete() async {
    final provider = ref.read(athleteProvider);
    if (provider != null) {
      await provider.deleteAthlete(widget.athlete.id);
      widget.onDelete();
    }
  }

  Future<void> _duplicateAthlete() async {
    final provider = ref.read(athleteProvider);
    if (provider == null) return;

    final athletes = await provider.getAllAthletes();
    int copyCount = _calculateCopyCount(athletes);

    final newAthlete = Athlete()
      ..firstName = widget.athlete.firstName
      ..lastName = '${widget.athlete.lastName} ${copyCount + 1}'
      ..age = widget.athlete.age
      ..height = widget.athlete.height
      ..weight = widget.athlete.weight
      ..gender = widget.athlete.gender
      ..goal = widget.athlete.goal
      ..coachNotes = widget.athlete.coachNotes;

    await provider.addAthlete(newAthlete);
    widget.onDelete(); // Notify the parent to rebuild the UI
  }

  int _calculateCopyCount(List<Athlete> athletes) {
    int copyCount = 0;
    final baseName = '${widget.athlete.firstName} ${widget.athlete.lastName}';

    for (var a in athletes) {
      if (a.lastName.startsWith(baseName)) {
        final match = RegExp(r'(\d+)$').firstMatch(a.lastName);
        if (match != null) {
          copyCount = max(copyCount, int.parse(match.group(1)!));
        }
      }
    }
    return copyCount;
  }
}
