//
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter2/utils/globalColors.dart';
// import 'package:flutter2/view/dil.dart';
// import 'package:flutter2/view/profile.dart';
// import 'package:flutter2/view/seller.dart';
// import 'package:flutter2/view/widgets/button.dart';
// import 'package:flutter2/view/widgets/textfiled.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter2/utils/globalColors.dart';
// import 'package:get/get.dart';
// import 'package:flutter2/view/login.dart';
// //import 'package:flutter2/view/logintest.dart';
// import 'package:lottie/lottie.dart';
// import 'package:flutter2/view/homecust.dart';
//
// import '../components/applocal.dart';
// import 'MyHomePage.dart';
// import 'chat/chat.dart';
// import 'chat/searchchat.dart';
// import 'home.dart';
// import 'package:flutter2/view/MyHomePage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_svg/svg.dart';
//
//
//
// class test extends StatefulWidget {
//   const test({Key? key}) : super(key: key);
//   @override
//   State<test> createState() => _testState();
// }
//
// class _testState extends State<test> {
//   int _currentIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return AnnotatedRegion<SystemUiOverlayStyle>(
//       value: const SystemUiOverlayStyle(
//         statusBarColor: Colors.white,
//       ),
//       child: Scaffold(
//         body: _buildPageContent(),
//         bottomNavigationBar: BottomNavigationBar(
//           currentIndex: _currentIndex,
//           selectedItemColor:globalcolors.notetcolor,
//           unselectedItemColor: globalcolors.textcolor,
//           type: BottomNavigationBarType.fixed,
//           onTap: (index) {
//             setState(() {
//               _currentIndex = index;
//             });
//           },
//           items: [
//
//
//               BottomNavigationBarItem(
//                 icon: const Icon(Icons.home),
//                 label: "${getLang(context, "p1")}",
//               ),
//             BottomNavigationBarItem(
//               icon: const Icon(Icons.notifications),
//               label:"${getLang(context, "p2")}",
//             ),
//
//             BottomNavigationBarItem(
//               icon: const Icon(Icons.chat),
//               label: "${getLang(context, "p4")}",
//             ),
//             BottomNavigationBarItem(
//               icon: const Icon(Icons.track_changes),
//               label: "${getLang(context, "p1")}",
//             ),
//
//             BottomNavigationBarItem(
//               icon: const Icon(Icons.settings),
//               label: "${getLang(context, "p5")}",
//             ),
//
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildPageContent() {
//     switch (_currentIndex) {
//       case 0:
//         return const homecust();
//       case 1:
//         return const seller();
//       case 2:
//         return  dil();
//       case 3:
//         return searchchat();
//
//       default:
//         return const homecust();
//     }
//   }
//
//
// }
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatelessWidget {
  final List<LatLng> points = [
    LatLng(32.309718, 35.112541),
    LatLng(32.309051, 35.114299),
    LatLng(32.308295, 35.112941),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(32.309718, 35.112541),
          zoom: 15.0,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayerOptions(
            markers: points
                .map(
                  (LatLng point) => Marker(
                width: 40.0,
                height: 40.0,
                point: point,
                      builder: (ctx) => Container(
                          child: Container(
                            child: Icon(
                              Icons.store,
                              color: Colors.green,
                              size: 40,
                            ),
                          )),
              ),
            )
                .toList(),
          ),
        ],
      ),
    );
  }
}
