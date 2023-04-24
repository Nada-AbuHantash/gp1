import 'package:flutter/material.dart';
import 'package:flutter2/utils/Sharedsession.dart';
import 'package:flutter2/view/addproduct.dart';
import 'package:flutter2/view/home.dart';
import 'package:flutter2/view/homecust.dart';
import 'package:flutter2/view/homesel.dart';
import 'package:flutter2/view/init.dart';
import 'package:flutter2/view/login.dart';
import 'package:flutter2/view/mainpage.dart';
import 'package:flutter2/view/map.dart';
import 'package:flutter2/view/mapGPT.dart';
import 'package:flutter2/view/selhom.dart';
import 'package:flutter2/view/about/about.dart';
import 'package:flutter2/view/signup.dart';
import 'package:flutter2/view/dil.dart';
import 'package:flutter2/view/seller.dart';
import 'package:flutter2/view/slider.dart';
import 'package:flutter2/view/about/about.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'components/applocal.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
SharedPreferences ?mySharedPreferences;
Sharedsession language = new Sharedsession();
void main() async{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
      mySharedPreferences = await SharedPreferences.getInstance();
     await mySharedPreferences!.setString("translations","en");
    language.savelang("en");
    
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
      home:selhom(),
       
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



