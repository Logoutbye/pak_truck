import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/extensions.dart';
import 'package:testt/src/features/dashborad/widgets/what_do_you_want_to_sell_bottom_sheet.dart';
import 'package:testt/src/features/home/view/home_screen.dart';
import 'package:testt/src/features/my_profile/view/profile_screen.dart';
import 'package:testt/src/features/videos/videos_screen.dart';
import '../../chat/chat_screen.dart';
import '../view_model/navigation_provider.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<NavigationProvider>(
        builder: (context, provider, child) {
          return _getPage(provider.selectedIndex);
        },
      ),
      bottomNavigationBar: Consumer<NavigationProvider>(
        builder: (context, provider, child) {
          return BottomNavigationBar(
            backgroundColor: AppColors.whiteColor,
            type: BottomNavigationBarType.fixed,
            currentIndex: provider.selectedIndex,
            showUnselectedLabels: true,
            onTap: (index) {
              if (index == 2) {
                whatDoYouWantToSellBottomSheet(context);
              } else {
                provider.updateIndex(index);
              }
            },
            selectedItemColor: provider.selectedIndex == 2
                ? Colors.red
                : AppColors.primaryColor,
            unselectedItemColor: Colors.black,
            selectedLabelStyle:
                TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            unselectedLabelStyle: TextStyle(fontSize: 12),
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(provider.selectedIndex == 0
                    ? Icons.home_rounded
                    : Icons.home_outlined),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(provider.selectedIndex == 1
                    ? 'assets/svg/video_filled.svg'
                    : 'assets/svg/video.svg'),
                label: 'Videos',
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.add_box_rounded,
                    color: AppColors.red,
                  ),
                  label: 'Sell',
                  backgroundColor: AppColors.red),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  provider.selectedIndex == 3
                      ? 'assets/svg/chat_filled.svg'
                      : 'assets/svg/chat.svg',
                  height: context.mediaQueryHeight / 35,
                ),
                label: 'Chat',
              ),
              BottomNavigationBarItem(
                icon: Icon(provider.selectedIndex == 4
                    ? Icons.account_circle
                    : Icons.account_circle_outlined),
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
        return Center(child: VideosScreen());
      case 2:
        return Container();
      case 3:
        return Center(child: ChatScreen());
      case 4:
        return Center(child: ProfileScreen());
      default:
        return Center(child: HomeScreen());
    }
  }
}
