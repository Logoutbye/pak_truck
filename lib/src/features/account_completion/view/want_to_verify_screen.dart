import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/components/round_button.dart';
import 'package:testt/src/configs/extensions.dart';
import 'package:testt/src/configs/theme/theme_text.dart';

class WantToVerifyScreen extends StatefulWidget {
  const WantToVerifyScreen({super.key});

  @override
  State<WantToVerifyScreen> createState() => _WantToVerifyScreenState();
}

class _WantToVerifyScreenState extends State<WantToVerifyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: context.mediaQueryHeight / 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 12.sp),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.primaryLight4),
                    child: Text(
                      'Skip',
                      style: Themetext.subheadline
                          .copyWith(color: AppColors.primary),
                    ),
                  )
                ],
              ),
              SizedBox(height: context.mediaQueryHeight / 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/svg/cong.svg'),
                ],
              ),
              SizedBox(height: context.mediaQueryHeight / 20),
              Text(
                'Your Account is Created Successfully!',
                textAlign: TextAlign.center,
                style: Themetext.headline
                    .copyWith(color: AppColors.primary, fontSize: 21.sp),
              ),
              Spacer(),
              RoundButton(
                borderRadius: 15,
                title: 'Verify', onPress: () {}),
              SizedBox(height: context.mediaQueryHeight / 30),
            ],
          ),
        ),
      ),
    );
  }
}
