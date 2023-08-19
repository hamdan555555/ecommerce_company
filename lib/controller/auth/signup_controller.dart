import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' as dioo;
import 'package:ecommerce_application/core/class/statusrequest.dart';
import 'package:ecommerce_application/core/constant/routesname.dart';
import 'package:ecommerce_application/core/function/handling_data.dart';
import 'package:ecommerce_application/data/datasource/remote/auth/signup_data.dart';
import 'package:ecommerce_application/link_api.dart';
import 'package:ecommerce_application/view/screen/auth/login.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart ' as http;

import '../../view/screen/auth/success_ signup.dart';

abstract class CompanySignUPController extends GetxController {
  signup();
  goToSignIn();
}

class CompanySignUpControllerImp extends CompanySignUPController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController companyname;
  late TextEditingController companyemail;
  late TextEditingController companypass;
  late TextEditingController companyphone;
  late TextEditingController companycity;
  late TextEditingController companystate;
  late TextEditingController companystreet;
  late TextEditingController companypayment;
  late TextEditingController companycategory;
  late TextEditingController companybio;

  String city = '23'.tr;
  String payment = '25'.tr;
  String category = '24'.tr;
  static var categoryNum;

  final List<String> cities = [
    "Damascus",
    "Aleppo",
    "Hama",
    "Lattakia",
    "Homs",
    "Tartus",
    "Sweida",
    "Edlep"
  ];

  final List<String> categories = [
    "Elecitrical",
    "Clothing",
    "Electronics",
    "Furniture",
    "Stationary",
    "Makeup And Perfumes",
    "Accessories",
  ];

  final List<String> payments = [
    "MTN Cash",
    "Pay Pal",
    "Visa Card",
  ];

  bool isShowpass = true;
  showpassword() {
    isShowpass = !isShowpass;
    update();
  }

  // File? file;
  // var myfile;
  // @override
  // Future imagepicker() async {
  //   myfile = await ImagePicker().getImage(source: ImageSource.gallery);
  //   file = File(myfile!.path);
  //   update();
  // }

  onChangedCity(String val) {
    city = val;
    update();
  }

  onChangedPayment(String val) {
    payment = val;
    update();
  }

  onChangedCategory(String val) {
    category = val;
    categoryNum = categories.indexOf(val) + 1;
    print(categoryNum);
    update();
  }

  SignUpData signupData = SignUpData(Get.find());
  List data = [];
  StatusRequest? statusRequest;

  @override
  signup() async {
    try {
      var formData = formState.currentState;
      if ((formData!.validate())) {
        statusRequest = StatusRequest.loading;
        update();
        print("start 1");

        var response = await signupData.postData(
          companyname.text,
          companyemail.text,
          companypass.text,
          companyphone.text,
          city,
          companystate.text,
          companystreet.text,
          categoryNum.toString(),
          companypayment.text,
          companybio.text,
        );

        print(response);
        statusRequest = handlingData(response);
        if (StatusRequest.success == statusRequest) {
          print("something");
            Get.to(Login());
          update();

          // Get.delete<SignU
        } else {
          print("email or pass not correct");
        }
      } else {
        print("not all data correct");
      }
      // print("=============controller $response");
      //statusRequest = handlingData(response);
      // if (StatusRequest.success == statusRequest) {
      //   if (response['status'] == "success") {
      //     data.addAll(response['data']);
      //     Get.offNamed(AppRoute.verifyCodeSignUp,
      //   arguments: {"companyemail": companyemail.text});
      //  } else {
      //  Get.defaultDialog(
      //    title: "Warning",
      //  middleText: "Phone Number or Email Already Exist");
      //statusRequest = StatusRequest.failure;
    } catch (e) {
      print(e);
    }
  }

//   Future<void> postt() async {
//     try {
//       var request1 =
//           http.MultipartRequest('POST', Uri.parse(AppLink.signupApi));
//       request1.headers.addAll({'Accept': 'application/json'});

//       companyimage = base64Encode(file!.readAsBytesSync());
//       Uint8List data = await myfile.readAsBytes();
//       List<int> list = data.cast();
//       if (kIsWeb) {
//         companyimage = Image.network(file!.path);
//       } else {
//         companyimage = Image.file(File(file!.path));
//       }
//       request1.files.add(await http.MultipartFile.fromBytes("Image", list,
//           filename: companyimage));
//       request1.fields["CompanyName"] = companyname.text;
//       request1.fields["CompanyEmail"] = companyemail.text;
//       request1.fields["CompanyPassword"] = companypass.text;
//       request1.fields["CompanyPhone"] = companyphone.text;
//       request1.fields["City"] = city;
//       request1.fields["State"] = companystate.text;
//       request1.fields["Street"] = companystreet.text;
//       request1.fields["Payment"] = companypayment.text;
//       request1.fields["catigory_id"] = "3";
//       request1.fields["Bio"] = companybio.text;

//       //request1.files.add(http.MultipartFile("Image", objFile.readStream!, objFile.size,filename: objFile.name));

// // final ImageStream = http.ByteStream(file!.openRead());
// // final imagelength = await file!.length();
// // final imageupload = http.MultipartFile('Image',ImageStream,imagelength,filename: file!.path.split('/').last);
// // request1.files.add(imageupload);
// //

//       try {
//         var myresponse = await request1.send();
//         String resultt = await myresponse.stream.bytesToString();
//         print(resultt);

//         if (myresponse.statusCode == 200) {
//           // Request successful, handle the response here
//           final responseString = await myresponse.stream.bytesToString();
//           print('Response: $responseString');
//         } else {
//           // Request failed with an error status code, handle the error here
//           print('Error: ${myresponse.statusCode}');
//         }
//       } catch (e) {
//         print('Exception: $e');
//         print("heeeeey");
//       }

//
// myresponse.stream.bytesToString().asStream().listen((event) {
//   var parsedjson = json.decode(event);
//   print(parsedjson);
//   print(myresponse.statusCode);
// });

//

  // var responsed = await http.Response.fromStream(myresponse);
  // final responsedata = json.decode(responsed.body);

  // if(myresponse.statusCode==200|| myresponse.statusCode==201){
  //   print("success");
  //   print(responsedata);
  // }else{

  //   print(myresponse.statusCode);
  //   print("error");
  //   print(responsedata["message"]);
  // }
  //   } catch (e) {
  //     print(e);
  //     print("ops");
  //   }
  // }

  // Future<void> posttt() async {
  //   try {
  //     final dio = dioo.Dio();
  //     dio.interceptors
  //         .add(dioo.LogInterceptor(requestBody: true, responseBody: true));

  //     String filenamee = file!.path.split("/").last;
  //     dioo.FormData formdata = dioo.FormData.fromMap({
  //       "CompanyName": companyname.text,
  //       "CompanyEmail": companyemail.text,
  //       "CompanyPassword": companypass.text,
  //       "CompanyPhone": companyphone.text,
  //       "City": city,
  //       "State": companystate.text,
  //       "Street": companystreet.text,
  //       "Payment": companypayment.text,
  //       "catigory_id": "3",
  //       "Bio": companybio.text,
  //       "Image": await dioo.MultipartFile.fromString(myfile.path,
  //           filename: filenamee),
  //     });

  //     final response = await dio.post(AppLink.signupApi, data: formdata);
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       // Request successful, handle the response here

  //       print('Response: ${response.data}');
  //     } else {
  //       // Request failed with an error status code, handle the error here
  //       print('Error: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     print(e);
  //     print("done");
  //   }
  // }

  //  update();

  // Get.delete<SignU
  //  } else {
  //  Get.defaultDialog(
  //    title: "Warning", middleText: "Error Occured Please Try Again");
  //  }

//////////////////////////////////////////////////////////////////////////////////////////////
  @override
  void onInit() {
    companyname = TextEditingController();
    companyemail = TextEditingController();
    companypass = TextEditingController();
    companyphone = TextEditingController();
    companybio = TextEditingController();
    companystate = TextEditingController();
    companystreet = TextEditingController();
    companypayment = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    companyname.dispose();
    companyemail.dispose();
    companypass.dispose();
    companyphone.dispose();
    companystate.dispose();
    companystreet.dispose();
    companybio.dispose();
    super.dispose();
  }

  @override
  goToSignIn() {
    Get.to(Login());
  }
}
