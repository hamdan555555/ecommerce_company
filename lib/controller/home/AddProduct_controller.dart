import 'dart:io';
import 'package:ecommerce_application/core/class/statusrequest.dart';
import 'package:ecommerce_application/core/constant/routesname.dart';
import 'package:ecommerce_application/core/function/handling_data.dart';
import 'package:ecommerce_application/data/datasource/remote/auth/signup_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/datasource/remote/add_product.dart';

abstract class AddProductController extends GetxController {
  addProduct();
  goToSignIn();
}

class AddProductControllerImp extends AddProductController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController company_id;
  late TextEditingController catigoryProduct_id;
  late TextEditingController name;
  late TextEditingController slug;
  late TextEditingController price;
  late TextEditingController quantity;
  late TextEditingController description;
  late TextEditingController id;

  AddProductData productData = AddProductData(Get.find());
  List data = [];
  StatusRequest statusRequest = StatusRequest.none;

  File? file;

  @override
  Future imagepicker() async {
    final myfile = await ImagePicker().getImage(source: ImageSource.gallery);
    file = File(myfile!.path);
    update();
  }

  @override
  addProduct() async {
    print('Error 1');
    var formData = formState.currentState;
    print('Error 2');
    if (formData!.validate()) {
    print('Error 3');
    print('Error 4');
      update();
      var response = await productData.postData(
        name.text,
        slug.text,
        price.text,
        quantity.text,
        description.text,
      );
    print('Error 5');
      print("=============controller $response");
    print('Error 6');
        if (response["message"] == "create product successfully") {
          print('Hello');
          Get.offNamed(AppRoute.verifyCodeSignUp);
        } else {
          Get.defaultDialog(
              title: "Warning",
              middleText: "Phone Number or Email Already Exist");
          statusRequest = StatusRequest.failure;
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
    price = TextEditingController();
    quantity = TextEditingController();
    slug = TextEditingController();
    description = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    name.dispose();
    price.dispose();
    quantity.dispose();
    slug.dispose();
    description.dispose();
    super.dispose();
  }

  @override
  goToSignIn() {
    Get.offNamed(AppRoute.login);
  }
}
