import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class   applocal {

   Locale locale ;

  applocal(this.locale) ;

late Map<String , String> _loadedLocalizedValues ;

  static applocal of (BuildContext context) {
       return Localizations.of(context, applocal) ;
  }

  Future loadLang() async {
    String  _langFile = await rootBundle.loadString('assets/translations/${locale.languageCode}.json') ;
    Map<String ,dynamic> _loadedValues = jsonDecode(_langFile);
    _loadedLocalizedValues = _loadedValues.map((key, value) => MapEntry(key, value.toString())) ;
  }

  String? getTranslated (String key) {
    return _loadedLocalizedValues[key] ;
  }

  static const LocalizationsDelegate<applocal> delegate  = _AppLocalDelegate() ;

}


class  _AppLocalDelegate extends LocalizationsDelegate<applocal> {
  const _AppLocalDelegate() ;
  @override
  bool isSupported(Locale locale) {
    return ["en" , "ar"].contains(locale.languageCode) ;
  }

  @override
  Future<applocal> load(Locale locale) async {
     applocal appLocale = applocal(locale) ;
       await appLocale.loadLang();
       return appLocale ; 
  }

  @override
  bool shouldReload(_AppLocalDelegate  old) => false  ;

}


getLang(BuildContext context  , String key) {
   return applocal.of(context).getTranslated(key) ; 
}