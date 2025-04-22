import 'package:flutter/material.dart';
import '../../../../viewmodels/appointment_viewmodel.dart';
import '../widgets/completed_widget.dart';

class CompletedScreen extends StatefulWidget {
  const CompletedScreen({super.key});

  @override
  State<CompletedScreen> createState() => _CompletedScreenState();
}

class _CompletedScreenState extends State<CompletedScreen> {
  final controller = AppointmentController();

  @override
  void initState() {
    super.initState();
    controller.init().then((_) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final completedAppointments = controller.getByStatus("completed");
    return ListView.separated(
      padding: EdgeInsets.all(16),
      itemCount: completedAppointments.length,
      separatorBuilder: (context, index) => SizedBox(height: 12),
      itemBuilder: (context, index) {
        return CompletedWidget(appointment: completedAppointments[index]);
      },
    );
  }
}
