
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/theme/theme_text.dart';
import 'package:testt/src/features/home/stores/view_model/store_tabbar_provider.dart';
import 'package:testt/src/features/home/stores/widget/store_card.dart';


// ignore: must_be_immutable
class AutoStoreTabbarView extends StatelessWidget {
  AutoStoreTabbarView({super.key});
  TextEditingController searchTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<StoreTabbarProvider>(
      builder: (context, tabProvider, _) {
        return DefaultTabController(
          initialIndex: tabProvider.selectedTabIndex,
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              centerTitle: false,
              title: Text(
                ' PakTruck Shop',
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary),
              ),
              bottom: TabBar(
                splashFactory: NoSplash.splashFactory,
                dividerColor: Colors.transparent,
                indicatorPadding: EdgeInsets.all(8),
                tabAlignment: TabAlignment.center,
                isScrollable: true,
                indicatorColor: AppColors.primary,
                indicator: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(25),
                  color: AppColors.checkbox,
                ),
                unselectedLabelColor: Colors.grey.shade700,
                labelStyle:
                    Themetext.blackBoldText.copyWith(color: Colors.white),
                unselectedLabelStyle: Themetext.blackBoldText.copyWith(),
                tabs: [
                  Tab(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      width: 90.w,
                      child: Center(child: Text('All')),
                    ),
                  ),
                  Tab(
                    child: SizedBox(
                      width: 90.w,
                      child: Center(child: Text('Truck')),
                    ),
                  ),
                  Tab(
                    child: SizedBox(
                      width: 100.w,
                      child: Center(child: Text('Spare Parts')),
                    ),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                StoreCard(
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
                StoreCard(
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
                StoreCard(
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
              ],
            ),
          ),
        );
      },
    );
  }
}
