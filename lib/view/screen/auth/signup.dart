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
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 300),
          child: WillPopScope(
            onWillPop: alertExitApp,
            child: Form(
              key: controller.formState,
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: CustomMainLabel(
                      mainLabel: '28'.tr,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomBodyLabel(
                    bodyLabel: '29'.tr,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Obx(() => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: AppColor.colour3,
                            radius: 70,
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
                                    color: Colors.white,
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
                    hintText: '15'.tr,
                    labelText: '15'.tr,
                    iconData: Icons.person_outlined,
                    valid: (val) {
                      return validInput(val!, 5, 50, "companyname");
                    },
                  ),
                  CustomTextForm(
                      isNumber: false,
                      valid: (val) {
                        return validInput(val!, 20, 50, "companyemail");
                      },
                      controller: controller.companyemail,
                      hintText: '6'.tr,
                      labelText: '17'.tr,
                      iconData: Icons.email),
                  CustomTextForm(
                      obscureText: controller.isShowpass,
                      onTapIcon: () {
                        controller.showpassword();
                      },
                      isNumber: true,
                      valid: (val) {
                        return validInput(val!, 5, 50, "companypass");
                      },
                      controller: controller.companypass,
                      hintText: '8'.tr,
                      labelText: '17'.tr,
                      iconData: Icons.lock),
                  CustomTextForm(
                      isNumber: true,
                      valid: (val) {
                        return validInput(val!, 5, 50, "companyphone");
                      },
                      controller: controller.companyphone,
                      hintText: '16'.tr,
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
                        hint: Text(controller.city),
                        items: controller.cities
                            .map((e) => DropdownMenuItem(
                                  child: Center(child: Text("$e")),
                                  value: e,
                                ))
                            .toList(),
                        onChanged: (value) {
                          controller.onChangedCity(controller.city);
                        }),
                  ),
                  CustomTextForm(
                    isNumber: false,
                    controller: controller.companyaddress,
                    hintText: '26'.tr,
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
                        hint: Text(controller.category),
                        items: controller.categories
                            .map((e) => DropdownMenuItem(
                                  child: Center(child: Text("$e")),
                                  value: e,
                                ))
                            .toList(),
                        onChanged: (value) {
                          controller.onChangedCategory(value!);
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
                        hint: Text(controller.category),
                        items: controller.payments
                            .map((e) => DropdownMenuItem(
                                  child: Center(child: Text("$e")),
                                  value: e,
                                ))
                            .toList(),
                        onChanged: (value) {
                          controller.onChangedPayment(value!);
                        }),
                  ),
                  CustomTextForm(
                    isNumber: false,
                    controller: controller.companybio,
                    hintText: '27'.tr,
                    labelText: '7'.tr,
                    iconData: Icons.info,
                    valid: (val) {
                      return validInput(val!, 20, 100, "companybio");
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
