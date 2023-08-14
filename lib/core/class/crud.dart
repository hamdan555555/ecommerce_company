import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_application/core/constant/routesname.dart';
import 'package:ecommerce_application/core/function/checkinternet.dart';
import 'package:get/get.dart';

import 'statusrequest.dart';
import 'package:http/http.dart ' as http;




class Crud {
  Future<Either<StatusRequest, Map>> postData(
      String linkUrl, Map<String, String> data) async {
    print(data);
    print(linkUrl);
    print('X--------1');
    try {
      if (await checkInternet()) {
        var headers = {'Accept': 'application/json'};
        var response =
            await http.post(Uri.parse(linkUrl), headers: headers, body: data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          print("hamdaaaan 1");
          return Right(responseBody);
        } else {
          print("hamdan status code not 200 201");
          throw Exception('Failed hamdan');
        }
      } else {
        print("hamdan no internet");
        return const Left(StatusRequest.offLineFailure);
      }
    } catch (e) {
      print(e);
      print("hamdan an error caught");
      return const Left(StatusRequest.serverException);
    }
  }
}
