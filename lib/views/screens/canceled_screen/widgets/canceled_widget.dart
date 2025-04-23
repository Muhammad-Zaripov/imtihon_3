import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:imtihon_3/viewmodels/appointment_viewmodel.dart';

import '../../../../models/appoinment_models.dart';
import '../../../../models/doctor_models.dart';
import '../../../../viewmodels/doctor_viewmodel.dart';
import '../../../widgets/line_widget.dart';

class CanceledWidget extends StatefulWidget {
  final AppointmentModel appo;
  final VoidCallback onDelete;
  const CanceledWidget({super.key, required this.appo, required this.onDelete});

  @override
  State<CanceledWidget> createState() => _CanceledWidgetState();
}

class _CanceledWidgetState extends State<CanceledWidget> {
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${widget.appo.date.toLocal().toIso8601String().split("T")[0]} / ${widget.appo.time.format(context)}',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 12),
              LineWidget(),
              SizedBox(height: 12),
              Row(
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
                  SizedBox(width: 12),
                  Column(
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
                        children: [
                          SvgPicture.asset('assets/svgs/location.svg'),
                          SizedBox(width: 4),
                          Text(
                            doctor!.location,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 12),
              LineWidget(),
              SizedBox(height: 12),
              FilledButton(
                onPressed: () async {
                  await AppointmentViewmodel().delete(widget.appo.id);
                  setState(() {
                    widget.onDelete();
                  });
                },
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.grey.shade300,
                  minimumSize: Size(double.infinity, 37),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: Text('Delete', style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
