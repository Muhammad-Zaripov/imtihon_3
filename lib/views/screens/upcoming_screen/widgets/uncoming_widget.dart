import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:imtihon_3/models/appoinment_models.dart';
import 'package:imtihon_3/viewmodels/appointment_viewmodel.dart';

import '../../../../models/doctor_models.dart';
import '../../../../viewmodels/doctor_viewmodel.dart';
import '../../../widgets/line_widget.dart';

class UncomingWidget extends StatefulWidget {
  final AppointmentModel appo;
  final VoidCallback onUpdate;
  const UncomingWidget({super.key, required this.appo, required this.onUpdate});

  @override
  State<UncomingWidget> createState() => _UncomingWidgetState();
}

class _UncomingWidgetState extends State<UncomingWidget> {
  DoctorModel? doctor;
  @override
  void initState() {
    doctor = DoctorViewmodel().getDoctorFromId(widget.appo.doctorId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 5,
              spreadRadius: 1.5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            spacing: 12,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${widget.appo.date.toLocal().toIso8601String().split('T')[0]} / ${widget.appo.time.format(context)}',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
              ),
              LineWidget(),
              Row(
                spacing: 12,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      doctor!.locationImage,
                      width: 109,
                      height: 109,
                      fit: BoxFit.cover,
                    ),
                  ),

                  Column(
                    spacing: 8,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doctor!.name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        doctor!.speciality,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      Row(
                        spacing: 4,
                        children: [
                          SvgPicture.asset('assets/svgs/location.svg'),
                          Text(
                            doctor!.location,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              LineWidget(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FilledButton(
                    onPressed: () {
                      setState(() async {
                        await AppointmentViewmodel().updateStatus(
                          widget.appo.id,
                          "canceled",
                        );
                        widget.onUpdate();
                      });
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.grey.shade300,
                      minimumSize: Size(147, 37),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  FilledButton(
                    onPressed: () {},
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.black,
                      minimumSize: Size(147, 37),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: Text(
                      'Reschedule',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
