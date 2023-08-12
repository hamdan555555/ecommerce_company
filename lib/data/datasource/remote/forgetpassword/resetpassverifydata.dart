// import 'package:ecommerce_application/core/class/statusrequest.dart';
// import 'package:ecommerce_application/link_api.dart';

// import '../../../../core/class/crud.dart';

// class ResetPasswordVerifyData {
//   Crud crud;

//   ResetPasswordVerifyData(this.crud);

//   StatusRequest? statusRequest;

//   postData(String companyemail, String verifyCode) async {
//     statusRequest = StatusRequest.loading;
//     var response = await crud.postData(AppLink.resetpassverify, {
//       "companyemail": companyemail,
//       "verifyCode": verifyCode,
//     });
//     return response.fold((l) => l, (r) => r);
//   }
// }
