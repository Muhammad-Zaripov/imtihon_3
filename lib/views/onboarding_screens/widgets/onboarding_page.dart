import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  final int index;
  const OnboardingPage({super.key, required this.index});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  List<String> images = [
    "assets/images/onboarding1.png",
    "assets/images/onboarding2.png",
    "assets/images/onboarding3.png",
  ];

  List<String> titles = [
    "Meet Doctors Online",
    "Connect with Specialists",
    "Thousands of Online Specialists",
  ];

  List<String> texts = [
    "Connect with Specialized Doctors Online for Convenient and Comprehensive Medical Consultations.",
    "Connect with Specialized Doctors Online for Convenient and Comprehensive Medical Consultations.",
    " Explore a Vast Array of Online Medical Specialists, Offering an Extensive Range of Expertise Tailored to Your Healthcare Needs.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            images[widget.index],
            width: 390,
            height: 532,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 28),
          SizedBox(
            width: 311,
            child: Column(
              children: [
                Text(
                  titles[widget.index],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff374151),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  texts[widget.index],
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff6B7280),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          TextButton(
            style: TextButton.styleFrom(
              fixedSize: Size(311, 48),
              backgroundColor: Color(0xff1C2A3A),
            ),
            onPressed: () {},
            child: Text(
              "Next",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 28),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8,
            children: [
              for (int i = 0; i < 3; i++)
                Container(
                  width: i == widget.index ? 30 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color:
                        i == widget.index
                            ? Color(0xff26232F)
                            : Color(0xff9B9B9B),
                  ),
                ),
            ],
          ),
          SizedBox(height: 32),
          GestureDetector(
            onTap: () {},
            child: Text(
              "Skip",
              style: TextStyle(fontSize: 14, color: Color(0xff6B7280)),
            ),
          ),
        ],
      ),
    );
  }
}
