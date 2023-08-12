import 'dart:io';

import 'package:ecommerce_application/core/class/crud.dart';
import 'package:ecommerce_application/link_api.dart';
import 'package:get/get.dart';

class AddProductData {
  Crud crud;
  AddProductData(this.crud);

  postData(String name, String slug, String price, String quantity,String description , File image) async {
    var response = await crud.postData(AppLink.addProduct, {
      //"company_id": company_id,
      //"catigoryProduct_id":catigoryProduct_id ,
      "name": name,
      "slug": slug,
      "price": price,
      "quantity": quantity,
      "description": description,
      // "image":image !=null ? await MultipartFile.fromFile(image.path):null  ,
      // "id":id ,
    });
    return response.fold((l) => l, (r) => r);
  }
}
