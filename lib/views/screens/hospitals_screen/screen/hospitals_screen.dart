import 'package:flutter/material.dart';
import '../widgets/hospitals_information_widget.dart';

class Hospitals extends StatelessWidget {
  const Hospitals({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(height: 10),
      itemCount: 1,
      itemBuilder: (context, index) {
        return HospitalsInformationWidget();
      },
    );
  }
}
