import 'package:flutter/material.dart';
import 'package:flutter2/utils/globalColors.dart';
import 'package:flutter2/view/addproduct.dart';
import 'package:flutter2/view/dil.dart';
import 'package:flutter2/view/homesel.dart';
import 'package:flutter2/view/map.dart';
import 'package:flutter2/view/mapGPT.dart';
import 'package:flutter2/view/nav2.dart';

import 'package:flutter2/view/seller.dart';
import 'package:flutter2/view/homecust.dart';
import '../components/applocal.dart';
import 'MyHomePage.dart';
import 'chat.dart';
import 'package:flutter/services.dart';



class selhom extends StatefulWidget {
  const selhom({Key? key}) : super(key: key);
  @override
  State<selhom> createState() => _selhomState();
}

class _selhomState extends State<selhom> {
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
              icon: const Icon(Icons.add_business),
              label: "${getLang(context, "p6")}",
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.location_pin),
              label: "${getLang(context, "p7")}",
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
        return const homesel();
      case 1:
        return  map1();
      case 2:
        return  addproduct();
      case 3:
        return  map();
      case 4:
        return  nav2();
      default:
        return const homecust();
    }
  }


}