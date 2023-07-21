import 'package:ecommerce_application/core/constant/imageconstant.dart';
import 'package:ecommerce_application/core/constant/routesname.dart';
import 'package:ecommerce_application/view/screen/home/addProductScreen.dart';
import 'package:ecommerce_application/view/screen/language.dart';
import 'package:ecommerce_application/view/widget/home/company_informations.dart';
import 'package:ecommerce_application/view/widget/home/product_card.dart';
import 'package:ecommerce_application/view/widget/home/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                child: const CompanyInformation(
                  companyName: 'Mahmoud Hamza',
                  description: 'this company to make many prodacts',
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
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 205,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 30,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: 20,
                  itemBuilder: (context, index) => ProductWidget(
                        productName: 'Iphone Dmaa',
                        description:
                            'LocaleController" has been initialized LocaleController"  initialized LocaleController" has been initialized',
                        discount: '20 £',
                        imageProduct: AppImageAsset.background,
                        price: '30 £',
                      )),
            ),
          ),
        ],
      ),
    );
  }
}
