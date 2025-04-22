import 'package:flutter/material.dart';
import '../screens/canceled_screen/screen/canceled_screen.dart';
import '../screens/completed_screen/screen/completed_screen.dart';
import '../screens/upcoming_screen/screen/upcoming_screen.dart';

class BookingHistoryTabBarWidget extends StatefulWidget {
  const BookingHistoryTabBarWidget({super.key});

  @override
  State<BookingHistoryTabBarWidget> createState() =>
      _BookingHistoryTabBarWidgetState();
}

class _BookingHistoryTabBarWidgetState
    extends State<BookingHistoryTabBarWidget> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'My Bookings',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          bottom: TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            unselectedLabelStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            tabs: [
              Tab(text: 'Upcoming'),
              Tab(text: 'Completed'),
              Tab(text: 'Canceled'),
            ],
            indicatorColor: Colors.black,
            indicatorWeight: 4,
            indicatorSize: TabBarIndicatorSize.label,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: TabBarView(
            children: [UpcomingScreen(), CompletedScreen(), CanceledScreen()],
          ),
        ),
      ),
    );
  }
}
