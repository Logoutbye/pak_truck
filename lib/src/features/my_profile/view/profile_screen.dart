// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/extensions.dart';
import 'package:testt/src/configs/routes/routes_name.dart';
import 'package:testt/src/configs/theme/theme_text.dart';
import 'package:testt/src/features/my_profile/view_model/profile_tabbar_provider.dart';
import 'package:testt/src/features/my_profile/widget/contact_us_widget.dart';
import 'package:testt/src/features/my_ads/widgets/my_ads_widget.dart';
import 'package:testt/src/features/my_profile/widget/personalized_widget.dart';
import 'package:testt/src/features/my_profile/widget/saved_ads_widget.dart';
import 'package:testt/src/features/my_profile/widget/profile_consumer_widget.dart';
import 'package:testt/src/features/my_profile/widget/show_logout_dialog.dart';
import '../widget/show_delete_dialog.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get the selected tab index from Provider
    final tabProvider = Provider.of<ProfileTabBarProvider>(context);

    // Sync TabController with the tabProvider
    _tabController.index = tabProvider.selectedTabIndex;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Profile Screen'),
        actions: [
          InkWell(
            onTap: () {
              showLogoutDialog(context);
            },
            child: SvgPicture.asset(
              'assets/svg/logout.svg',
              height: context.mediaQueryHeight / 31,
              color: AppColors.black,
            ),
          ),
          SizedBox(width: context.mediaQueryWidth / 20)
        ],
      ),
      body: Column(
        // padding: EdgeInsets.all(8),
        children: [
          ProfileConsumerWidget(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.editProfile);
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/svg/edit.svg'),
                      Text(
                        '  Edit Profile',
                        style: Themetext.blackBoldText.copyWith(
                            fontWeight: FontWeight.w600, fontSize: 13),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    showDeleteDialog(context);
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Delete account',
                        style: Themetext.blackBoldText.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                      SvgPicture.asset(
                        'assets/svg/arrow-right.svg',
                        color: AppColors.black,
                        height: context.mediaQueryHeight / 51,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(),

          TabBar(
            dividerColor: Colors.transparent,
            controller: _tabController,
            isScrollable: true,
            indicatorColor: AppColors.primary,
            tabAlignment: TabAlignment.center,
            labelColor: AppColors.primary,
            unselectedLabelColor: Colors.grey,
            onTap: (index) {
              // Update the selected tab index in the provider
              tabProvider.setTabIndex(index);
            },
            tabs: [
              Tab(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/svg/myads.svg',
                        height: context.mediaQueryHeight / 41,
                        color: tabProvider.selectedTabIndex == 0
                            ? AppColors.primary
                            : Colors.grey),
                    SizedBox(width: context.mediaQueryHeight / 90),
                    Text('My Ads'),
                  ],
                ),
              ),
              Tab(
                child: FittedBox(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                          tabProvider.selectedTabIndex == 1
                              ? 'assets/svg/heart_filled.svg'
                              : 'assets/svg/heart.svg',
                          height: context.mediaQueryHeight / 41,
                          color: tabProvider.selectedTabIndex == 1
                              ? AppColors.red
                              : Colors.grey),
                      SizedBox(width: context.mediaQueryHeight / 90),
                      Text('Saved Ads'),
                    ],
                  ),
                ),
              ),
              Tab(
                child: FittedBox(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/svg/personalcard.svg',
                          height: context.mediaQueryHeight / 41,
                          color: tabProvider.selectedTabIndex == 2
                              ? AppColors.primary
                              : Colors.grey),
                      SizedBox(width: context.mediaQueryHeight / 90),
                      Text('Personalize'),
                    ],
                  ),
                ),
              ),
              Tab(
                child: FittedBox(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/svg/contact_us.svg',
                          height: context.mediaQueryHeight / 41,
                          color: tabProvider.selectedTabIndex == 3
                              ? AppColors.primary
                              : Colors.grey),
                      SizedBox(width: context.mediaQueryHeight / 90),
                      Text('Contact Us'),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // TabBarView for switching between views based on selected tab
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                MyAdsWidget(
                  headingWidget: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: context.mediaQueryHeight / 30),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.sp),
                        child: Text(
                          'Your All Ads',
                          style: Themetext.headline
                              .copyWith(color: AppColors.primary),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(child: SavedAdsWidget()),
                Column(
                  children: [
                    PersonalizedWidget(),
                  ],
                ),
                Center(child: ContactUsWidget()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
