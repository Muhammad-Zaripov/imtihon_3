import 'package:flutter/material.dart';
import '../../../../data_sourses/remote_datasoerse/doctor_remote_datasource.dart';
import '../../../../models/doctor_models.dart';
import '../widgets/uncoming_widget.dart';

class UpcomingScreen extends StatefulWidget {
  const UpcomingScreen({super.key});

  @override
  State<UpcomingScreen> createState() => _UpcomingScreenState();
}

class _UpcomingScreenState extends State<UpcomingScreen> {
  List<DoctorModel> doctors = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadDoctors();
  }

  void loadDoctors() async {
    final datasource = DoctorRemoteDatasource();
    final result = await datasource.getDoctors();
    setState(() {
      doctors = result;
      isLoading = false;
    });
  }

  String formatTimeOfDay(TimeOfDay time) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return "${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(height: 10),
      itemCount: doctors.length,
      itemBuilder: (context, index) {
        final doctor = doctors[index];
        return UncomingWidget(
          location: doctor.location,
          name: doctor.name,
          speciality: doctor.speciality,
          start: formatTimeOfDay(doctor.start),
        );
      },
    );
  }
}
