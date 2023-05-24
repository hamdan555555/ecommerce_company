import 'package:ecommerce_application/core/class/statusrequest.dart';
import 'package:ecommerce_application/core/constant/routesname.dart';
import 'package:ecommerce_application/core/function/handling_data.dart';
import 'package:ecommerce_application/data/datasource/remote/forgetpassword/resetpassworddata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  resetPassword();
  goToSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController password;
  late TextEditingController rePassword;
  String? email;

  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  StatusRequest? statusRequest;

  @override
  void onInit() {
    password = TextEditingController();
    rePassword = TextEditingController();
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    rePassword.dispose();
    super.dispose();
  }

  @override
  goToSuccessResetPassword() async {
    var formData = formState.currentState;
    if (password.text != rePassword.text) {
      Get.defaultDialog(
          title: "Warning", middleText: " password does not match");
    }
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await resetPasswordData.postData(email!, password.text);
      print("=============controller $response");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          //Get.offNamed(Home);
        } else {
          Get.defaultDialog(title: "Warning", middleText: "Error");
          statusRequest = StatusRequest.failure;
        }
      }
      update();

      // Get.delete<SignU
    } else {
      print(" not valid");
    }
  }

  @override
  resetPassword() {}
}
