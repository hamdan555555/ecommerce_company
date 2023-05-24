import 'package:ecommerce_application/core/class/statusrequest.dart';
import 'package:ecommerce_application/link_api.dart';

import '../../../../core/class/crud.dart';

class ResetPasswordData {
  Crud crud;

  ResetPasswordData(this.crud);

  StatusRequest? statusRequest;

  postData(String companyemail, String companynewpass) async {
    statusRequest = StatusRequest.loading;
    var response = await crud.postData(AppLink.resetpass, {
      "companyemail": companyemail,
      "companypass": companynewpass,
    });
    return response.fold((l) => l, (r) => r);
  }
}
