import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter2/utils/globalColors.dart';
import 'package:get/get.dart';
import 'package:flutter2/view/login.dart';
//import 'package:flutter2/view/logintest.dart';
import 'package:lottie/lottie.dart';



class cust extends StatefulWidget {
  @override
  _custState createState() => _custState();
}

class _custState extends State<cust> {
  bool isAnimationVisible = false;
  @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [



                  ElevatedButton(
                      child: Text('Take the order'),
                    onPressed: () {
                      setState(() {
                        isAnimationVisible = true;
                      });}

                  ),
                  SizedBox(width: 80),
                  ElevatedButton(
                    onPressed: () {
                      // Button 2 functionality
                    },
                    child: Text('Order processing'),
                  ),


              SizedBox(height: 40),
              Visibility(
                visible: isAnimationVisible,
                child: Lottie.network(
                  'https://assets9.lottiefiles.com/packages/lf20_ardajn6t.json',
                  height: 200,
                  width: 200,
                  fit: BoxFit.contain,
                ),
              ),



                  ElevatedButton(
                    onPressed: () {
                      // Button 3 functionality
                    },
                    child: Text(
                        ' Your order is on the way'),
                  ),
                  SizedBox(width: 80),
                  ElevatedButton(
                    onPressed: () {
                      // Button 4 functionality
                    },
                    child: Text('Order received successfully'),
                  ),
                ],


          ),
        ),
      );
    }
  }


