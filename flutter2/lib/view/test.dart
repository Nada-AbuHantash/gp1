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
              height: 130,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),

              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
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




                      ],
                    ),
                    // Image.asset(post.image,width: 100,height: 100,),
                    // Image.asset('assets/images/p4.jpg',width: 100,height: 100,),


                  ],
                ),

              )),
          Divider(
            color: Colors.black, // Specify the color of the line
            thickness: 3.0, // Specify the thickness of the line
          ),
        ],
      ),


    );
  }
}