import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testt/src/configs/utils.dart';
import 'package:testt/src/features/home/main/widget/vechile_vertical_card.dart';
import 'package:testt/src/features/home/vechile_categories/reuseable_tabbar_view.dart/reuseable_tabbar_view.dart';

class AgriculturalTabbarView extends StatelessWidget {
  AgriculturalTabbarView({super.key});
  final searchTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ReusableTabBarView(
      title: 'Agricultural',
      searchController: searchTextEditingController,
      onFilterPressed: () {
        Utils.dismissKeyboard(context);
      },
      tabs: [
        Tab(
          child: Container(
            padding: EdgeInsets.all(8),
            width: 90.w,
            child: Center(child: Text('All')),
          ),
        ),
        Tab(
          child: Container(
            padding: EdgeInsets.all(8),
            width: 90.w,
            child: Center(child: Text('Tractors')),
          ),
        ),
        Tab(
          child: SizedBox(
            width: 120.w,
            child: Center(child: Text('Threshers')),
          ),
        ),
        Tab(
          child: SizedBox(
            width: 120.w,
            child: Center(child: Text('Harvesters')),
          ),
        ),
        Tab(
          child: SizedBox(
            width: 120.w,
            child: Center(child: Text('Seeders')),
          ),
        ),
      ],
      tabViews: [
        VechileVerticalCard(title: 'All', items: dummy),
        VechileVerticalCard(title: 'Tractors', items: dummy),
        VechileVerticalCard(title: 'Threshers', items: dummy),
        VechileVerticalCard(title: 'Harvesters', items: dummy),
        VechileVerticalCard(title: 'Seeders', items: dummy),
      ],
    );
  }
}

var dummy = [
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
];
