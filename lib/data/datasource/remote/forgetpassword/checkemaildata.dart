// import 'package:ecommerce_application/core/class/statusrequest.dart';
// import 'package:ecommerce_application/link_api.dart';

// import '../../../../core/class/crud.dart';

// class CheckEmailData {
//   Crud crud;

//   CheckEmailData(this.crud);

//   StatusRequest? statusRequest;

//   postData(String companyemail) async {
//     statusRequest = StatusRequest.loading;
//     var response = await crud.postData(AppLink.checkemail, {
//       "companyemail": companyemail,
//     });
//     return response.fold((l) => l, (r) => r);
//   }
// }
