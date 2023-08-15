import 'dart:io';

import 'package:ecommerce_application/core/class/crud.dart';
import 'package:ecommerce_application/link_api.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as DIO;

import '../../../controller/auth/login_controller.dart';

class AddProductData {
  Crud crud;
  AddProductData(this.crud);

  postData(String name, String slug, String price, String quantity,
      String description, String id//, File image
      ) async {
    DIO.Dio dio = DIO.Dio(
      DIO.BaseOptions(
        baseUrl: '',
      ),
    );
    DIO.Response responses = await dio.post(AppLink.addProduct, data: {
      "name": name,
      "slug": slug,
      "price": price,
      "quantity": quantity,
      "description": description,
      "catigoryProduct_id": id,
    //  "image":  DIO.MultipartFile.fromFileSync(image.path),
    },
    options: DIO.Options(
      headers: {
            'Authorization': 'Bearer ${LoginControllerImp.token}',
            'Accept' : 'application/json'
          }
    )
    );
    /*var response = await crud.postData(AppLink.addProduct, {
      //"company_id": company_id,
      //"catigoryProduct_id":catigoryProduct_id ,
      "name": name,
      "slug": slug,
      "price": price,
      "quantity": quantity,
      "description": description,
      "catigoryProduct_id": id

      // "image":image !=null ? await MultipartFile.fromFile(image.path):null  ,
      // "id":id ,
    });*/
    print('''
   status code : ${responses.statusCode}
   data : ${responses.data}
''');
    return responses.data;
  }
}
