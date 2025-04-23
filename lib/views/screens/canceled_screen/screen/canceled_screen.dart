import 'package:flutter/material.dart';
import 'package:imtihon_3/models/appoinment_models.dart';
import '../../../../viewmodels/appointment_viewmodel.dart';
import '../widgets/canceled_widget.dart';

class CanceledScreen extends StatefulWidget {
  const CanceledScreen({super.key});

  @override
  State<CanceledScreen> createState() => _CanceledScreenState();
}

class _CanceledScreenState extends State<CanceledScreen> {
  bool isLoading = false;

  List<AppointmentModel> completedAppointments = [];
  @override
  void initState() {
    completedAppointments = AppointmentViewmodel().getByStatus("canceled");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: completedAppointments.length,
      separatorBuilder: (context, index) => SizedBox(height: 12),
      itemBuilder: (context, index) {
        final appo = completedAppointments[index];
        return CanceledWidget(
          appo: appo,
          onDelete: () {
            setState(() {
              completedAppointments = AppointmentViewmodel().getByStatus(
                "canceled",
              );
            });
          },
        );
      },
    );
  }
}
