import 'package:ecommerce_application/core/constant/colors.dart';
import 'package:ecommerce_application/core/constant/imageconstant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductWidget extends StatelessWidget {
  final String productName;
  final String price;
  final String discount;
  final String imageProduct;
  const ProductWidget(
      {super.key,
      required this.productName,
      required this.price,
      required this.imageProduct,
      required this.discount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      discount,
                      style:
                          const TextStyle(fontSize: 15.0, color: Colors.amber),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
