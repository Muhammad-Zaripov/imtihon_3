import 'package:flutter/material.dart';
import '../widgets/doctors_information_widget.dart';
import '../widgets/doctors_remove_widget.dart';

class Doctors extends StatelessWidget {
  const Doctors({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(height: 10),
      itemCount: 1,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(34)),
                ),
                context: context,
                builder: (context) {
                  return DoctorsRemoveWidget();
                },
              );
            },
            child: DoctorsInformationWidget(),
          ),
        );
      },
    );
  }
}
