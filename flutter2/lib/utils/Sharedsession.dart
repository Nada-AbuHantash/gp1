
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
savelang(String e)async{
   final lang = await SharedPreferences.getInstance();
     await lang.setString("translations",e);
}
 getlan()async{
     final lang = await SharedPreferences.getInstance();

     await lang.getString("translations");

}
}
