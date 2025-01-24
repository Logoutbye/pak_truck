import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testt/src/configs/utils.dart';
import 'package:testt/src/features/home/features/main/widget/vechile_vertical_card.dart';
import 'package:testt/src/features/home/features/vechile_categories/reuseable_tabbar_view.dart/reuseable_tabbar_view.dart';

class EarthMovingTabbarView extends StatelessWidget {
  EarthMovingTabbarView({super.key});
  final searchTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ReusableTabBarView(
      title: 'PakTruck',
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
            child: Center(child: Text('Excavator Operator')),
          ),
        ),
        Tab(
          child: SizedBox(
            width: 120.w,
            child: Center(child: Text('Loader Operator')),
          ),
        ),
        Tab(
          child: SizedBox(
            width: 120.w,
            child: Center(child: Text('Roller Machine')),
          ),
        ),
        Tab(
          child: SizedBox(
            width: 120.w,
            child: Center(child: Text('Grader Machine')),
          ),
        ),
        Tab(
          child: SizedBox(
            width: 140.w,
            child: Center(child: Text('Wheel Tractor')),
          ),
        ),
        Tab(
          child: SizedBox(
            width: 120.w,
            child: Center(child: Text('Road Cutter')),
          ),
        ),
        Tab(
          child: SizedBox(
            width: 100.w,
            child: Center(child: Text('Drilling Machine')),
          ),
        ),
        Tab(
          child: SizedBox(
            width: 120.w,
            child: Center(child: Text('Compactor Machine')),
          ),
        ),
        Tab(
          child: SizedBox(
            width: 120.w,
            child: Center(child: Text('Forklift')),
          ),
        ),
        Tab(
          child: SizedBox(
            width: 120.w,
            child: Center(child: Text('Crusher')),
          ),
        ),
        Tab(
          child: SizedBox(
            width: 120.w,
            child: Center(child: Text('Screening Machine')),
          ),
        ),
        Tab(
          child: SizedBox(
            width: 120.w,
            child: Center(child: Text('Conveyor')),
          ),
        ),
        Tab(
          child: SizedBox(
            width: 120.w,
            child: Center(child: Text('Buildozer')),
          ),
        ),
      ],
      tabViews: [
        VechileVerticalCard(items: dummy),
        VechileVerticalCard(items: dummy),
        VechileVerticalCard(items: dummy),
        VechileVerticalCard(items: dummy),
        VechileVerticalCard(items: dummy),
        VechileVerticalCard(items: dummy),
        VechileVerticalCard(items: dummy),
        VechileVerticalCard(items: dummy),
        VechileVerticalCard(items: dummy),
        VechileVerticalCard(items: dummy),
        VechileVerticalCard(items: dummy),
        VechileVerticalCard(items: dummy),
        VechileVerticalCard(items: dummy),
        VechileVerticalCard(items: dummy),
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
