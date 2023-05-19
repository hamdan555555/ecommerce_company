import 'package:ecommerce_application/core/constant/imageconstant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
         Container(
            child: Transform.translate(offset:Offset(500, 80),
            child: CircleAvatar(
              backgroundImage: AssetImage(AppImageAsset.background),
            ),
            ),
            height: 150,
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppImageAsset.blueback),
                    fit: BoxFit.cover),
                    ),
          ),
    
        ],
      ),
    );
  }
}
