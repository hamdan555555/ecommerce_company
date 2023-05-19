import 'package:ecommerce_application/data/model/navigationRail_model.dart';
import 'package:ecommerce_application/view/screen/home/home.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';

class NavigationRailController extends GetxController {
  final List<NavigationItem> navigationItems = [
    NavigationItem(title: 'Home', iconData: Icons.home),
    NavigationItem(title: 'Messages', iconData: Icons.message),
    NavigationItem(title: 'Settings', iconData: Icons.settings),
  ];

  var selectedIndex = 0.obs;
  var selectedScreen = _buildScreen(0).obs;

  void selectNavigationItem(int index) {
    selectedIndex.value = index;
    selectedScreen.value = _buildScreen(index);
  }

  static Widget _buildScreen(int index) {
    switch (index) {
      case 0:
        return HomeScreen();
      case 1:
        return MessagesScreen();
      case 2:
        return SettingsScreen();
      default:
        return Container();
    }
  }
}



class MessagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Messages Screen'),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Settings Screen'),
    );
  }
}
