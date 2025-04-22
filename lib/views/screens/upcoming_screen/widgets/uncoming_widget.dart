import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../widgets/line_widget.dart';

class UncomingWidget extends StatelessWidget {
  final String location;
  final String name;
  final String speciality;
  final String start;

  UncomingWidget({
    super.key,
    required this.location,
    required this.name,
    required this.speciality,
    required this.start,
  });

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
            spacing: 12,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                start,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
              ),
              LineWidget(),
              Row(
                spacing: 12,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      'https://s3-alpha-sig.figma.com/img/86b5/e652/0800f3ee36c944ded270e36c1763aaed?Expires=1745798400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=HGe25vWaTCtN1ykOKApiTrWtVZ41-ZnCs2peT-ME64gQ9TYH55WPyr~HxhvZR9pt0BT~vcDRCDMspd1707woO-epWiGXTPjw86E16DZbjGi1yxBqCQI9KzrOddGTLL2uNLAlZia2BqEMdlWPVsDheoBp6RhdIV5yAaRsRYJHcGR~t9qGQDlZAnsqa5ZNZaLtWmFuv70u-D3IaQt6zMT6XLB5Qg3uMcYd4bAwmgZl3YBU9k2RHfw7rxENbGomIGMRGYt0JCpV6gQ6z46tWF~i-cHJhZxwI3W61-n5ohPLBsDjJR7B25pVvkq5wbTcBCAdRSAV~q3GtWta~lj7Qdp11Q__',
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
                        name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        speciality,
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
                            location,
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
                    onPressed: () {},
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
