
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:async/async.dart';
import 'dart:convert';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
class Sharedsession{

   savename(String A,String B) async{
final prefs = await SharedPreferences.getInstance();
 prefs.setString("emailemail", A);
 prefs.setString("passpass", B);
 

}

  savenamesuper(String A) async{
final prefs = await SharedPreferences.getInstance();
 prefs.setString("supermarket", A);

}
  saveordername(String A) async{
final prefs = await SharedPreferences.getInstance();
 prefs.setString("order", A);

}


   savepro(String A,String B,int C,int D,String E,String F) async{
final prefs = await SharedPreferences.getInstance();
 prefs.setString("namepro", A);
 prefs.setString("superpro", B);
  prefs.setInt("old", C);
  prefs.setInt("new", D);
 prefs.setString("img", E);
  prefs.setString("exp", F);

}

 getsupermarket()async{
     final supermarket = await SharedPreferences.getInstance();

     await supermarket.getString("supermarket");

}
savelang(String e)async{
   final lang = await SharedPreferences.getInstance();
     await lang.setString("translations",e);
}
 getlan()async{
     final lang = await SharedPreferences.getInstance();

     await lang.getString("translations");

}

}
