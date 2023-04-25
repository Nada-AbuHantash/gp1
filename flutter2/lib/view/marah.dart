import 'package:flutter/material.dart';
//import 'package:flycar/pages/appbar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter2/utils/globalColors.dart';

import 'package:flutter2/view/mapGPT.dart';
class Taxi extends StatefulWidget {
  @override
  State<Taxi> createState() => _TaxiState();
}
Color _primaryColor = HexColor('#bed9f3');

Color _accentColor = HexColor('#233d56');
class _TaxiState extends State<Taxi> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: _primaryColor,
        accentColor: _accentColor,
        scaffoldBackgroundColor: Colors.grey.shade100,
        primarySwatch: Colors.grey,
      ),
      home: TaxiPage(),
    );
  }
}

class TaxiPage extends StatefulWidget {
  @override
  _TaxiPageState createState() => _TaxiPageState();
}

class _TaxiPageState extends State<TaxiPage> {
  double _drawerIconSize = 24;

  double _drawerFontSize = 17;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: globalcolors.besiccolor,
      appBar: AppBar(
        title: Text(
          "Order Taxi",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontFamily: 'halter',
            fontSize: 18,
            package: 'flutter_credit_card',),
        ),
        elevation: 0.5,
        iconTheme: IconThemeData(color: _accentColor),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Theme.of(context).primaryColor,
                    Theme.of(context).accentColor,
                  ])),
        ),
      ),
     // drawer: Bar(),

      body: addBasket(),

    );
  }

}
