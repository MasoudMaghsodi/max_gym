import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:max_gym/core/constants/app_colors.dart';
import 'package:max_gym/data/datasources/local_datasource.dart';
import 'package:max_gym/data/datasources/remote_datasource.dart';
import 'package:max_gym/data/models/athlete_model.dart';
import 'package:max_gym/data/repositories/athlete_repository.dart';
import 'package:max_gym/presentation/widgets/progress_chart_widget.dart';
import 'package:max_gym/services/avatar_generator.dart';
import 'package:max_gym/services/isar_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AddEditAthletePage extends StatefulWidget {
  final Athlete? athlete;

  const AddEditAthletePage({super.key, this.athlete});

  @override
  State<AddEditAthletePage> createState() => _AddEditAthletePageState();
}

class _AddEditAthletePageState extends State<AddEditAthletePage> {
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _ageController;
  late TextEditingController _heightController;
  late TextEditingController _weightController;
  late TextEditingController _genderController;
  late TextEditingController _goalController;
  late TextEditingController _coachNoteController;
  late TextEditingController _tagsController;
  final _formKey = GlobalKey<FormState>();
  late Athlete _athlete;

  @override
  void initState() {
    super.initState();
    _athlete = widget.athlete ??
        Athlete(
          firstName: '',
          lastName: '',
          age: 0,
          height: 0,
          weight: 0,
          gender: '',
          goal: '',
          coachNote: '',
        );
    _firstNameController = TextEditingController(text: _athlete.firstName);
    _lastNameController = TextEditingController(text: _athlete.lastName);
    _ageController = TextEditingController(text: _athlete.age.toString());
    _heightController = TextEditingController(text: _athlete.height.toString());
    _weightController = TextEditingController(text: _athlete.weight.toString());
    _genderController = TextEditingController(text: _athlete.gender);
    _goalController = TextEditingController(text: _athlete.goal);
    _coachNoteController = TextEditingController(text: _athlete.coachNote);
    _tagsController = TextEditingController(text: _athlete.tags.join(', '));
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _ageController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    _genderController.dispose();
    _goalController.dispose();
    _coachNoteController.dispose();
    _tagsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.primary, Colors.black],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Row(
          children: [
            AvatarGenerator.generateAvatar(
              _firstNameController.text + _lastNameController.text,
              size: 40.r,
            ),
            SizedBox(width: 10.w),
            Text('${_firstNameController.text} ${_lastNameController.text}'),
          ],
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              tabs: [
                Tab(text: 'اطلاعات', icon: Icon(Icons.person, size: 20.r)),
                Tab(text: 'پیشرفت', icon: Icon(Icons.trending_up, size: 20.r)),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildInfoTab(),
                  _buildProgressTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoTab() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _firstNameController,
              decoration: const InputDecoration(
                  labelText: 'نام', prefixIcon: Icon(Icons.person)),
              validator: (value) =>
                  value!.isEmpty ? 'لطفاً نام را وارد کنید' : null,
            ),
            TextFormField(
              controller: _lastNameController,
              decoration: const InputDecoration(
                  labelText: 'نام خانوادگی', prefixIcon: Icon(Icons.person)),
              validator: (value) =>
                  value!.isEmpty ? 'لطفاً نام خانوادگی را وارد کنید' : null,
            ),
            TextFormField(
              controller: _ageController,
              decoration: const InputDecoration(
                  labelText: 'سن', prefixIcon: Icon(Icons.cake)),
              keyboardType: TextInputType.number,
              validator: (value) =>
                  value!.isEmpty ? 'لطفاً سن را وارد کنید' : null,
            ),
            TextFormField(
              controller: _heightController,
              decoration: const InputDecoration(
                  labelText: 'قد (cm)', prefixIcon: Icon(Icons.height)),
              keyboardType: TextInputType.number,
              validator: (value) =>
                  value!.isEmpty ? 'لطفاً قد را وارد کنید' : null,
            ),
            TextFormField(
              controller: _weightController,
              decoration: const InputDecoration(
                  labelText: 'وزن (kg)',
                  prefixIcon: Icon(Icons.fitness_center)),
              keyboardType: TextInputType.number,
              validator: (value) =>
                  value!.isEmpty ? 'لطفاً وزن را وارد کنید' : null,
            ),
            TextFormField(
              controller: _genderController,
              decoration: const InputDecoration(
                  labelText: 'جنسیت', prefixIcon: Icon(Icons.wc)),
              validator: (value) =>
                  value!.isEmpty ? 'لطفاً جنسیت را وارد کنید' : null,
            ),
            TextFormField(
              controller: _goalController,
              decoration: const InputDecoration(
                  labelText: 'هدف', prefixIcon: Icon(Icons.flag)),
              validator: (value) =>
                  value!.isEmpty ? 'لطفاً هدف را وارد کنید' : null,
            ),
            TextFormField(
              controller: _coachNoteController,
              decoration: const InputDecoration(
                  labelText: 'یادداشت مربی', prefixIcon: Icon(Icons.note)),
            ),
            TextFormField(
              controller: _tagsController,
              decoration: const InputDecoration(
                  labelText: 'تگ‌ها (با , جدا کنید)',
                  prefixIcon: Icon(Icons.local_offer)),
            ),
            SizedBox(height: 20.h),
            ElevatedButton(
              onPressed: _saveAthlete,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r)),
              ),
              child: const Text('ثبت نهایی'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressTab() {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: ProgressChartWidget(athleteId: _athlete.id),
    );
  }

  void _saveAthlete() async {
    if (_formKey.currentState!.validate()) {
      _athlete = _athlete.copyWith(
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        age: int.parse(_ageController.text),
        height: double.parse(_heightController.text),
        weight: double.parse(_weightController.text),
        gender: _genderController.text,
        goal: _goalController.text,
        coachNote: _coachNoteController.text,
        tags: _tagsController.text.split(',').map((tag) => tag.trim()).toList(),
      );
      final repo = AthleteRepository(
        LocalDataSource(IsarService.isar),
        RemoteDataSource(Supabase.instance.client),
      );
      await repo.saveAthlete(_athlete);
      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('ورزشکار ذخیره شد')),
        );
      }
    }
  }
}

extension AthleteExtension on Athlete {
  Athlete copyWith({
    String? firstName,
    String? lastName,
    int? age,
    double? height,
    double? weight,
    String? gender,
    String? goal,
    String? coachNote,
    List<String>? tags,
  }) {
    return Athlete(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      age: age ?? this.age,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      gender: gender ?? this.gender,
      goal: goal ?? this.goal,
      coachNote: coachNote ?? this.coachNote,
      tags: tags ?? this.tags,
      lastModified: DateTime.now(),
    )..id = id;
  }
}
