import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter2/components/applocal.dart';
import 'package:flutter2/utils/globalColors.dart';
import 'package:flutter2/view/cart/cart2.dart';
import 'package:flutter2/view/chat/searchchat.dart';
import 'package:flutter2/view/dil.dart';
import 'package:flutter2/view/cart/mycart.dart';
import 'package:flutter2/view/dilevery/dilmap.dart';
import 'package:flutter2/view/dilevery/orders.dart';
import 'package:flutter2/view/dilevery/sit.dart';
import 'package:flutter2/view/map/mapGPT.dart';

import 'package:flutter2/view/notfications.dart';
//import 'package:flutter2/view/logintest.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter2/view/homecust.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter2/view/MyHomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class dil2 extends StatefulWidget {
  const dil2({Key? key}) : super(key: key);
  @override
  State<dil2> createState() => _dil2State();
}

class _dil2State extends State<dil2> {
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
          selectedItemColor: globalcolors.notetcolor,
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
              label: "${getLang(context, "p1")}",
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.location_pin),
              label: "${getLang(context, "p7")}",
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
        return orders();

      case 1:
        return dilmap();
      case 2:
        return searchchat();
      // return const ChatScreen();
      case 3:
        return sit();
      default:
        return orders();
    }
  }
}
