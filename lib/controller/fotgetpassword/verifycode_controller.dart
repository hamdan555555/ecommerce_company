// import 'package:ecommerce_application/core/class/statusrequest.dart';
// import 'package:ecommerce_application/core/constant/routesname.dart';
// import 'package:ecommerce_application/core/function/handling_data.dart';
// import 'package:ecommerce_application/data/datasource/remote/forgetpassword/resetpassverifydata.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// abstract class VerifyCodeController extends GetxController {
//   checkCode();
//   goToResetPassword(String verifyCode);
// }

// class VerifyCodeControllerImp extends VerifyCodeController {
//   // late String verifyCode;
//   String? email;
//   ResetPasswordVerifyData resetPasswordVerifyData =
//       ResetPasswordVerifyData(Get.find());
//   StatusRequest? statusRequest;

//   @override
//   void onInit() {
//     email = Get.arguments['email'];
//     super.onInit();
//   }

//   @override
//   goToResetPassword(String verifyCode) async {
//     statusRequest = StatusRequest.loading;
//     update();
//     var response = await resetPasswordVerifyData.postData(
//       email!,
//       verifyCode,
//     );
//     print("=============controller $response");
//     statusRequest = handlingData(response);
//     if (StatusRequest.success == statusRequest) {
//       if (response['status'] == "success") {
//         //  data.addAll(response['data']);
//         Get.offNamed(AppRoute.resetPassword, arguments: {"email": email});
//       } else {
//         Get.defaultDialog(
//             title: "Warning", middleText: "verify code is not correct");
//         statusRequest = StatusRequest.failure;
//       }
//     }
//     update();
//   }

//   @override
//   checkCode() {}
// }
