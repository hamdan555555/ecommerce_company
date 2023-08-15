import 'package:ecommerce_application/core/constant/routesname.dart';
import 'package:ecommerce_application/view/screen/home/navigationRail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SuccessSignUpController extends GetxController {
  goToPageLogin();
}

class SuccessSignUpControllerImp extends SuccessSignUpController {
  @override
  goToPageLogin() {
    Get.to(NavigationRailView());
  }
}
