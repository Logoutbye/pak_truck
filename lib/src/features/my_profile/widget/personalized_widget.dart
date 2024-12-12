import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/extensions.dart';

class PersonalizedWidget extends StatelessWidget {
  const PersonalizedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: context.mediaQueryHeight / 30),
        Container(
          padding: EdgeInsets.all(12),
          height: context.mediaQueryHeight / 8,
          decoration: BoxDecoration(color: AppColors.whiteColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('assets/svg/notification.svg'),
                      SizedBox(width: 10),
                      Text('Notification Setting',
                          style: TextStyle(
                              color: Color(0xFf000000),
                              fontSize: 16,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                  SvgPicture.asset(
                    'assets/svg/arrow-right.svg',
                    width: context.mediaQueryWidth / 21,
                    color: AppColors.blackColor,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svg/world.svg',
                        width: context.mediaQueryWidth / 17,
                      ),
                      SizedBox(width: 10),
                      Text('Choose Language',
                          style: TextStyle(
                              color: Color(0xFf000000),
                              fontSize: 16,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                  SvgPicture.asset(
                    'assets/svg/arrow-right.svg',
                    width: context.mediaQueryWidth / 21,
                    color: AppColors.blackColor,
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
