import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/theme/theme_text.dart';
import 'package:testt/src/features/my_ads/widgets/my_ads_widget.dart';

class MyAdsScreen extends StatelessWidget {
  const MyAdsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('My Ads'),
      ),
      body: MyAdsWidget(
        headingWidget: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.sp),
          child: Row(
            children: [
              Text(
                'Your All Ads',
                style: Themetext.headline.copyWith(color: AppColors.primary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
