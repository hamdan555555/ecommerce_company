import 'dart:io';
import 'package:http/http.dart ' as http;


// checkInternet() async {
//   try {
//     var result = await InternetAddress.lookup("google.com");
//     if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
//       return true;
//     }
//   } on SocketException catch (_) {
//     return false;
//   }
// }




 Future<bool> checkInternet() async {
  try {
    final result = await http.get(Uri.parse('www.google.com'));
    if(result.statusCode==200){
      return true;
    }
  else{
      return false;
  }
  }
   on SocketException catch (_) {
    return false;
  }
}







