import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter2/utils/globalColors.dart';
import 'package:get/get.dart';
import 'package:flutter2/view/login.dart';
//import 'package:flutter2/view/logintest.dart';
import 'package:lottie/lottie.dart';

import 'home.dart';


 class init extends StatefulWidget{
const init({Key?key}):super(key: key);

  @override
  State<init> createState() => _initState();
}

class _initState extends State<init> {
@override
Widget build(BuildContext context){
   Timer(const Duration(seconds:6),() {Get.to(home());
   });
 return MaterialApp(
      home: Scaffold(
        
        body: Center(
          child: Container(
            color: globalcolors.besiccolor,
             child: Lottie.network('https://assets9.lottiefiles.com/packages/lf20_ardajn6t.json'),//sale
            width: double.infinity,
            height: double.infinity,

            ),
        ),
        ),
    );
    throw UnimplementedError();
}
}
