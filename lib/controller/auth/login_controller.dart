import 'dart:convert';

import 'package:ecommerce_application/core/class/statusrequest.dart';
import 'package:ecommerce_application/core/constant/routesname.dart';
import 'package:ecommerce_application/core/function/handling_data.dart';
import 'package:ecommerce_application/data/datasource/remote/auth/logindata.dart';
import 'package:ecommerce_application/view/screen/home/home.dart';
import 'package:ecommerce_application/view/screen/home/navigationRail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
  showPassword();
}

class LoginControllerImp extends LoginController {
  LoginData loginData = LoginData(Get.find());
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  bool isShow = true;
  StatusRequest? statusRequest;

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  
  login() async {
    try{
    var formData = formState.currentState;
    if (formData!.validate()) {

      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(email.text, password.text);
      
      print(response);

      statusRequest = handlingData(response);
      print("on handling");
    
    if (StatusRequest.success==statusRequest){
      print("success status");
      if (response["message"] == "success login as company") {
        print(response["message"]);
          print("something");
          Get.to(NavigationRailView());
      }
      print("failedd");
    }else{
      print("email or pass not correct");
       Get.defaultDialog(
              title: "Warning", middleText: "Email or password not correct");

    }
    update();


        // if (response['message'] == "success login as company") {
        //   Get.offNamed(AppRoute.successSignUP);
        //   print("message is correct");
        // }
        //  else {
        //   Get.defaultDialog(
        //       title: "Warning", middleText: "Email or password not correct");
        //       print("you are here");              
         // statusRequest = StatusRequest.failure;
         //update();
        //}
     // }

      // Get.delete<SignU
    
    
    
    
    //  else {
    //   print("email or pass not correct");
    //   Get.offNamed(AppRoute.signUp);
    // }

    // }else{
    //   print("status not success");
    // }


  }
  else{
    print("not all data correct");
    Get.defaultDialog(middleText: "data is not validated");
  }
    

    }catch(e){
      print(e);
    }
  }

  

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword, arguments: email.text);
  }

  @override
  showPassword() {
    isShow = isShow == true ? false : true;
    update();
  }
}


