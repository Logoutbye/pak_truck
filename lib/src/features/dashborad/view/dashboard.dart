import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/features/dashborad/widgets/what_do_you_want_to_sell_bottom_sheet.dart';
import 'package:testt/src/features/home/features/main/view/home_screen.dart';
import 'package:testt/src/features/home/features/main/view_model/category_tab_index_notifier.dart';
import 'package:testt/src/features/my_ads/view/my_ads_screen.dart';
import 'package:testt/src/features/my_profile/view/profile_screen.dart';
import 'package:testt/src/features/videos/videos_screen.dart';
import '../../chat/chat_screen.dart';
import '../view_model/navigation_provider.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          whatDoYouWantToSellBottomSheet(context);
        },
        shape: CircleBorder(),
        backgroundColor: AppColors.green,
        child: Icon(
          Icons.add,
          size: 30.0.sp,
          color: AppColors.white,
        ),
      ),
      body: Consumer<NavigationProvider>(
        builder: (context, provider, child) {
          return _getPage(provider.selectedIndex);
        },
      ),
      bottomNavigationBar: Consumer<NavigationProvider>(
        builder: (context, provider, child) {
          return BottomNavigationBar(
            backgroundColor: AppColors.white,
            type: BottomNavigationBarType.fixed,
            currentIndex: provider.selectedIndex,
            showUnselectedLabels: true,
            onTap: (index) {
              ///  this line make sures that we always set to first tab category for dynamic height assigning
              context.read<CategoryTabIndexNotifier>().updateIndex(0);

              provider.updateIndex(index);
            },
            selectedItemColor: AppColors.green,
            unselectedItemColor: Colors.black,
            selectedLabelStyle:
                TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            unselectedLabelStyle: TextStyle(fontSize: 12),
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  provider.selectedIndex == 0
                      ? 'assets/svg/home_filled.svg'
                      : 'assets/svg/home.svg',
                  height: 22.h,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  provider.selectedIndex == 1
                      ? 'assets/svg/ads_filled.svg'
                      : 'assets/svg/ads.svg',
                  height: 22.h,
                ),
                label: 'My Ads',
              ),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    provider.selectedIndex == 2
                        ? 'assets/svg/video_filled.svg'
                        : 'assets/svg/video.svg',
                    height: 22.h,
                  ),
                  label: 'Videos',
                  backgroundColor: AppColors.red),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  provider.selectedIndex == 3
                      ? 'assets/svg/chat_filled.svg'
                      : 'assets/svg/chat.svg',
                  height: 22.h,
                ),
                label: 'Chat',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  provider.selectedIndex == 4
                      ? 'assets/svg/profile_filled.svg'
                      : 'assets/svg/profile.svg',
                  height: 22.h,
                ),
                label: 'Profile',
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return Center(child: HomeScreen());
      case 1:
        return Center(child: MyAdsScreen());
      case 2:
        return VideosScreen();
      case 3:
        return Center(child: ChatScreen());
      case 4:
        return Center(child: ProfileScreen());
      default:
        return Center(child: HomeScreen());
    }
  }
}
