import 'package:flutter/material.dart';
import 'package:imtihon_3/models/appoinment_models.dart';
import '../../../../viewmodels/appointment_viewmodel.dart';
import '../widgets/uncoming_widget.dart';

class UpcomingScreen extends StatefulWidget {
  const UpcomingScreen({super.key});

  @override
  State<UpcomingScreen> createState() => _UpcomingScreenState();
}

class _UpcomingScreenState extends State<UpcomingScreen> {
  bool isLoading = false;
  List<AppointmentModel> completedAppointments = [];

  @override
  void initState() {
    completedAppointments = AppointmentViewmodel().getByStatus("upcoming");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(height: 10),
      itemCount: completedAppointments.length,
      itemBuilder: (context, index) {
        final appo = completedAppointments[index];

        return UncomingWidget(
          appo: appo,
          onUpdate: () {
            setState(() {
              completedAppointments = AppointmentViewmodel().getByStatus(
                "upcoming",
              );
            });
          },
        );
      },
    );
  }
}
