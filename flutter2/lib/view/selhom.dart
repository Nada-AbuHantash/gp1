import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter2/utils/globalColors.dart';
import 'package:flutter2/view/addproduct.dart';
import 'package:flutter2/view/map/marah.dart';
import 'package:flutter2/view/homesel.dart';
import 'package:flutter2/view/map/map.dart';
//import 'package:flutter2/view/map/mapGPT.dart';
import 'package:flutter2/view/nav2.dart';

import 'package:flutter2/view/seller.dart';
import 'package:flutter2/view/homecust.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../components/applocal.dart';
import '../main.dart';
import 'MyHomePage.dart';
import 'chat/chat.dart';
import 'package:flutter/services.dart';



class selhom extends StatefulWidget {
  const selhom({Key? key}) : super(key: key);
  @override
  State<selhom> createState() => _selhomState();
}

class _selhomState extends State<selhom> {
  int _currentIndex = 0;
//  @override
//  void initState() {
//     super.initState();

//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       RemoteNotification? notification = message.notification;
//       AndroidNotification? android = message.notification?.android;
//       if (notification != null && android != null) {
//         flutterLocalNotificationsPlugin.show(
//             notification.hashCode,
//             notification.title,
//             notification.body,
           
//             NotificationDetails(
//               android: AndroidNotificationDetails(
//                 channel.id,
//                 channel.name,
//                 color: Colors.pink,
//                 playSound: true,
//                 icon: '@mipmap/ic_launcher',
                
                
//               ),
//             ));
//       }
//     });
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       print('A new onMessageOpenedApp event was published!');
//       RemoteNotification? notification = message.notification;
//       AndroidNotification? android = message.notification?.android;
//   //Navigator.push(context,  MaterialPageRoute(builder: (_) => addproduct()));
//       if (notification != null && android != null) {
//         showDialog(
//             context: context,
//             builder: (_) {
//               return AlertDialog(
//                 title: Text("${notification.title}"),
//                 content: SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [Text("${notification.body}")],
//                   ),
//                 ),
//               );
//             });
//       }
//     });
//         flutterLocalNotificationsPlugin.show(
//         0,
//         "Check the product",
//         "Some prodcuts do not have enough quantity",
//         NotificationDetails(
//             android: AndroidNotificationDetails(channel.id, channel.name,
//                 importance: Importance.high,
//                 color: Colors.blue,
//                 playSound: true,
//                 icon: '@mipmap/ic_launcher')));
//   }
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
        return  homecust();
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