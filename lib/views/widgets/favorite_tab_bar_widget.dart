import 'package:flutter/material.dart';

import '../screens/doctors_screen/screen/doctors_screen.dart';
import '../screens/hospitals_screen/screen/hospitals_screen.dart';

class FavoriteTabBarWidget extends StatefulWidget {
  const FavoriteTabBarWidget({super.key});

  @override
  State<FavoriteTabBarWidget> createState() => _FavoriteTabBarWidgetState();
}

class _FavoriteTabBarWidgetState extends State<FavoriteTabBarWidget> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'Favorites',
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
            tabs: [Tab(text: 'Doctors'), Tab(text: 'Hospitals')],
            indicatorColor: Colors.black,
            indicatorWeight: 4,
            indicatorSize: TabBarIndicatorSize.label,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: TabBarView(children: [Doctors(), Hospitals()]),
        ),
      ),
    );
  }
}
