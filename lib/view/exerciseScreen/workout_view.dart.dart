import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import '../../model/dayModel/week_day_model.dart';
import '../../providers/isarProviders/isar_provider.dart';

class WorkoutPage extends ConsumerStatefulWidget {
  const WorkoutPage({super.key});

  @override
  ConsumerState<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends ConsumerState<WorkoutPage> {
  late final ScrollController _scrollController;
  List<WeekDay> weekDays = [];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _loadWeekDays();
  }

  Future<void> _loadWeekDays() async {
    final isar = await ref.read(isarProvider.future);
    final days = await isar.weekDays.where().findAll();

    if (days.isEmpty) {
      final initialDays = WeekDay.initialDays();
      await isar.writeTxn(() => isar.weekDays.putAll(initialDays));
      weekDays = initialDays;
    } else {
      weekDays = days..sort((a, b) => a.day.index.compareTo(b.day.index));
    }
    if (mounted) setState(() {});
  }

  Future<void> _updateDay(WeekDay updatedDay) async {
    final isar = await ref.read(isarProvider.future);
    await isar.writeTxn(() => isar.weekDays.put(updatedDay));
    final index = weekDays.indexWhere((d) => d.id == updatedDay.id);
    if (index != -1) {
      weekDays[index] = updatedDay;
      if (mounted) setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBlurredBackground(),
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar.large(
                title: const Text('برنامه هفتگی'),
                backgroundColor: Colors.transparent,
              ),
              if (weekDays.isEmpty)
                const SliverFillRemaining(
                  child: Center(child: CircularProgressIndicator()),
                )
              else
                SliverPadding(
                  padding: const EdgeInsets.all(16.0),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => GlassyCard(
                        day: weekDays[index],
                        onToggle: _updateDay,
                      ),
                      childCount: weekDays.length,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBlurredBackground() {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/image/max.jpg'),
            fit: BoxFit.cover,
            opacity: 0.5,
          ),
        ),
        child: Container(
          color: Colors.black.withOpacity(0.3),
        ),
      ),
    );
  }
}

class GlassyCard extends StatelessWidget {
  final WeekDay day;
  final Future<void> Function(WeekDay) onToggle;

  const GlassyCard({
    super.key,
    required this.day,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: _getCardColor(context),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => onToggle(day.copyWith(isActive: !day.isActive)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      day.persianName,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: _getTextColor(day.isActive),
                      ),
                    ),
                  ),
                  _buildToggleButton(),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                day.targetMuscleGroups.isNotEmpty
                    ? day.targetMuscleGroups.join(', ')
                    : 'بدون تمرین',
                style: TextStyle(
                  fontSize: 16,
                  color: day.isActive ? Colors.white70 : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildToggleButton() {
    return IconButton(
      icon: Icon(
        day.isActive ? Icons.toggle_on : Icons.toggle_off,
        size: 32,
        color: day.isActive ? Colors.green : Colors.grey,
      ),
      onPressed: () => onToggle(day.copyWith(isActive: !day.isActive)),
    );
  }

  Color _getCardColor(BuildContext context) {
    return day.isActive
        ? Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3)
        : Colors.grey.withOpacity(0.2);
  }

  Color _getTextColor(bool isActive) {
    return isActive ? Colors.white : Colors.grey[800]!;
  }
}
