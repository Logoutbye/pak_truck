import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/features/home/home_screen.dart';
import 'package:testt/src/features/my_profile/profile_screen.dart';
import 'package:testt/src/features/sell/sell_screen.dart';
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
          // Change body based on the selected index
          return _getPage(provider.selectedIndex);
        },
      ),
      bottomNavigationBar: Consumer<NavigationProvider>(
        builder: (context, provider, child) {
          return BottomNavigationBar(
            backgroundColor: AppColors.whiteSccafold,
            currentIndex: provider.selectedIndex,
            showUnselectedLabels: true,
            onTap: (index) {
              provider.updateIndex(index);
            },
            selectedItemColor: provider.selectedIndex == 2
                ? Colors.red
                : AppColors.primaryColor,
            unselectedItemColor: Colors.black,
            selectedLabelStyle:
                TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            unselectedLabelStyle: TextStyle(fontSize: 12),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Videos',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_box_rounded),
                label: 'Sell',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat),
                label: 'Chat',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined),
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
        return Center(child: SellScreen());
      case 3:
        return Center(child: ChatScreen());
      case 4:
        return Center(child: ProfileScreen());
      default:
        return Center(child: HomeScreen());
    }
  }
}
