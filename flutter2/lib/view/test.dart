import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter2/utils/globalColors.dart';
import 'dart:ui';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:ui';
import 'package:flutter/material.dart';





class test extends StatefulWidget {
  @override
  _testState createState() => _testState();


}

class _testState extends State<test> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: globalcolors.textcolor,
        title: Row(
          children: [
            Icon(Icons.notifications), // Replace 'icon_name' with the desired icon
            SizedBox(width: 8.0), // Add some space between the icon and text
            Text('Notifications'),
          ],
        ),
      ),
      body:
      Column(
        children: [

          Container(
              height: 500,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),

              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: WebView(
                          initialUrl: 'https://goo.gl/maps/wwzraUoFRFmLHLXr9',
                          javascriptMode: JavascriptMode.unrestricted,
                        ),
                      ),
                    ]),

              )),

        ],
      ),


    );
  }
}