import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/components/custom_back_button.dart';
import 'package:testt/src/configs/theme/theme_text.dart';
import 'package:testt/src/configs/components/custom_textform_field.dart';
import 'package:testt/src/features/home/features/stores/view/auto_store_tabbar_view.dart';
import 'package:testt/src/features/home/features/stores/view_model/store_tabbar_provider.dart';
import 'package:testt/src/features/home/features/stores/widget/store_card.dart';


// ignore: must_be_immutable
class StoresTabbarView extends StatelessWidget {
  StoresTabbarView({super.key});
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
              leading: CustomBackButton(),
              title: CustomTextFormField(
                borderRadius: 30,
                leading: Icon(Icons.search),
                maxLines: 1,
                minLines: 1,
                color: AppColors.white,
                borderColor: AppColors.divider,
                hintText: 'Search...',
                controller: searchTextEditingController,
                titleText: '',
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
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.primaryLight2,
                ),
                unselectedLabelColor: Colors.grey.shade700,
                labelStyle: Themetext.blackBoldText
                    .copyWith(color: AppColors.primaryLight3),
                unselectedLabelStyle: Themetext.blackBoldText.copyWith(),
                tabs: [
                  Tab(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      width: 90.w,
                      child: Center(child: Text('Auto Store')),
                    ),
                  ),
                  Tab(
                    child: SizedBox(
                      width: 90.w,
                      child: Center(child: Text('Factories')),
                    ),
                  ),
                  Tab(
                    child: SizedBox(
                      width: 100.w,
                      child: Center(child: Text('Showroom')),
                    ),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                AutoStoreTabbarView(),
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
