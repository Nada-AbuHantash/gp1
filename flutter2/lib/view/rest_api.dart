import 'dart:convert';

import 'package:http/http.dart' as http;

import '../utils/Sharedsession.dart';

class utils {
  static const String basurl = "http://192.168.225.52:3000/";
  //var url = Uri.parse('https://example.com');
}

Future userlogin(String email, String pass) async {
  try {
    final http.Response use = await http.post(
        Uri.parse(utils.basurl + 'infouser'),
        headers: {"Accept": "Application/json"},
        body: {'useremail': email, 'userpass': pass});
        if(use.body.contains("@")){
print("yes ");
Sharedsession shared=new Sharedsession();
await shared.savename(email, pass);
///////////saved////////////
        }else print("failed");
       return use;
  } catch (e) {
    print('no');
  }
}




Future usersignup(String name,  String email,String pass,String phone, String place ) async {
  try {
    
  var s=200;
  final http.Response use = await http.post(
      Uri.parse(utils.basurl + 'register'),
      headers: {"Accept": "Application/json"},
      body: {'username': name, 'useremail': email,'userpass': pass,  'userphone': phone,'userplace':place});
  var encodeFirst = json.encode(use.body);
  var data = json.decode(encodeFirst) ;
  if(use.statusCode==400){
   // return null;
     print("Failed to update");
  }else {
    //return model.fromJson(data["data"]);
    return data;
  }
  
   }catch (e) {
     print("no register");
  }
}
Future deliverysignup(String name,  String email,String pass,String phone, String place ) async {
  try {
    
  var s=200;
  final http.Response use = await http.post(
      Uri.parse(utils.basurl + 'registerdelivery'),
      headers: {"Accept": "Application/json"},
      body: {'deliveryname': name, 'deliveryemail': email,'deliverypass': pass,  'deliveryphone': phone,'deliveryplace':place});
  var encodeFirst = json.encode(use.body);
  var data = json.decode(encodeFirst) ;
  if(use.statusCode==400){
   // return null;
     print("Failed to update");
  }else {
    //return model.fromJson(data["data"]);
    return data;
  }
  
   }catch (e) {
     print("no register");
  }

}
Future sellersignup(String name,  String email,String pass,String phone, String place ) async {
  try {
    
  var s=200;
  final http.Response use = await http.post(
      Uri.parse(utils.basurl + 'registerseller'),
      headers: {"Accept": "Application/json"},
      body: {'sellername': name, 'selleremail': email,'sellerpass': pass,  'sellerphone': phone,'sellerplace':place});
  var encodeFirst = json.encode(use.body);
  var data = json.decode(encodeFirst) ;
  if(use.statusCode==400){
   // return null;
     print("Failed to update");
  }else {
    //return model.fromJson(data["data"]);
    return data;
  }
  
   }catch (e) {
     print("no register");
  }
}