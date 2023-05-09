import 'package:flutter/material.dart';
import 'package:flutter2/utils/Sharedsession.dart';
import 'package:flutter2/view/addproduct.dart';
import 'package:flutter2/view/cart/cart.dart';
import 'package:flutter2/view/cart/cart2.dart';
import 'package:flutter2/view/dilevery/homedil.dart';
import 'package:flutter2/view/home.dart';
import 'package:flutter2/view/homecust.dart';
import 'package:flutter2/view/homesel.dart';
import 'package:flutter2/view/init.dart';
import 'package:flutter2/view/login.dart';
import 'package:flutter2/view/mainpage.dart';
import 'package:flutter2/view/map/map.dart';
import 'package:flutter2/view/map/mapGPT.dart';
import 'package:flutter2/view/map/mymap.dart';
import 'package:flutter2/view/selhom.dart';
import 'package:flutter2/view/about/about.dart';
import 'package:flutter2/view/signup.dart';
import 'package:flutter2/view/dil.dart';
import 'package:flutter2/view/seller.dart';
import 'package:flutter2/view/slider.dart';
import 'package:flutter2/view/about/about.dart';
import 'package:flutter2/view/test.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'components/applocal.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
SharedPreferences ?mySharedPreferences;
Sharedsession language = new Sharedsession();

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', //id
    'High Importance Notifications', //title
    importance: Importance.high,
    playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('A bg message just showed up : ${message.messageId}');
}

void main() async{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
      mySharedPreferences = await SharedPreferences.getInstance();
     await mySharedPreferences!.setString("translations","en");
    language.savelang("en");
    WidgetsFlutterBinding.ensureInitialized();


    await Firebase.initializeApp(
    name: 'Sales',
    options: FirebaseOptions(
      apiKey: "XXX",
      appId: "XXX",
      messagingSenderId: "XXX",
      projectId: "XXX",
    ),
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

   await  FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
    
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ChangeLang(),
        )
      ],
      child: GetMaterialApp(
      debugShowCheckedModeBanner: false,
       // home:addBasket(),//chatGPT
         home:login(),
       
       localizationsDelegates: [
          applocal.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
        ],
         
         supportedLocales: [
          const Locale("en", ""),
          const Locale("ar", ""),
        ],
       localeResolutionCallback: (currentLang, supportLang) {
          if (currentLang != null) {
            for (Locale locale in supportLang) {
              if (locale.languageCode == currentLang.languageCode) {
               mySharedPreferences!.setString("translations",currentLang.languageCode); 
                //  language.savelang(currentLang.languageCode);
                return currentLang;
              }
            }
          }
          return supportLang.first;
        },
    ),
    );
  }
}


class ChangeLang with ChangeNotifier {}



