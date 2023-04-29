import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter2/utils/globalColors.dart';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:ui';


import 'package:flutter/material.dart';





class dil extends StatefulWidget {
  @override
  _dilState createState() => _dilState();

  
}

class _dilState extends State<dil> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(


      ),
      body:
      Column(
        children: [
      Container(
        height: 250,
       // width: 90,
       // margin:  EdgeInsets.top,
        child: FlutterMap(
          options:
          MapOptions(center: LatLng(32.309718, 35.112541), zoom: 13.0),
          layers: [
            TileLayerOptions(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png'),

            MarkerLayerOptions(markers: [
              Marker(
                  width: 30.0,
                  height: 30.0,
                  point: LatLng(32.309718, 35.112541),
                  builder: (ctx) => Container(
                      child: Container(
                        child: Icon(
                          Icons.motorcycle,
                          color: Colors.blue,
                          size: 60,
                        ),
                      ))),
              Marker(
                  width: 30.0,
                  height: 30.0,
                  point: LatLng(32.309051, 35.114299),
                  builder: (ctx) => Container(
                      child: Container(
                        child: Icon(
                          Icons.store,
                          color: Colors.red,
                          size: 40,
                        ),
                      ))),
              Marker(
                  width: 30.0,
                  height: 30.0,
                  point: LatLng(32.308295, 35.112941),
                  builder: (ctx) => Container(
                      child: Container(
                        child: Icon(
                          Icons.location_pin,
                          color: Colors.green,
                          size: 40,
                        ),
                      ))),
            ])
          ],
        ),
      ),
        Container(
              height: 190,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: globalcolors.notetcolor.withAlpha(100), blurRadius: 10.0),
                  ]),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                         // post.productName,
                           "custmer name",
                          style:  TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold,color: Colors.green,),
                        ),
                        Text(
                          // post.productName,
                          "product name",
                          style:  TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold,color: globalcolors.textcolor,),
                        ),
                        Text(
                       //   post.marketName,
                          "supermarket name",
                          style:  TextStyle(fontSize: 17,color: Colors.red,fontWeight: FontWeight.bold,),
                        ),

                        Text(
                        //  "count: ${post.amount}",
                           "count: 3",
                          style:  TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold,color: globalcolors.textcolor,),
                        ),Text(
                          //"price: ${post.price} ₪",
                           "price:15 ₪",
                          style:  TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold,color: globalcolors.textcolor,),
                        ),

                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(width: 16.0),
                              IconButton(
                                onPressed: () {

                                },
                                icon: Icon(Icons.chat,color: globalcolors.textcolor), // The icon to display on the button.
                              ),
                              IconButton(
                                onPressed: () {

                                },
                                icon: Icon(Icons.call,color: globalcolors.textcolor), // The icon to display on the button.
                              ),
                            ])


                      ],
                    ),
                   // Image.asset(post.image,width: 100,height: 100,),
                     // Image.asset('assets/images/p4.jpg',width: 100,height: 100,),


                  ],
                ),
              )),
      ],
    ),


    );
  }
}