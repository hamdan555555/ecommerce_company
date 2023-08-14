import 'package:ecommerce_application/core/class/crud.dart';
import 'package:ecommerce_application/link_api.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart ' as http;
import 'package:get/get.dart';

class SignUpData {
  Crud crud;
 SignUpData(this.crud);


 //final _connect = GetConnect();

  postData(
      String companyname,
      String companyemail,
      String companypass,
      String companyphone,
      String companycity,
      String companystate,
      String companystreet,
      String companycategory,
      String companypay,
      String companybio,
      String image,
      
      ) async {
        
    var response = await crud.postData(
      AppLink.signupApi,
       {
      "Image": image,
      "CompanyName": companyname,
      "CompanyEmail": companyemail,
      "CompanyPassword": companypass,
      "CompanyPhone": companyphone,
      "City": companycity,
      // "companyaddress": companyaddress,
      "State": companystate,
      "Street": companystreet,
      "catigory_id": "1",
      "Payment": companypay,
      "Bio": companybio,
    });
     return response.fold((l) => l, (r) => r);
  }


  //  Future<void> sendPostRequest(
  //    String image,
  //     // String imagename,
  //     String companyname,
  //     String companyemail,
  //     String companypass,
  //     String companyphone,
  //     String companycity,
  //     //String companyaddress,
  //     String companystate,
  //     String companystreet,
  //     String companycategory,
  //     String companypay,
  //     String companybio) async {
  //   final response = await _connect.post(AppLink.signupApi,
  //    {
  //      "Image": image,
  //     "CompanyName": companyname,
  //     "CompanyEmail": companyemail,
  //     "CompanyPassword": companypass,
  //     "CompanyPhone": companyphone,
  //     "City": companycity,
  //     // "companyaddress": companyaddress,
  //     "State": companystate,
  //     "Street": companystreet,
  //     "catigory_id": companycategory,
  //     "Payment": companypay,
  //     "Bio": companybio,
  //    },
  //    );

  //    if(kDebugMode){
  //     print(response.body);
  //    }


  // }

}
