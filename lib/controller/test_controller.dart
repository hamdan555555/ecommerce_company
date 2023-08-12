import 'dart:convert';
import 'package:http/http.dart' as http;

 addfun()async{
var headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer 40|X9hVH72c8ZJ8ldAGT4XPFL5vRlAoQ9CLjDwGJtaS'
};
var request = http.MultipartRequest('POST', Uri.parse('http://localhost:8000/api/product/create'));
request.fields.addAll({
  'catigoryProduct_id': '3',
  'name': 'fsdf44444',
  'slug': 'there are many colors',
  'price': '100',
  'quantity': '4',
  'description': 'hello good '
});
request.files.add(await http.MultipartFile.fromPath('image', '/C:/Users/Mahmoud/Desktop/Screenshot 2023-05-08 160437.png'));
request.headers.addAll(headers);

http.StreamedResponse response = await request.send();

if (response.statusCode == 200) {
  print(await response.stream.bytesToString());
}
else {
  print(response.reasonPhrase);
}
 }