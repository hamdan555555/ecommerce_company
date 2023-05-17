import 'package:ecommerce_application/controller/navigationRail_Controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class NavigationRailView extends StatefulWidget {
  @override
  State<NavigationRailView> createState() => _NavigationRailViewState();
}

class _NavigationRailViewState extends State<NavigationRailView> {
  final NavigationRailController navigationRailController =
      Get.put(NavigationRailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: navigationRailController.selectedIndex.value,
            onDestinationSelected: (int index) {
              navigationRailController.selectNavigationItem(index);
            },
            labelType: NavigationRailLabelType.all,
            destinations: [
              ...navigationRailController.navigationItems.map(
                (item) => NavigationRailDestination(
                  icon: Icon(item.iconData),
                  label: Text(item.title)
                ),
              ),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: Obx(
              () => navigationRailController.selectedScreen.value,
            ),
          ),
        ],
      ),
    );
  }
}
