import 'package:ecommerce_application/controller/auth/successsignup_controller.dart';
import 'package:ecommerce_application/core/constant/colors.dart';
import 'package:ecommerce_application/view/widget/auth/custombuttonauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widget/auth/custombodylabel.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({super.key});
  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerImp controller =
        Get.put(SuccessSignUpControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          'Success',
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: ListView(
          children:  [
           const Text('NOTE :',
           style: TextStyle(
            fontSize: 20,
            color: Color.fromARGB(255, 219, 94, 135),
           ),),
             const Text('When you use our application, you will have a percentage of your monthly \nsales profits that may reach 10% .'),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children:const [
                     Padding(
                      padding: EdgeInsets.all(30),
                      child: Icon(
                        Icons.add_chart,
                        size: 200,
                        color: Color.fromARGB(255, 219, 94, 135),
                      ),
                    ),
                     CustomBodyLabel(
                      bodyLabel:
                          'You can manage and monitor a company  with ease',
                    ),
                  ],
                ),
                Column(
                  children:const [
                     Padding(
                      padding: EdgeInsets.all(30),
                      child: Icon(
                        Icons.add_card_outlined,
                        size: 200,
                        color: Color.fromARGB(255, 219, 94, 135),
                      ),
                    ),
                     CustomBodyLabel(
                      bodyLabel:
                          'You can benefit from all electronic payment services',
                    ),
                  ],
                ),
                Column(
                  children:const[
                     Padding(
                      padding: EdgeInsets.all(30),
                      child: Icon(
                        Icons.shopping_cart_outlined,
                        size: 200,
                        color: Color.fromARGB(255, 219, 94, 135),
                      ),
                    ),
                     CustomBodyLabel(
                      bodyLabel:
                          'You can add, delete and modify your products with ease',
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            CustomButtonAuth(
              text: "Next",
              onPressed: () {
                controller.goToPageLogin();
              },
            ),
          ],
        ),
      ),
    );
  }
}
