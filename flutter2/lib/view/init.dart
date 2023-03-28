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
            //child: Lottie.network('https://assets6.lottiefiles.com/packages/lf20_z49WoSvxKM.json'),//start
             // child: Lottie.network('https://assets8.lottiefiles.com/packages/lf20_CZva9peGiW.json'), //delvry
              //child: Lottie.network('https://assets6.lottiefiles.com/packages/lf20_yMpiqXia1k.json'),//arbah
             //child: Lottie.network('https://assets9.lottiefiles.com/packages/lf20_lvnzxq3d.json'),//web
             child: Lottie.network('https://assets9.lottiefiles.com/packages/lf20_ardajn6t.json'),//sale
             // child: Lottie.network('https://assets8.lottiefiles.com/packages/lf20_CZva9peGiW.json'),
            width: double.infinity,
            height: double.infinity,
           
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //    image: AssetImage("images/home.jpg"),fit: BoxFit.cover),
            // ),
          
            ),
        ),
        ),
    );
    throw UnimplementedError();
}
}
