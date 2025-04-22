import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../widgets/line_widget.dart';

class HospitalsInformationWidget extends StatelessWidget {
  const HospitalsInformationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 5,
              spreadRadius: 1.5,
              offset: Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  child: Image.network(
                    'https://s3-alpha-sig.figma.com/img/9f50/e360/edb80c5d0e9f43d9cc9e7c48030fa945?Expires=1745798400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=WgjmBHsm3fqh~z2RuWa-smnsQnUG3Wcy297sTuxvwGCfI9C9BCANvNDJ2V1qiDLMOrWvNbLwKpvwdY~SGT1JDPRYk~rrFnAVg8j2YR3vBrTLiC0MW8Oc3-3MrIUXOMUociLqeYi6FT0FtuNPAtlXvKLKP9oM1RMPnFkqm00nXdHRgvRLmGk3POZI3j6coH7FYlbqNwMcTB6C~UU2qWKsN1YDSRdbWfhrvPnmSEd0bsOzdkNcCFmQQjyGJ9rNFkXD-4EeIBJjt9kd4RcRgAJLbciEIYA8rIwSt7cQMXCc5L9md~ZnX3G8RmPeQySoaV-JhGJPnzhp1okOQpT71JvSPg__',
                    height: 121,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 8,
                  top: 8,
                  child: InkWell(
                    child: SvgPicture.asset('assets/svgs/best_favorite.svg'),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sunrise Health Clinic',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 8),
                  Row(
                    spacing: 4,
                    children: [
                      SvgPicture.asset('assets/svgs/location.svg'),
                      Text(
                        '123 Oak Street, CA 98765',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        '5.0',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      SizedBox(width: 4),
                      ...List.generate(
                        5,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2.0),
                          child: SvgPicture.asset(
                            'assets/svgs/star.svg',
                            width: 10,
                            height: 10,
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        '(128 Reviews)',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 12),
                  LineWidget(),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        spacing: 4,
                        children: [
                          SvgPicture.asset('assets/svgs/routing.svg'),
                          Text(
                            '2.5 km/40min',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        spacing: 4,
                        children: [
                          SvgPicture.asset('assets/svgs/hospital.svg'),
                          Text(
                            'Hospital',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
