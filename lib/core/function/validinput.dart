import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (type == "companyname") {
    if (!GetUtils.isUsername(val)) {
      return "Enter Correct Company Name ";
    }
  }

  if (type == "productname") {
    if (!GetUtils.isUsername(val)) {
      return "Enter Correct Product Name ";
    }
  }
  if (type == "slug") {
    if (!GetUtils.isUsername(val)) {
      return "Enter Correct slug ";
    }
  }
  
  if (type == "companyemail") {
    if (!GetUtils.isEmail(val)) {
      return "Enter Correct Email";
    }
  }
  if (type == "companyphone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "Enter Correct Phone Number";
    }
  }
  if (type == "price") {
    if (!GetUtils.isNum(val)) {
      return "Enter Correct price ";
    }
  }
  if (type == "quantity") {
    if (!GetUtils.isNum(val)) {
      return "Enter Correct quantity ";
    }
  }
  if (val.isEmpty) {
    return "value Can't be Empty";
  }

  if (val.length < min) {
    return "value Can't be lass than $min";
  }
  if (val.length > max) {
    return "value Can't be larger than $max";
  }
  if (val.isEmpty) {
    return "value Can't be Empty";
  }
}
