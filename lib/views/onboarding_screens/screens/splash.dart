import 'dart:async';

import 'package:flutter/material.dart';
import 'package:imtihon_3/models/user_model.dart';
import 'package:imtihon_3/repository/user_local_repository.dart';
import 'package:imtihon_3/views/onboarding_screens/screens/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  UserModel? user;

  @override
  void initState() {
    super.initState();
    _checkLogin();
  }

  Future<void> _checkLogin() async {
    UserLocalRepository local = UserLocalRepository();
    local.getUser().then((value) {
      user = value;
    });
    Timer(Duration(seconds: 3), () {
      if (user != null) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (ctx) => Placeholder()),
          (value) => false,
        );
      } else {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (ctx) => OnboardingScreen()),
          (value) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Image.asset(
        "assets/images/splash.png",
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
