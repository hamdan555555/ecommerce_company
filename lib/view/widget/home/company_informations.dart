import 'package:ecommerce_application/core/constant/imageconstant.dart';
import 'package:flutter/material.dart';

class CompanyInformation extends StatelessWidget {
  final String companyName;
  final String description;
  final String imageCompany;

  const CompanyInformation(
      {super.key,
      required this.companyName,
      required this.description,
      required this.imageCompany});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
           // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                companyName,
                style: const TextStyle(
                  fontSize: 50,
                ),
              ),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 15,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        const CircleAvatar(
          radius: 90,
          backgroundImage: AssetImage(AppImageAsset.background),
        ),
      ],
    );
  }
}
