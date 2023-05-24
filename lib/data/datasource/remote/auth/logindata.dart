import 'package:ecommerce_application/core/class/statusrequest.dart';
import 'package:ecommerce_application/link_api.dart';

import '../../../../core/class/crud.dart';

class LoginData {
  Crud crud;

  LoginData(this.crud);

  StatusRequest? statusRequest;

  postData(String companyemail, String companypass) async {
    statusRequest = StatusRequest.loading;
    var response = await crud.postData(AppLink.login, {
      "companyemail": companyemail,
      "companypass": companypass,
    });
    return response.fold((l) => l, (r) => r);
  }
}
