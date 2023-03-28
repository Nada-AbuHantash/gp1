// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter2/utils/globalColors.dart';
import 'package:flutter2/view/init.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../logintest.dart';
import '../rest_api.dart';



class buttonformat extends StatefulWidget {
  const buttonformat({super.key});

  @override
  State<buttonformat> createState() => _buttonformatState();
}

class _buttonformatState extends State<buttonformat> {
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      
      onTap: (){
         
       navigator?.push(MaterialPageRoute(builder: (context)=>init()));
       
        print('Login nada11 ');
      },
      
      child: Container(
        
              
    alignment: Alignment.center,
    height: 55,
    decoration: BoxDecoration(
      color: globalcolors.textcolor,
      borderRadius: BorderRadius.circular(6),
      boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 10,
    
      )
      ]
    ),
    
    child:Text(
      'sign up',
      
      style: TextStyle(
      color: globalcolors.maincolor,
      fontWeight: FontWeight.w600,
      ),
    ),
  
      ),
      
    );
  }
  
  
    // dologin(String name, String pass)async {
    // var res= await u(name.trim(), pass.trim());
    // print("dologin");
   // print(res.toString());
  // }
 
}