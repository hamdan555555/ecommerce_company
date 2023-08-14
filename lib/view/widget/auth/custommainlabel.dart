import 'package:ecommerce_application/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomMainLabel extends StatelessWidget {
  const CustomMainLabel({super.key, required this.mainLabel});
  final String mainLabel;

  @override
  Widget build(BuildContext context) {
    return Text(
      mainLabel,
      textAlign: TextAlign.center,
      style: Theme.of(context)
          .textTheme
          .headlineLarge!
          .copyWith(fontSize: 30, color: AppColor.colour2),
    );
  }
}
