
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter2/utils/globalColors.dart';
import 'package:flutter2/view/widgets/button.dart';
import 'package:flutter2/view/widgets/textfiled.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter2/utils/globalColors.dart';
import 'package:get/get.dart';
import 'package:flutter2/view/login.dart';
//import 'package:flutter2/view/logintest.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter2/view/homecust.dart';

import 'MyHomePage.dart';
import 'home.dart';
import 'package:flutter2/view/MyHomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';


class mainpage extends StatelessWidget {
  const mainpage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'Grocery Freebie',
      // theme: ThemeData(
      //     primarySwatch: Colors.blue,
      //     primaryColor: kPrimaryColor,
      //     scaffoldBackgroundColor: const Color(0xffffffff)),
      home: const MyHomePage1(),
    );
  }
}

class MyHomePage1 extends StatefulWidget {
  const MyHomePage1({Key? key}) : super(key: key);
  @override
  State<MyHomePage1> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage1> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
      ),
      child: Scaffold(
        body: _buildPageContent(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedItemColor:globalcolors.notetcolor,
          unselectedItemColor: globalcolors.textcolor,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(

              icon: const Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.notifications),
              label: 'notfication',
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.shopping_cart_outlined),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.chat_outlined),
              label: 'Chat',
            ),

            BottomNavigationBarItem(
              icon: const Icon(Icons.settings),
              label: 'Settings',
            ),

          ],
        ),
      ),
    );
  }

  Widget _buildPageContent() {
    switch (_currentIndex) {
      case 0:
        return const homecust();
      case 1:
        return const homecust();
      case 2:
        return  homecust();
      case 3:
        return const homecust();
      case 4:

        return  NavDrawer();
      default:
        return const homecust();
    }
  }


}