import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/extensions.dart';
import 'package:testt/src/configs/theme/theme_text.dart';
import 'package:testt/src/configs/utils.dart';
import 'package:testt/src/features/home/view/tabs/all_tab.dart';
import 'package:testt/src/features/home/view/tabs/buses_tab.dart';
import 'package:testt/src/features/home/widget/build_secton_header.dart';
import 'package:testt/src/features/home/view/tabs/truck_tab.dart';
import 'package:testt/src/features/my_profile/widget/user_image_avatar_widget.dart';
import 'package:testt/src/features/sell/widget/sell_textform_field.dart';

class HomeScreenNew extends StatefulWidget {
  const HomeScreenNew({super.key});

  @override
  _HomeScreenNewState createState() => _HomeScreenNewState();
}

class _HomeScreenNewState extends State<HomeScreenNew>
    with TickerProviderStateMixin {
  late TabController _categoryTabController;
  late TextEditingController searchTextEditingController;

  @override
  void initState() {
    super.initState();
    searchTextEditingController = TextEditingController();
    _categoryTabController = TabController(length: 6, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              pinned: true,
              floating: true,
              expandedHeight: 175.h,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 80.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: context.mediaQueryWidth / 1.2,
                          child: SellTextFormField(
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
                        ),
                        Row(
                          children: [
                            InkWell(
                              borderRadius: BorderRadius.circular(12),
                              onTap: () {
                                Utils.dismissKeyboard(context);
                              },
                              child: Container(
                                padding: EdgeInsets.all(8),
                                margin: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.transparent, width: 2),
                                  borderRadius: BorderRadius.circular(20),
                                  color: AppColors.white,
                                ),
                                child:
                                    SvgPicture.asset('assets/svg/filter.svg'),
                              ),
                            ),
                            SizedBox(width: context.mediaQueryWidth / 90),
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                color: AppColors.primaryLight2),
                            child: Text(
                              'Auto Store',
                              style: TextStyle(
                                  color: AppColors.primaryLight3,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                color: AppColors.primaryLight2),
                            child: Text(
                              'Factories',
                              style: TextStyle(
                                  color: AppColors.primaryLight3,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                color: AppColors.primaryLight2),
                            child: Text(
                              'Showroom',
                              style: TextStyle(
                                  color: AppColors.primaryLight3,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              title: Row(
                children: [
                  UserImageAvatarWidget(
                      height: 30.h,
                      width: 30.h,
                      imageUrl:
                          'https://t3.ftcdn.net/jpg/02/04/52/72/240_F_204527293_o9ut8AIm2PaXQg22sSqLMH354X8weheJ.jpg'),
                  SizedBox(width: 10.w),
                  Text('PakTruck',
                      style:
                          Themetext.subheadline.copyWith(color: Colors.black)),
                ],
              ),
              actions: [
                if (innerBoxIsScrolled)
                  IconButton(
                    icon: SvgPicture.asset('assets/svg/search.svg'),
                    onPressed: () {
                      // Handle notification button press
                    },
                  ),
                if (innerBoxIsScrolled)
                  SizedBox(width: context.mediaQueryWidth / 90),
                if (innerBoxIsScrolled)
                  IconButton(
                    icon: SvgPicture.asset('assets/svg/filter.svg'),
                    onPressed: () {
                      // Handle notification button press
                    },
                  ),
                SizedBox(width: context.mediaQueryWidth / 90),
                IconButton(
                  icon: SvgPicture.asset('assets/svg/notification.svg'),
                  onPressed: () {
                    // Handle notification button press
                  },
                ),
                SizedBox(width: context.mediaQueryWidth / 90),
              ],
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(70.h),
                child: Column(
                  children: [
                    TabBar(
                      splashFactory: NoSplash.splashFactory,
                      dividerColor: Colors.transparent,
                      indicatorPadding: EdgeInsets.all(8),
                      tabAlignment: TabAlignment.center,
                      controller: _categoryTabController,
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
                          child: SizedBox(
                            width: 60.w,
                            child: Center(child: Text('All')),
                          ),
                        ),
                        Tab(
                          child: SizedBox(
                            width: 70.w,
                            child: Center(child: Text('Trucks')),
                          ),
                        ),
                        Tab(
                          child: SizedBox(
                            width: 100.w,
                            child: Center(child: Text('Earth Moving')),
                          ),
                        ),
                        Tab(
                          child: SizedBox(
                            width: 70.w,
                            child: Center(child: Text('Buses')),
                          ),
                        ),
                        Tab(
                          child: SizedBox(
                            width: 100.w,
                            child: Center(child: Text('Agricultural')),
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
                  ],
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _categoryTabController,
          children: [
            AllTab(),
            TruckTab(),
            BusesTab(),
            buildCityList(),
            buildModelList(),
            buildModelList(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    searchTextEditingController.dispose();
    _categoryTabController.dispose();
    super.dispose();
  }
}
