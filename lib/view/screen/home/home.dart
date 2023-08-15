import 'package:ecommerce_application/core/constant/imageconstant.dart';
import 'package:ecommerce_application/view/screen/home/addProductScreen.dart';
import 'package:ecommerce_application/view/widget/home/company_informations.dart';
import 'package:ecommerce_application/view/widget/home/product_card.dart';
import 'package:ecommerce_application/view/widget/home/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/login_controller.dart';
import '../../../controller/navigationRail_Controller.dart';

class HomeScreen extends GetView<NavigationRailController> {
  HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
  Get.put(NavigationRailController());
    return Scaffold(
      body: GetBuilder<NavigationRailController>(
        builder: (_) {
          return Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 350,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: const Border(
                        bottom: BorderSide(width: 1.0, color: Colors.grey),
                      ),
                    ),
                  ),
                  Container(
                    height: 150,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(AppImageAsset.blueback),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    child:  CompanyInformation(
                      companyName: LoginControllerImp.companyName,
                      description: LoginControllerImp.bio,
                      imageCompany: 'asstes/images/logo.png',
                    ),
                  ),
                  Positioned(
                    top: 270,
                    right: 10,
                    child: Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Get.to(AddProduct());
                          },
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(10, 43),
                              backgroundColor: Colors.lightGreenAccent[700],
                              elevation: 12.0,
                              textStyle: const TextStyle(color: Colors.white)),
                          child: const Text('Add Product'),
                        ),
                        const SizedBox(
                          width: 725,
                        ),
                        SearchWidget(),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  color: Colors.grey[200],
                  child:controller.listProduct==null? Text('empty data' ) : GridView.builder(
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 205,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 30,
                        childAspectRatio: 0.8,
                      ),
                      itemCount: controller.listProduct.length,
                      itemBuilder: (context, index) => ProductWidget(
                            productName: controller.listProduct[index]['Name'],
                            description:controller.listProduct[index]['description'],
                            quantity: '${controller.listProduct[index]['Quantity']}',
                            imageProduct: AppImageAsset.background,
                            price: '${controller.listProduct[index]['Price']} £', 
                            idProduct: '${controller.listProduct[index]['id']}',
                          )),
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}
