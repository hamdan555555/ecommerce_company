import 'dart:html';

import 'package:ecommerce_application/controller/auth/login_controller.dart';
import 'package:ecommerce_application/core/class/crud.dart';
import 'package:ecommerce_application/core/class/statusrequest.dart';
import 'package:ecommerce_application/core/constant/routesname.dart';
import 'package:ecommerce_application/core/function/handling_data.dart';
import 'package:ecommerce_application/data/datasource/remote/add_product.dart';
import 'package:ecommerce_application/data/datasource/remote/auth/signup_data.dart';
import 'package:ecommerce_application/view/screen/home/addProductScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart' as DIO;
import 'dart:io'as IO;
abstract class AddProductController extends GetxController {
  addProduct();
}

class AddProductControllerImp extends AddProductController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController name;
  late TextEditingController slug;
  late TextEditingController price;
  late TextEditingController quantity;
  late TextEditingController description;
  String id = '2';
  AddProductData dataProduct = AddProductData(Get.find());
  List data = [];
  StatusRequest statusRequest = StatusRequest.none;

  File? file;
  var myfile;
  @override
  Future imagepicker() async {
    myfile = await ImagePicker().getImage(source: ImageSource.gallery);
    //  file = File(myfile!.path);
    update();
  }

  @override
  addProduct() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
     // PickedFile? tmp = await ImagePicker().getImage(source: ImageSource.gallery);
    //  IO.File image = IO.File(tmp!.path);
      
      var response = await dataProduct.postData(
        name.text,
        slug.text,
        price.text,
        quantity.text,
        description.text,
        id,
       // image
      );

      print("=============controller $response");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['message'] == "create product successfully") {
          print('--------------------');
          // data.addAll(response['data']);
          Get.defaultDialog(
              title: "Success", middleText: "create product successfully");
        } else {
          Get.defaultDialog(
              title: "Warning",
              middleText: "create product failed");
          statusRequest = StatusRequest.failure;
        }
      }
      update();

      // Get.delete<SignUpControllerImp>();
    } else {
      print(" not valid");
    }
  }

  @override
  void onInit() {
    name = TextEditingController();
    slug = TextEditingController();
    price = TextEditingController();
    quantity = TextEditingController();
    description = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    name.dispose();
    slug.dispose();
    price.dispose();
    quantity.dispose();
    description.dispose();
    super.dispose();
  }

  @override
  goToSignIn() {
    Get.offNamed(AppRoute.login);
  }
}
