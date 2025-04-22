import 'package:flutter/material.dart';
import 'views/widgets/booking_history_tab_bar_widget.dart';

void main() {
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
