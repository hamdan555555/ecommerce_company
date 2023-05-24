import 'package:ecommerce_application/core/class/statusrequest.dart';
import 'package:ecommerce_application/core/constant/routesname.dart';
import 'package:ecommerce_application/core/function/handling_data.dart';
import 'package:ecommerce_application/data/datasource/remote/auth/logindata.dart';
import 'package:ecommerce_application/data/datasource/remote/forgetpassword/checkemaildata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CheckEmailController extends GetxController {
  goToVerifyCode();
}

class CheckEmailControllerImp extends CheckEmailController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController email;

  CheckEmailData checkEmailData = CheckEmailData(Get.find());
  StatusRequest? statusRequest;

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  @override
  goToVerifyCode() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await checkEmailData.postData(email.text);
      print("=============controller $response");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoute.verifyCode, arguments: {
            "email": email.text,
          });
        } else {
          Get.defaultDialog(
              title: "Warning", middleText: "Email is not correct");
          statusRequest = StatusRequest.failure;
        }
      }
      update();

      // Get.delete<SignU
    } else {
      print(" not valid");
    }
  }
}
