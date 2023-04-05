import 'package:flutter/material.dart';
import 'package:flutter2/utils/Sharedsession.dart';
import 'package:flutter2/view/addproduct.dart';
import 'package:flutter2/view/editprofile.dart';
import 'package:flutter2/view/profile.dart';
import 'package:flutter2/view/home.dart';
import 'package:flutter2/view/homecust.dart';
import 'package:flutter2/view/init.dart';
import 'package:flutter2/view/login.dart';
import 'package:flutter2/view/logintest.dart';
import 'package:flutter2/view/mainpage.dart';
import 'package:flutter2/view/settings.dart';
import 'package:flutter2/view/signup.dart';
import 'package:flutter2/view/dil.dart';
import 'package:flutter2/view/seller.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'components/applocal.dart';
// SharedPreferences ?mySharedPreferences;
Sharedsession language = new Sharedsession();
void main() async{
    WidgetsFlutterBinding.ensureInitialized();
    //   mySharedPreferences = await SharedPreferences.getInstance();
    //  await mySharedPreferences!.setString("translations","en");
    language.savelang("en");
    
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
// get mySharedPreferences => 'en';

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
      home:home(),
       
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
              //  mySharedPreferences!.setString("translations",currentLang.languageCode); 
                 language.savelang(currentLang.languageCode);
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



