import 'dart:io';
import 'dart:typed_data';
import 'package:ecommerce_application/core/class/statusrequest.dart';
import 'package:ecommerce_application/core/constant/routesname.dart';
import 'package:ecommerce_application/data/datasource/remote/add_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

abstract class AddProductController extends GetxController {
  addProduct();
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
  Uint8List? fileBytes;
  @override
  Future imagepicker() async {
    final myfile = await ImagePicker().getImage(source: ImageSource.gallery);
    file = File(myfile!.path);
    List<int> fileContent = await file!.readAsBytes();
    fileBytes = Uint8List.fromList(fileContent);
    update();
  }

  addProduct() async {
    print(file);
    print(fileBytes);

    print('ERROR 1');
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer 40|X9hVH72c8ZJ8ldAGT4XPFL5vRlAoQ9CLjDwGJtaS'
    };
    try {
      var request =
          http.MultipartRequest('POST', Uri.parse(AppRoute.addProduct));
      request.fields.addAll({
        'catigoryProduct_id': '3',
        'name': name.text,
        'slug': slug.text,
        'price': price.text,
        'quantity': quantity.text,
        'description': description.text,
      });
      // request.files.add(await http.MultipartFile.fromBytes(
      //   'field',
      // ));
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e);
    }
  }

  // @override
  // addProduct() async {
  //   print('Error 1');
  //   var formData = formState.currentState;
  //   print('Error 2');
  //   if (formData!.validate()) {
  //     print('Error 3');
  //     print('Error 4');
  //     update();
  //     var response = await productData.postData(
  //       name.text,
  //       slug.text,
  //       price.text,
  //       quantity.text,
  //       description.text,
  //     );
  //     print('Error 5');
  //     print("=============controller $response");
  //     print('Error 6');
  //     if (response["message"] == "create product successfully") {
  //       print('Hello');
  //       Get.offNamed(AppRoute.verifyCodeSignUp);
  //     } else {
  //       Get.defaultDialog(
  //         title: "Warning",
  //         middleText: "Phone Number or Email Already Exist",
  //       );
  //       statusRequest = StatusRequest.failure;
  //     }

  //     update();

  //     // Get.delete<SignUpControllerImp>();
  //   } else {
  //     print(" not valid");
  //   }
  // }

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
}
