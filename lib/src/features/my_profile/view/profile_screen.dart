// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/extensions.dart';
import 'package:testt/src/configs/routes/routes_name.dart';
import 'package:testt/src/configs/theme/theme_text.dart';
import 'package:testt/src/features/my_profile/view_model/profile_tabbar_provider.dart';
import 'package:testt/src/features/my_profile/widget/contact_us_widget.dart';
import 'package:testt/src/features/my_profile/widget/my_ads_widget.dart';
import 'package:testt/src/features/my_profile/widget/personalized_widget.dart';
import 'package:testt/src/features/my_profile/widget/saved_ads_widget.dart';
import 'package:testt/src/features/my_profile/widget/show_logout_dialog.dart';
import 'package:testt/src/features/my_profile/widget/user_image_avatar_widget.dart';
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
              color: AppColors.blackColor,
            ),
          ),
          SizedBox(width: context.mediaQueryWidth / 20)
        ],
      ),
      body: Column(
        // padding: EdgeInsets.all(8),
        children: [
          ListTile(
            leading: UserImageAvatarWidget(imageUrl: ''),
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Inayat',
                  style: Themetext.headline,
                ),
                SizedBox(width: 20),
                SvgPicture.asset('assets/svg/unverified.svg',
                    height: context.mediaQueryHeight / 41),
                SizedBox(width: context.mediaQueryWidth / 70),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.verifyShopScreen);
                  },
                  child: Text(
                    'Unverified',
                    style: Themetext.headline.copyWith(color: AppColors.orange),
                  ),
                ),
              ],
            ),
            subtitle: Text('Member Since Nov 12, 2024'),
          ),
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
                      // SizedBox(
                      //   height: context.mediaQueryHeight / 21,
                      //   child: VerticalDivider(
                      //     color: Colors.grey,
                      //     width: 20,
                      //     thickness: 2,
                      //     indent: 10,
                      //     endIndent: 10,
                      //   ),
                      // ),
                      // Text(
                      //   'Get Verified ',
                      //   style: Themetext.blackBoldText.copyWith(
                      //       fontWeight: FontWeight.w600,
                      //       fontSize: 13,
                      //       color: AppColors.primaryColor),
                      // ),
                      // SvgPicture.asset('assets/svg/arrow-right.svg')
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Navigator.pushNamed(context, RoutesName.deleteaccount);
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
                        color: AppColors.blackColor,
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
            indicatorColor: AppColors.primaryColor,
            labelColor: AppColors.primaryColor,
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
                            ? AppColors.primaryColor
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
                              ? AppColors.primaryColor
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
                              ? AppColors.primaryColor
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
                              ? AppColors.primaryColor
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
                Center(child: MyAdsWidget()),
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
