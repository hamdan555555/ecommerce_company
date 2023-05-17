import 'dart:io';

import 'package:ecommerce_application/core/constant/routesname.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

abstract class CompanySignUPController extends GetxController {
  signup();
  goToSignIn();
}

class CompanySignUpControllerImp extends CompanySignUPController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController companyname;
  late TextEditingController companyphone;
  late TextEditingController companyaddress;
  late TextEditingController companybio;

  String country = "country";
  String city = "city";
  String payment = "payment";
  String category = "category";

  final List<String> cities = ["Emirates", "Syria", "Egypt"];
  final List<String> countryUAE = ["Abu Dhabi", "Dubai", "Sharjah"];
  final List<String> countrySY = ["Damascus", "Aleppo", "Hama"];
  final List<String> countryEGY = ["Alexandria", "Cairo", "Ghardaa"];

  List<String> City = [];

  RxString imagepath = ''.obs;

  Future<void> getImage() async {
    final ImagePicker picker = ImagePicker();
    final image = await picker.getImage(source: ImageSource.gallery);
    if (image != null) {
      imagepath.value = image.path.toString();
    }
  }

  onChangedCountry(String val) {
    country = val;
    update();
  }

  onChangedCity(String val) {
    city = val;
    update();
  }

  onChangedPayment(String val) {
    payment = val;
    update();
  }

  onChangedCategory(String val) {
    category = val;
    update();
  }

  @override
  signup() {
    var formData = formState.currentState;
    if (formData!.validate()) {
      Get.offNamed(AppRoute.checkEmail);
      // Get.delete<SignUpControllerImp>();
    } else {
      print(" not valid");
    }
  }

  @override
  void onInit() {
    companyname = TextEditingController();
    companyphone = TextEditingController();
    companyaddress = TextEditingController();
    companybio = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    companyname.dispose();
    companyphone.dispose();
    companyaddress.dispose();
    companybio.dispose();
    super.dispose();
  }

  @override
  goToSignIn() {
    Get.offNamed(AppRoute.login);
  }
}
