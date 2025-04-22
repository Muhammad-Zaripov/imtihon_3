import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../widgets/line_widget.dart';

class DoctorsRemoveWidget extends StatelessWidget {
  const DoctorsRemoveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(34),
        color: Colors.white,
      ),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Remove from Favorites?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 16),
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey.shade300,
            ),
            SizedBox(height: 16),
            Container(
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
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        'https://s3-alpha-sig.figma.com/img/ab8e/d8d0/b0db1e98ab7f1a31afba13769f282033?Expires=1745798400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=MoF7A4LPGCUIFu~qkeH3-ZMww8XTx~7J74dwmn-V6j5ttwOpP6xcxMl2BcMqdZYfZllllg~AzCQ0GB-g53I2WDUFj2rUxd7Yvw7jlddXilJxEf9zTTXSOFJtClBNsO7~NU5vwF~~a2bEt0cBQj1Pu7KvmIPfBWXadC~RZnLScBJ0cxZb-QL0kh3ekbyanBMIv9-TBSWBHGHrB8Ke1d-wjfyVhhWa2cjsqd400F2qGmG5iaJc3ge7KwBXTd3eOJC5sZQwR~HHUsDvHvkGGCSxbX1b9cYxQeCsEdOAqAoRhpIT37dcJRcEjB9v0J2hI6TyjCYac2j~uybS9j5Cp2BDvA__',
                        width: 109,
                        height: 109,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Dr. David Patel',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              InkWell(
                                child: SvgPicture.asset(
                                  'assets/svgs/favorite.svg',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          LineWidget(),
                          SizedBox(height: 8),
                          Text(
                            'Cardiologist',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.shade700,
                            ),
                          ),
                          SizedBox(height: 4),
                          Row(
                            children: [
                              SvgPicture.asset('assets/svgs/location.svg'),
                              SizedBox(width: 4),
                              Text(
                                'Tashkent, Chilonzor',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 4),
                          Row(
                            spacing: 10,
                            children: [
                              SvgPicture.asset('assets/svgs/star.svg'),
                              Text(
                                '5',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                              Container(
                                width: 1,
                                height: 13,
                                color: Colors.grey,
                              ),
                              Text(
                                '1.873 Reviews',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FilledButton(
                  onPressed: () {},
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.grey.shade300,
                    minimumSize: Size(163, 41),
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
                    minimumSize: Size(163, 41),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: Text(
                    'Yes, Remove',
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
    );
  }
}
