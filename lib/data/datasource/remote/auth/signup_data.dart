import 'package:ecommerce_application/core/class/crud.dart';
import 'package:ecommerce_application/link_api.dart';

class SignUpData {
  Crud crud;
  SignUpData(this.crud);

  postData(
      String image,
      String imagename,
      String companyname,
      String companyemail,
      String companypass,
      String companyphone,
      String companycity,
      String companyaddress,
      String companycategory,
      String companypay,
      String companybio) async {
    var response = await crud.postData(AppLink.signupApi, {
      "companyname": companyname,
      "companyemail": companyemail,
      "companypassword": companypass,
      "companyphone": companyphone,
      "companycity": companycity,
      "companyaddress": companyaddress,
      "companycategory": companycategory,
      "companypay": companypay,
      "companybio": companybio,
    });
    return response.fold((l) => l, (r) => r);
  }
}
