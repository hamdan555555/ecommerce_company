import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

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
  imagepicker();
}

class CompanySignUpControllerImp extends CompanySignUPController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController companyname;
  late TextEditingController companyemail;
  late TextEditingController companypass;
  late TextEditingController companyphone;
  late TextEditingController companyaddress;
  late TextEditingController companybio;
//////////////////////////////////////////
  late TextEditingController userName;
  late TextEditingController password;
  late TextEditingController email;
  late TextEditingController phoneNumber;

  String city = '23'.tr;
  String payment = '25'.tr;
  String category = '24'.tr;

  final List<String> cities = [
    "Damascus",
    "Aleppo",
    "Hama",
    "Lattakia",
    "Homs",
    "Tartus",
    "Sweida",
    "Edlep"
  ];

  final List<String> categories = [
    "clothing",
    "Electrical",
    "Electronics",
    "Furniture",
    "Stationary",
    "Makeup And Perfumes",
    "Accessories",
  ];

  final List<String> payments = [
    "MTN Cash",
    "Pay Pal",
    "Visa Card",
  ];

  bool isShowpass = true;
  showpassword() {
    isShowpass = !isShowpass;
    update();
  }

  File? file;
  @override
  Future imagepicker() async {
    final myfile = await ImagePicker().getImage(source: ImageSource.gallery);
    file = File(myfile!.path);
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

  SignUpData signupData = SignUpData(Get.find());
  List data = [];
  StatusRequest? statusRequest;
  @override
  signup() async {
    var formData = formState.currentState;
    if ((formData!.validate()) &&
        file != null &&
        cities.contains(city) &&
        payments.contains(payment) &&
        categories.contains(category)) {
      String companyimage = base64Encode(file!.readAsBytesSync());
      String imagename = file!.path.split("/").last;
      statusRequest = StatusRequest.loading;
      update();
      var response = await signupData.postData(
          companyimage,
          imagename,
          companyname.text,
          companyemail.text,
          companypass.text,
          companyphone.text,
          city,
          companyaddress.text,
          category,
          payment,
          companybio.text);
      print("=============controller $response");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          data.addAll(response['data']);
          Get.offNamed(AppRoute.verifyCodeSignUp,
              arguments: {"companyemail": companyemail.text});
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
      Get.defaultDialog(
          title: "Warning", middleText: "Error Occured Please Try Again");
    }
  }

//////////////////////////////////////////////////////////////////////////////////////////////
  @override
  void onInit() {
    companyname = TextEditingController();
    companyemail = TextEditingController();
    companypass = TextEditingController();
    companyphone = TextEditingController();
    companyaddress = TextEditingController();
    companybio = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    companyname.dispose();
    companyemail.dispose();
    companypass.dispose();
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
