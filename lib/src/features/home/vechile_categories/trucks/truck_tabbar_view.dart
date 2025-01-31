import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testt/src/configs/utils.dart';
import 'package:testt/src/features/home/main/widget/vechile_vertical_card.dart';
import 'package:testt/src/features/home/vechile_categories/reuseable_tabbar_view.dart/reuseable_tabbar_view.dart';

class TruckTabbarView extends StatelessWidget {
  TruckTabbarView({super.key});
  final searchTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ReusableTabBarView(
      title: 'Trucks',
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
            child: Center(child: Text('Automatic')),
          ),
        ),
        Tab(
          child: SizedBox(
            width: 120.w,
            child: Center(child: Text('Dumper Truck')),
          ),
        ),
        Tab(
          child: SizedBox(
            width: 120.w,
            child: Center(child: Text('Flatbed Truck')),
          ),
        ),
        Tab(
          child: SizedBox(
            width: 120.w,
            child: Center(child: Text('Tailer Truck')),
          ),
        ),
        Tab(
          child: SizedBox(
            width: 140.w,
            child: Center(child: Text('Container Carrier')),
          ),
        ),
        Tab(
          child: SizedBox(
            width: 120.w,
            child: Center(child: Text('Cargo Landing')),
          ),
        ),
        Tab(
          child: SizedBox(
            width: 100.w,
            child: Center(child: Text('Box Truck')),
          ),
        ),
        Tab(
          child: SizedBox(
            width: 120.w,
            child: Center(child: Text('Freezer Truck')),
          ),
        ),
        Tab(
          child: SizedBox(
            width: 120.w,
            child: Center(child: Text('Tanker Truck')),
          ),
        ),
        Tab(
          child: SizedBox(
            width: 120.w,
            child: Center(child: Text('Dump Truck')),
          ),
        ),
      ],
      tabViews: [
        VechileVerticalCard(title: 'All', items: dummy),
        VechileVerticalCard(title: 'Automatic', items: dummy),
        VechileVerticalCard(title: 'Dumper Truck', items: dummy),
        VechileVerticalCard(title: 'Flatbed Truck', items: dummy),
        VechileVerticalCard(title: 'Tailer Truck', items: dummy),
        VechileVerticalCard(title: 'Container Carrier', items: dummy),
        VechileVerticalCard(title: 'Cargo Landing', items: dummy),
        VechileVerticalCard(title: 'Box Truck', items: dummy),
        VechileVerticalCard(title: 'Freezer Truck', items: dummy),
        VechileVerticalCard(title: 'Tanker Truck', items: dummy),
        VechileVerticalCard(title: 'Dump Truck', items: dummy),
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
