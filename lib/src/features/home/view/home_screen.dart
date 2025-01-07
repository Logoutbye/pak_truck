import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/extensions.dart';
import 'package:testt/src/configs/theme/theme_text.dart';
import 'package:testt/src/configs/utils.dart';
import 'package:testt/src/features/home/view_model/category_tab_index_notifier.dart';
import 'package:testt/src/features/home/widget/auto_shop_widget.dart';
import 'package:testt/src/features/home/widget/build_secton_header.dart';
import 'package:testt/src/features/home/widget/horizontal_list_widget.dart';
import 'package:testt/src/features/home/widget/shop_tabbar_view.dart';
import 'package:testt/src/features/sell/widget/sell_textform_field.dart';

import '../../my_profile/widget/user_image_avatar_widget.dart';
import '../widget/category_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _categoryTabController;
  late TabController _autoTabController;
  late TabController _thirdTabController;
  late TextEditingController searchTextEditingController;

  @override
  void initState() {
    super.initState();
    searchTextEditingController = TextEditingController();
    _categoryTabController = TabController(length: 5, vsync: this);
    _autoTabController = TabController(length: 3, vsync: this);
    _thirdTabController = TabController(length: 3, vsync: this);

    _categoryTabController.addListener(() {
      if (mounted) {
        context
            .read<CategoryTabIndexNotifier>()
            .updateIndex(_categoryTabController.index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = context.watch<CategoryTabIndexNotifier>().currentIndex;
    // Define heights dynamically based on tab index
    final double dynamicHeight = currentIndex == 0
        ? MediaQuery.of(context).size.height / 6
        : currentIndex == 1
            ? MediaQuery.of(context).size.height / 7
            : currentIndex == 2
                ? MediaQuery.of(context).size.height / 5.5
                : currentIndex == 3
                    ? MediaQuery.of(context).size.height / 5
                    : MediaQuery.of(context).size.height / 5;

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
            padding: const EdgeInsets.all(4.0),
            child: UserImageAvatarWidget(imageUrl: '')),
        title: Column(
          children: [
            SellTextFormField(
              leading: Icon(Icons.search),
              maxLines: 1,
              minLines: 1,
              color: AppColors.whiteColor,
              borderColor: AppColors.dividerColor,
              hintText: 'Search used Truck',
              controller: searchTextEditingController,
              titleText: '',
            ),
          ],
        ),
        actions: [
          InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              Utils.dismissKeyboard(context);
            },
            child: Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(2),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.dividerColor, width: 2),
                borderRadius: BorderRadius.circular(12),
                color: AppColors.whiteColor,
              ),
              child: SvgPicture.asset('assets/svg/filter.svg'),
            ),
          ),
          SizedBox(width: context.mediaQueryWidth / 90),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(height: context.mediaQueryHeight / 75),
          buildSectionHeader(
            context,
            title: 'Browse Used Truck Category',
            onViewAllPressed: () {},
          ),
          SizedBox(height: context.mediaQueryHeight / 75),
          TabBar(
            tabAlignment: TabAlignment.center,
            controller: _categoryTabController,
            isScrollable: true,
            indicatorColor: AppColors.primaryColor,
            labelColor: AppColors.primaryColor,
            unselectedLabelColor: Colors.grey.shade700,
            labelStyle: Themetext.blackBoldText.copyWith(),
            unselectedLabelStyle: Themetext.blackBoldText.copyWith(),
            tabs: const [
              Tab(text: 'Category'),
              Tab(text: 'Budget'),
              Tab(text: 'Cities'),
              Tab(text: 'Brand'),
              Tab(text: 'Model'),
            ],
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300), // Smooth transition
            height: dynamicHeight,
            child: TabBarView(
              controller: _categoryTabController,
              children: [
                buildCategoryTab(
                  context: context,
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.width / 3,
                ),
                buildBudgetList(),
                buildCityList(),
                buildPaktruckBrandsList(context),
                buildModelList()
              ],
            ),
          ),
          buildSectionHeader(
            context,
            title: 'Feature Used Truck',
            onViewAllPressed: () {},
          ),
          HorizontalList(
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
                'image': 'assets/images/mini_truck.png',
                'title': 'Box Truck',
                'price': 'PKR. 3,800,000',
                'location': 'Karachi'
              },
            ],
          ),
          SizedBox(height: context.mediaQueryHeight / 75),
          buildSectionHeader(
            context,
            title: 'Manage by PakTruck',
            onViewAllPressed: () {},
          ),
          HorizontalList(
            showPakTruckTag: true,
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
                'image': 'assets/images/mini_truck.png',
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
          HorizontalList(
            showPakTruckTag: true,
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
                'image': 'assets/images/mini_truck.png',
                'title': 'Box Truck',
                'price': 'PKR. 3,800,000',
                'location': 'Karachi'
              },
            ],
          ),
          SizedBox(height: context.mediaQueryHeight / 75),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TabBar(
                dividerColor: Colors.transparent,
                tabAlignment: TabAlignment.start,
                controller: _autoTabController,
                isScrollable: true,
                indicatorColor: AppColors.primaryColor,
                labelColor: AppColors.primaryColor,
                unselectedLabelColor: Colors.grey.shade700,
                labelStyle: Themetext.blackBoldText.copyWith(),
                unselectedLabelStyle: Themetext.blackBoldText.copyWith(),
                tabs: const [
                  Tab(text: 'Auto store'),
                  Tab(text: 'Factories'),
                  Tab(text: 'Showroom'),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Text(
                  'View All',
                  style: Themetext.blackBoldText
                      .copyWith(color: AppColors.primaryColor),
                ),
              )
            ],
          ),
          SizedBox(
            height: context.mediaQueryHeight / 2.3,
            child: TabBarView(
              controller: _autoTabController,
              children: [
                buildTwoRowHorizontalList(context),
                buildTwoRowHorizontalList(context),
                buildTwoRowHorizontalList(context),
              ],
            ),
          ),
          buildSectionHeader(
            context,
            title: 'PakTruck Brands',
            onViewAllPressed: () {},
          ),
          buildPaktruckBrandsList(context),
          SizedBox(height: context.mediaQueryHeight / 75),
          buildSectionHeader(
            context,
            title: 'Truck Machinery Spare parts',
            onViewAllPressed: () {},
          ),
          buildSparePartsList(),
          SizedBox(height: context.mediaQueryHeight / 75),
          buildSectionHeader(
            context,
            title: 'News',
            onViewAllPressed: () {},
          ),
          // TabBar(
          //   dividerColor: Colors.transparent,
          //   tabAlignment: TabAlignment.start,
          //   controller: _thirdTabController,
          //   isScrollable: true,
          //   indicatorColor: AppColors.primaryColor,
          //   labelColor: AppColors.primaryColor,
          //   unselectedLabelColor: Colors.grey.shade700,
          //   labelStyle: Themetext.blackBoldText.copyWith(),
          //   unselectedLabelStyle: Themetext.blackBoldText.copyWith(),
          //   tabs: const [
          //     Tab(text: 'News'),
          //     Tab(text: 'Truck Reviews'),
          //     Tab(text: 'Discussion'),
          //   ],
          // ),
          // SizedBox(
          //   height: context.mediaQueryHeight / 1.8,
          //   child: TabBarView(
          //     controller: _thirdTabController,
          //     children: [
          //       buildVerticalList(context),
          //       buildVerticalList(context),
          //       buildVerticalList(context),
          //     ],
          //   ),
          // ),

          CustomTabBar(tabs: const ['News', 'Truck Reviews', 'Discussion']),
          CustomTabView(
            children: [
              buildNewsWidget(context, newsItems), // News Tab
              buildNewsWidget(context, reviewsItems), // Truck Reviews Tab
              buildNewsWidget(context, discussionItems) // Discussion Tab
            ],
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    searchTextEditingController.dispose();
    _categoryTabController.dispose();
    _autoTabController.dispose();
    _thirdTabController.dispose();
    super.dispose();
  }
}
