import 'package:flutter/material.dart';
import '../../../../viewmodels/appointment_viewmodel.dart';
import '../widgets/completed_widget.dart';

class CompletedScreen extends StatefulWidget {
  const CompletedScreen({super.key});

  @override
  State<CompletedScreen> createState() => _CompletedScreenState();
}

class _CompletedScreenState extends State<CompletedScreen> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final completedAppointments = AppointmentViewmodel().getByStatus(
      "completed",
    );
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return ListView.separated(
      itemCount: completedAppointments.length,
      separatorBuilder: (context, index) => SizedBox(height: 12),
      itemBuilder: (context, index) {
        final appo = completedAppointments[index];
        return CompletedWidget(appo: appo);
      },
    );
  }
}
