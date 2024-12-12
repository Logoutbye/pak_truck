
import 'package:flutter/material.dart';

class ProfileTabBarProvider with ChangeNotifier {
  int _selectedTabIndex = 0;

  int get selectedTabIndex => _selectedTabIndex;

  void setTabIndex(int index) {
    _selectedTabIndex = index;
    notifyListeners(); // Notify all listeners when the tab index changes
  }
}