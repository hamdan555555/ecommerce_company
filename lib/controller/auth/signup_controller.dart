import 'dart:io';

import 'package:ecommerce_application/core/class/statusrequest.dart';
import 'package:ecommerce_application/core/constant/routesname.dart';
import 'package:ecommerce_application/core/function/handling_data.dart';
import 'package:ecommerce_application/data/datasource/remote/auth/signup_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

abstract class CompanySignUPController extends GetxController {
 // signup();
  goToSignIn();
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

<<<<<<< HEAD
  String city = '23'.tr;
  String payment = '25'.tr;
  String category = '24'.tr;
=======


//////////////////////////////////
  String country = "country";
  String city = "city";
  String payment = "payment";
  String category = "category";
>>>>>>> df81ac94725f882d904f530588898975bae8fb83

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

  RxString imagepath = ''.obs;

  Future<void> getImage() async {
    final ImagePicker picker = ImagePicker();
    final image = await picker.getImage(source: ImageSource.gallery);
    if (image != null) {
      imagepath.value = image.path.toString();
    }
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
<<<<<<< HEAD

  SignUpData signupData = SignUpData(Get.find());
  List data = [];
  StatusRequest? statusRequest;
  @override
=======
  /////////////////////////////////////////////////////////////////////////
SignUpData signupData = SignUpData(Get.find());
    List data = [];
   StatusRequest? statusRequest;
 @override
>>>>>>> df81ac94725f882d904f530588898975bae8fb83
  signup() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
<<<<<<< HEAD
      var response = await signupData.postData(companyname.text,
          companyemail.text, companypass.text, companyphone.text);
=======
      var response = await signupData.postData(
        userName.text, password.text, email.text, phoneNumber.text);
>>>>>>> df81ac94725f882d904f530588898975bae8fb83
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
