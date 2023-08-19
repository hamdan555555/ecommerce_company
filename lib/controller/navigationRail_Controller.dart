import 'dart:convert';

import 'package:ecommerce_application/data/model/navigationRail_model.dart';
import 'package:ecommerce_application/link_api.dart';
import 'package:ecommerce_application/view/screen/home/home.dart';
import 'package:get/get.dart';
import 'package:http/http.dart ' as http;
import 'package:flutter/material.dart';

import 'auth/login_controller.dart';

class NavigationRailController extends GetxController {
  static var idProduct = '';
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

  List listProduct = [];
  Future<void> getAllProducts() async {
    try {
      
    } catch (e) {
      
    }
    print('favorite 1');
    http.Response response =
        await http.get(Uri.parse(AppLink.getAllPro), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${LoginControllerImp.token}'
    });
    print('favorite 2');
    if (response.statusCode == 200) {
      var map = jsonDecode(response.body);
      print('favorite 2');
      if (map['message'] == 'get products successfully') {
            listProduct = map['products'];
      } else {
          Get.defaultDialog(
          title: 'Warning',
          middleText: 'There is no Product',
        );
      }
      print('favorite 3');
      print(listProduct);
      print('favorite 4');
      update();
    
    } 
  }

  deleteProduct(String id) async {
    var headers = {'Authorization': 'Bearer ${LoginControllerImp.token}'};
    var request = http.Request(
        'DELETE', Uri.parse('http://localhost:8000/api/delete_product/${id}'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  @override
  void onInit() {
    getAllProducts();
    super.onInit();
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
