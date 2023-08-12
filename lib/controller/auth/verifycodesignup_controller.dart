// import 'package:ecommerce_application/core/class/statusrequest.dart';
// import 'package:ecommerce_application/core/constant/routesname.dart';
// import 'package:ecommerce_application/data/datasource/remote/auth/verifycodesignupdata.dart';
// import 'package:get/get.dart';

// import '../../core/function/handling_data.dart';

// abstract class VerifyCodeSignUpController extends GetxController {
//   checkCode();
//   goToSuccessSignup(String verifyCode);
// }

// class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
//   String? companyemail;

//   StatusRequest? statusRequest;

//   VerifyCodeSignupData verifycodesignupdata = VerifyCodeSignupData(Get.find());

//   @override
//   void onInit() {
//     super.onInit();
//     companyemail = Get.arguments['companyemail'];
//   }

//   @override
//   goToSuccessSignup(String verifyCode) async {
//     statusRequest = StatusRequest.loading;
//     update();
//     var response = await verifycodesignupdata.postData(
//       companyemail!,
//       verifyCode,
//     );
//     print("=============controller $response");
//     statusRequest = handlingData(response);
//     // if (StatusRequest.success == statusRequest) {
//     //   if (response['status'] == "success") {
//     //  data.addAll(response['data']);
//     Get.offNamed(AppRoute.successSignUP);
//     // } else {
//     //   Get.defaultDialog(
//     //       title: "Warning", middleText: "verify code is not correct");
//     //   statusRequest = StatusRequest.failure;
//     // }
//     //}
//     update();

//     // Get.delete<SignU
//   }

//   @override
//   checkCode() {
//     throw UnimplementedError();
//   }
// }
