import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_application/core/constant/routesname.dart';
import 'package:ecommerce_application/core/function/checkinternet.dart';
import 'package:get/get.dart';

import 'statusrequest.dart';
import 'package:http/http.dart ' as http;

//var token = '40|X9hVH72c8ZJ8ldAGT4XPFL5vRlAoQ9CLjDwGJtaS';

class Crud {
  Future<Either<StatusRequest, Map>> postData(
      String linkUrl, Map<String, String> data) async {
    print(data);
    print(linkUrl);
    print('X--------1');
    try {
      print('X--------2');

      print('X--------3');
      var response = await http.post(Uri.parse(linkUrl),
          // headers: <String, String>{
          //   'Authorization': 'Bearer $token',
          // },
          body: data);

      print('X--------4');
      print(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.body);
        print(response);
        print('X--------5');
        Map responseBody = jsonDecode(response.body);
        print('X--------6');
        print(responseBody);
        print('X--------7');
        return Right(responseBody);
      } else {
        Get.defaultDialog(
          title: 'serverFailure',
          middleText: 'incorrect Password or Email',
        );
        Get.to(AppRoute.login);
        return const Left(StatusRequest.serverFailure);
      }

      ;
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: 'serverException',
        middleText: 'serverException ',
      );
      return const Left(StatusRequest.serverException);
    }
  }
}
