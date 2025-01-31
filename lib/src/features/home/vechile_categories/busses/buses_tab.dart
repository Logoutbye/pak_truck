import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testt/src/configs/extensions.dart';
import 'package:testt/src/features/home/main/widget/auto_shop_widget.dart';
import 'package:testt/src/features/home/main/widget/build_secton_header.dart';
import 'package:testt/src/features/home/main/widget/vechile_horizantal_card.dart';
import 'package:testt/src/features/home/main/widget/news_widget.dart';

// ignore: must_be_immutable
class BusesTab extends StatelessWidget {
  BusesTab({super.key});

  TextEditingController searchTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          buildSectionHeader(
            context,
            title: 'Used Buses for Sale',
            onViewAllPressed: () {},
          ),
          VechileHorizantalCard(
            showPakTruckTag: true,
            items: [
              {
                'image': 'assets/images/remove_me2.png',
                'title': 'Dumper Truck',
                'price': 'PKR. 3,800,000',
                'location': 'Islamabad'
              },
              {
                'image': 'assets/images/remove_me1.png',
                'title': 'Automatic Truck',
                'price': 'PKR. 3,800,000',
                'location': 'Lahore'
              },
              {
                'image': 'assets/remove/truck_1.png',
                'title': 'Box Truck',
                'price': 'PKR. 3,800,000',
                'location': 'Karachi'
              },
            ],
          ),
          SizedBox(height: context.mediaQueryHeight / 75),
          buildSectionHeader(
            context,
            title: 'News',
            onViewAllPressed: () {},
          ),
          buildNewsWidget(context, newsItems),
          Padding(padding: EdgeInsets.only(bottom: 50.sp))
        ],
      ),
    );
  }
}
