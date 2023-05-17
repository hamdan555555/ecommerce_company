import 'dart:io';

import 'package:ecommerce_application/core/class/statusrequest.dart';
import 'package:ecommerce_application/core/constant/routesname.dart';
import 'package:ecommerce_application/core/function/handling_data.dart';
import 'package:ecommerce_application/data/datasource/remote/auth/signup_data.dart';
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
  /////////////////////////////////////////////////////////////////////////
SignUpData signupData = SignUpData(Get.find());
    List data = [];
   StatusRequest? statusRequest;
 @override
  signup() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signupData.postData(
          userName.text, password.text, email.text, phoneNumber.text);
      print("=============controller $response");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          data.addAll(response['data']);
          Get.offNamed(AppRoute.verifyCodeSignUp);
        } else {
          Get.defaultDialog(
              title: "Warning",
              middleText: "Phone Number or Email Already Exist");
          statusRequest = StatusRequest.failure;
        }
      }
      update();

      // Get.delete<SignU
    } else {
      print(" not valid");
    }
  }
//////////////////////////////////////////////////////////////////////////////////////////////
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
