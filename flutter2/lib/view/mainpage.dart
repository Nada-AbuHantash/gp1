
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter2/utils/globalColors.dart';
import 'package:flutter2/view/cart/cart2.dart';
import 'package:flutter2/view/dil.dart';
import 'package:flutter2/view/cart/mycart.dart';
import 'package:flutter2/view/map/mapGPT.dart';
import 'package:flutter2/view/profile.dart';
import 'package:flutter2/view/seller.dart';
import 'package:flutter2/view/test.dart';
import 'package:flutter2/view/widgets/button.dart';
import 'package:flutter2/view/widgets/textfiled.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter2/utils/globalColors.dart';
import 'package:get/get.dart';
import 'package:flutter2/view/notfications.dart';
//import 'package:flutter2/view/logintest.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter2/view/homecust.dart';

import '../components/applocal.dart';
import 'MyHomePage.dart';
import 'chat/chat.dart';
import 'chat/searchchat.dart';
import 'dilevery/orders.dart';
import 'home.dart';
import 'package:flutter2/view/MyHomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';


// class mainpage extends StatelessWidget {
//   const mainpage({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(

//       home: const MyHomePage1(),
//     );
//   }
// }

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
              label:"${getLang(context, "p1")}",
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.notifications),
              label:"${getLang(context, "p2")}",
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.shopping_cart),
              label: "${getLang(context, "p3")}",
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.chat),
              label: "${getLang(context, "p4")}",
            ),

            BottomNavigationBarItem(
              icon: const Icon(Icons.settings),
              label: "${getLang(context, "p5")}",
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
          // return  orders();
         return CardInfoPage();
      case 2:
        return  mycart();
      case 3:
      return searchchat();
       // return const ChatScreen();
      case 4:
        return  NavDrawer();
      default:
        return const homecust();
    }
  }


}