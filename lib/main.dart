import 'package:flutter/material.dart';
import 'package:imtihon_3/viewmodels/appointment_viewmodel.dart';
import 'package:imtihon_3/viewmodels/doctor_viewmodel.dart';
import 'package:imtihon_3/viewmodels/user_viewmodel.dart';
import 'package:imtihon_3/views/widgets/booking_history_tab_bar_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppointmentViewmodel().init();
  await DoctorViewmodel().init();
  await UserViewmodel().init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BookingHistoryTabBarWidget(),
    );
  }
}
