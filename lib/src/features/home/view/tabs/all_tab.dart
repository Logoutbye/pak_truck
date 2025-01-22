import 'package:flutter/material.dart';
import 'package:testt/src/configs/extensions.dart';
import 'package:testt/src/features/home/widget/auto_shop_widget.dart';
import 'package:testt/src/features/home/widget/build_secton_header.dart';
import 'package:testt/src/features/home/widget/vechile_card.dart';
import 'package:testt/src/features/home/widget/news_widget.dart';

// ignore: must_be_immutable
class AllTab extends StatelessWidget {
  AllTab({super.key});

  TextEditingController searchTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          buildSectionHeader(context,
              title: 'Used Truck For Sale', onViewAllPressed: () {}),
          VechileCard(
            cardWidthRatio: 0.6,
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
          SizedBox(height: context.mediaQueryHeight / 75),
          buildSectionHeader(
            context,
            title: 'Used Buses for Sale',
            onViewAllPressed: () {},
          ),
          VechileCard(
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
            title: 'Spare parts',
            onViewAllPressed: () {},
          ),
          buildSparePartsList(),
          SizedBox(height: context.mediaQueryHeight / 75),
          buildSectionHeader(
            context,
            title: 'News',
            onViewAllPressed: () {},
          ),
          buildNewsWidget(context, newsItems),
        ],
      ),
    );
  }


}
