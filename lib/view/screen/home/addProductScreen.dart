import 'package:ecommerce_application/controller/home/AddProduct_controller.dart';
import 'package:ecommerce_application/core/constant/colors.dart';
import 'package:ecommerce_application/core/constant/imageconstant.dart';
import 'package:ecommerce_application/core/function/alertexitapp.dart';
import 'package:ecommerce_application/core/function/validinput.dart';
import 'package:ecommerce_application/view/widget/home/productTextForm.dart';
import 'package:ecommerce_application/view/widget/home/textForm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widget/auth/custombuttonAuth.dart';
import 'navigationRail.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => AddProductControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          'Add Product'.tr,
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(color: AppColor.grey),
        ),
        leading: IconButton(
            onPressed: () {
              Get.to(NavigationRailView());
            },
            icon: Icon(
              Icons.arrow_back_outlined,
            ),
            color:Colors.black,),
      ),
      body: GetBuilder<AddProductControllerImp>(
        builder: (controller) =>
            //statusRequest: controller.statusRequest,
            Row(
          children: [
            Container(
              width: 500,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              child: WillPopScope(
                onWillPop: alertExitApp,
                child: Form(
                  key: controller.formState,
                  child: ListView(
                    children: [
                      ////////////////////////////////////

                      // CircleAvatar(
                      //   backgroundColor: AppColor.colour3,
                      //   radius: 70,
                      //   child: controller.file == null
                      //       ? const Icon(Icons.image_not_supported_outlined)
                      //       : ClipOval(
                      //           child: Image.network(
                      //           controller.file!.path,
                      //           fit: BoxFit.cover,
                      //           height: 130,
                      //           width: 130,
                      //         )),
                      // ),
                      TextButton(
                          onPressed: () => controller.imagepicker(),
                          child: const Text(
                            "Set Product Image",
                            style: TextStyle(
                                color: AppColor.colour3,
                                fontWeight: FontWeight.bold),
                          )),

                      ///////////////////////////

                      ProductTextForm(
                        isNumber: false,
                        controller: controller.name,
                        hintText: 'Enter Product Name'.tr,
                        labelText: 'Product Name'.tr,
                        iconData: Icons.production_quantity_limits_outlined,
                        valid: (val) {
                          return validInput(val!, 3, 50, "productname");
                        },
                      ),
                      ProductTextForm(
                          isNumber: true,
                          valid: (val) {
                            return validInput(val!, 1, 5, "price");
                          },
                          controller: controller.price,
                          hintText: 'Enter Price Product'.tr,
                          labelText: 'Price Product'.tr,
                          iconData: Icons.price_change_outlined),
                      ProductTextForm(
                          isNumber: true,
                          valid: (val) {
                            return validInput(val!, 1, 5, "quantity");
                          },
                          controller: controller.quantity,
                          hintText: 'Enter Quantity Product'.tr,
                          labelText: 'Quantity Product'.tr,
                          iconData: Icons.cached_outlined),
                      TextForm(
                        isNumber: false,
                        controller: controller.slug,
                        hintText: 'Enter Slug Product'.tr,
                        labelText: 'Slug Product'.tr,
                        iconData: Icons.lock_outlined,
                      ),
                      TextForm(
                        isNumber: false,
                        controller: controller.description,
                        hintText: 'Enter Description'.tr,
                        labelText: 'Description'.tr,
                        iconData: Icons.description_outlined,
                      ),
                      CustomButtonAuth(
                        onPressed: () {
                          controller.addProduct();
                        },
                        text: 'Add Product'.tr,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 80),
              child: Image.asset(AppImageAsset.onBoardingImageTwo),
            ),
          ],
        ),
      ),
    );
  }
}
