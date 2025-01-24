import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:testt/src/configs/components/custom_back_button.dart';
import 'package:testt/src/configs/theme/theme_text.dart';
import 'package:testt/src/features/home/features/main/widget/auto_shop_widget.dart';
import 'package:testt/src/features/home/features/main/widget/vechile_horizantal_card.dart';
import 'package:testt/src/features/home/features/main/widget/vechile_card_2.dart';

class StoresAdsScreen extends StatelessWidget {
  StoresAdsScreen({super.key, required this.title});
  String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(),
        title: Text(title),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.sp),
            child: Text('Used Truck for Sale',
                style: Themetext.blackBoldText
                    .copyWith(fontWeight: FontWeight.w600, fontSize: 15.sp)),
          ),
          vechileCard2(context, newsItems),
          SizedBox(height: 12.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.sp),
            child: Text('Used Truck for Sale',
                style: Themetext.blackBoldText
                    .copyWith(fontWeight: FontWeight.w600, fontSize: 15.sp)),
          ),
          VechileHorizantalCard(
            items: [
              {
                'image': 'assets/remove/truck.png',
                'title': 'Dumper Truck',
                'price': 'PKR. 3,800,000',
                'location': 'Islamabad'
              },
              {
                'image': 'assets/remove/truck_1.png',
                'title': 'Automatic Truck',
                'price': 'PKR. 3,800,000',
                'location': 'Lahore'
              },
              {
                'image': 'assets/images/remove_me2.png',
                'title': 'Box Truck',
                'price': 'PKR. 3,800,000',
                'location': 'Karachi'
              },
            ],
          ),
          SizedBox(height: 12.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.sp),
            child: Text('Used Truck for Sale',
                style: Themetext.blackBoldText
                    .copyWith(fontWeight: FontWeight.w600, fontSize: 15.sp)),
          ),
          vechileCard2(context, newsItems),
        ],
      ),
    );
  }
}
