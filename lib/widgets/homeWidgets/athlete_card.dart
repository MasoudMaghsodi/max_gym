import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:max_gym/model/athleteModel/athlete_model.dart';
import 'info_row.dart';

class AthleteCard extends StatelessWidget {
  final Athlete athlete;
  final VoidCallback onDelete;
  final VoidCallback onTap;

  const AthleteCard({
    super.key,
    required this.athlete,
    required this.onDelete,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Dismissible(
        key: Key(athlete.id.toString()),
        direction: DismissDirection.endToStart,
        background: _buildDismissibleBackground(),
        confirmDismiss: (_) => _showDeleteConfirmation(context),
        onDismissed: (_) => onDelete(),
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
              title: _buildTitle(),
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InfoRow(
                        icon: Icons.cake_outlined,
                        title: 'سن',
                        value: '${athlete.age} سال',
                      ),
                      InfoRow(
                        icon: Icons.height,
                        title: 'قد',
                        value: '${athlete.height.toStringAsFixed(1)} متر',
                      ),
                      InfoRow(
                        icon: Icons.monitor_weight_outlined,
                        title: 'وزن',
                        value: '${athlete.weight.toStringAsFixed(1)} کیلوگرم',
                      ),
                      InfoRow(
                        icon: Icons.transgender,
                        title: 'جنسیت',
                        value: athlete.gender == Gender.male ? 'مرد' : 'زن',
                      ),
                      if (athlete.goal != null)
                        InfoRow(
                          icon: Icons.flag_outlined,
                          title: 'هدف',
                          value: athlete.goal!,
                        ),
                      if (athlete.coachNotes != null)
                        InfoRow(
                          icon: Icons.comment_bank_outlined,
                          title: 'یادداشت مربی',
                          value: athlete.coachNotes!,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Row(
      children: [
        Icon(Icons.sports_martial_arts, color: Colors.blue[200], size: 28.sp),
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
        content: Text(
          'این عمل غیرقابل بازگشت است!',
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
  }
}
