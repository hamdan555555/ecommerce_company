import 'package:ecommerce_application/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomButtonAuth extends StatelessWidget {
  const CustomButtonAuth(
      {super.key, required this.text, required this.onPressed});
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 60, right: 60),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 14),
        textColor: Colors.white,
        color: AppColor.colour6,
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
