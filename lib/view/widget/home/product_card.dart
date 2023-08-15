import 'package:ecommerce_application/core/constant/colors.dart';
import 'package:ecommerce_application/core/constant/imageconstant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/navigationRail_Controller.dart';

class ProductWidget extends StatelessWidget {
  final String productName;
  final String price;
  final String quantity;
  final String description;
  final String imageProduct;
  final String idProduct;

  const ProductWidget(
      {super.key,
      required this.productName,
      required this.price,
      required this.imageProduct,
      required this.quantity,
      required this.description, required this.idProduct, });

  @override
  Widget build(BuildContext context) {
    NavigationRailController controller = Get.put(NavigationRailController());
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          print(productName);
          Get.defaultDialog(
              title: "Delete Product",
              middleText: "Do you Want Delete Product ?",
              actions: [
                ElevatedButton(
                  onPressed: () {
                    controller.deleteProduct(idProduct);
                    print('Product Deleted');
                    Get.back();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(AppColor.blue),
                    overlayColor: MaterialStateProperty.all(Colors.red),
                  ),
                  child: const Text("Delete"),
                ),
                ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(AppColor.blue),
                      overlayColor: MaterialStateProperty.all(Colors.green),
                    ),
                    child: const Text("Cancel")),
              ]);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 120,
                  width: 190,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage(imageProduct),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(productName,
                      style: const TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 8.0),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15, right: 15, bottom: 5),
                  child: Text(description,
                      style:
                          const TextStyle(fontSize: 10.0, color: Colors.grey)),
                ),
                const SizedBox(height: 8.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Text(
                        // '\$${product.price.toStringAsFixed(2)}'
                        price,
                        style: const TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        // '\$${product.price.toStringAsFixed(2)}'
                        quantity,
                        style: const TextStyle(
                            fontSize: 15.0, color: Colors.amber),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
