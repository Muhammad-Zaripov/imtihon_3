import 'package:flutter/material.dart';
import '../../../../viewmodels/appointment_viewmodel.dart';
import '../widgets/canceled_widget.dart';

class CanceledScreen extends StatefulWidget {
  const CanceledScreen({super.key});

  @override
  State<CanceledScreen> createState() => _CanceledScreenState();
}

class _CanceledScreenState extends State<CanceledScreen> {
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
    final completedAppointments = controller.getByStatus("canceled");
    return ListView.separated(
      padding: EdgeInsets.all(16),
      itemCount: completedAppointments.length,
      separatorBuilder: (context, index) => SizedBox(height: 12),
      itemBuilder: (context, index) {
        return CanceledWidget(appointment: completedAppointments[index]);
      },
    );
  }
}
