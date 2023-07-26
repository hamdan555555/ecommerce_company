import 'package:ecommerce_application/core/class/crud.dart';
import 'package:ecommerce_application/link_api.dart';

class AddProductData {
  Crud crud;
  AddProductData(this.crud);

  postData(String name, String slug, String price, String quantity,String description) async {
    var response = await crud.postData(AppLink.addProduct, {
      //"company_id": company_id,
      //"catigoryProduct_id":catigoryProduct_id ,
      "name": name,
      // "image":image ,
      "slug": slug,
      "price": price,
      "quantity": quantity,
      "description": description,
      // "id":id ,
    });
    return response.fold((l) => l, (r) => r);
  }
}
