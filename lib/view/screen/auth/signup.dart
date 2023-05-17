import 'dart:io';
import 'package:ecommerce_application/core/constant/colors.dart';
import 'package:ecommerce_application/core/constant/imageconstant.dart';
import 'package:ecommerce_application/core/function/alertexitapp.dart';
import 'package:ecommerce_application/core/function/validinput.dart';
import 'package:ecommerce_application/view/widget/auth/textsignup.dart';
import 'package:ecommerce_application/view/widget/auth/custombuttonAuth.dart';
import 'package:ecommerce_application/view/widget/auth/custommainlabel.dart';
import 'package:ecommerce_application/view/widget/auth/customtextform.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/auth/signup_controller.dart';
import '../../widget/auth/custombodylabel.dart';

class CompanySignUp extends StatelessWidget {
  const CompanySignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => CompanySignUpControllerImp());
    return Scaffold(
      backgroundColor: AppColor.colour2,
      body: GetBuilder<CompanySignUpControllerImp>(
        builder: (controller) => Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: WillPopScope(
            onWillPop: alertExitApp,
            child: Form(
              key: controller.formState,
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: CustomMainLabel(
                      mainLabel: '21'.tr,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomBodyLabel(
                    bodyLabel: '22'.tr,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Obx(() => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: AppColor.colour3,
                            radius: 55,
                            backgroundImage: controller.imagepath.isNotEmpty
                                ? FileImage(
                                    File(controller.imagepath.toString()))
                                : null,
                          ),
                          TextButton(
                              onPressed: () => controller.getImage(),
                              child: Text(
                                "set company image",
                                style: TextStyle(
                                    color: AppColor.colour3,
                                    fontWeight: FontWeight.bold),
                              ))
                        ],
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextForm(
                    isNumber: false,
                    controller: controller.companyname,
                    hintText: '23'.tr,
                    labelText: '15'.tr,
                    iconData: Icons.person_outlined,
                    valid: (val) {
                      return validInput(val!, 5, 50, "company name");
                    },
                  ),
                  CustomTextForm(
                      isNumber: true,
                      valid: (val) {
                        return validInput(val!, 5, 50, "phone");
                      },
                      controller: controller.companyphone,
                      hintText: '24'.tr,
                      labelText: '17'.tr,
                      iconData: Icons.phone_android_outlined),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 35),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                BorderSide(color: AppColor.colour3, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                BorderSide(color: AppColor.colour3, width: 2),
                          ),
                        ),
                        hint: Text(controller.country),
                        items: controller.cities
                            .map((e) => DropdownMenuItem(
                                  child: Center(child: Text("$e")),
                                  value: e,
                                ))
                            .toList(),
                        onChanged: (value) {
                          controller.onChangedCountry(value!);
                          controller.onChangedCity(controller.city);
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 35),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                BorderSide(color: AppColor.colour3, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                BorderSide(color: AppColor.colour3, width: 2),
                          ),
                        ),
                        hint: Text(controller.city),
                        items: controller.country == "Emirates"
                            ? controller.countryUAE
                                .map((e) => DropdownMenuItem(
                                      child: Center(child: Text("$e")),
                                      value: e,
                                    ))
                                .toList()
                            : controller.country == "Egypt"
                                ? controller.countryEGY
                                    .map((e) => DropdownMenuItem(
                                          child: Center(child: Text("$e")),
                                          value: e,
                                        ))
                                    .toList()
                                : controller.countrySY
                                    .map((e) => DropdownMenuItem(
                                          child: Center(child: Text("$e")),
                                          value: e,
                                        ))
                                    .toList(),
                        onChanged: (value) {
                          controller.onChangedCity(value!);
                        }),
                  ),
                  CustomTextForm(
                    isNumber: false,
                    controller: controller.companyaddress,
                    hintText: '27'.tr,
                    labelText: '7'.tr,
                    iconData: Icons.location_on,
                    valid: (val) {
                      return validInput(val!, 20, 100, "address");
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 35),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                BorderSide(color: AppColor.colour3, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                BorderSide(color: AppColor.colour3, width: 2),
                          ),
                        ),
                        hint: Text(controller.payment),
                        items: ["PayPal", "VisaCard", "MTN Cash"]
                            .map((e) => DropdownMenuItem(
                                  child: Center(child: Text("$e")),
                                  value: e,
                                ))
                            .toList(),
                        onChanged: (value) {
                          controller.onChangedCountry(value!);
                        }),
                  ),
                  CustomTextForm(
                    isNumber: false,
                    controller: controller.companybio,
                    hintText: '26'.tr,
                    labelText: '7'.tr,
                    iconData: Icons.info,
                    valid: (val) {
                      return validInput(val!, 20, 100, "bio");
                    },
                  ),
                  CustomButtonAuth(
                    onPressed: () {
                      controller.signup();
                    },
                    text: '12'.tr,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextSignUpOrIn(
                    text1: "18".tr,
                    text2: "2".tr,
                    onTap: () {
                      controller.goToSignIn();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
