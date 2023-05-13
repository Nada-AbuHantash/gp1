import 'package:flutter/material.dart';
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

class CardInfoPage extends StatelessWidget {
  final List<String> cardInfo = [
    'Card 1 Information',
    'Card 2 Information',
    'Card 3 Information',
    // Add more card information here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: cardInfo.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                //  title: Text(cardInfo[index]),
                subtitle: Container(
                    height: 100,
                    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    // decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    //     color: Colors.white,
                    //     boxShadow: [
                    //       BoxShadow(color: globalcolors.notetcolor.withAlpha(100), blurRadius: 10.0),
                    //     ]),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 9),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(cardInfo[index]),

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






                            ],
                          ),
                          // Image.asset(post.image,width: 100,height: 100,),
                          // Image.asset('assets/images/p4.jpg',width: 100,height: 100,),


                        ],
                      ),
                    )),
                // Add more information here, if needed
              ),
            );
          },
        ),
      ),
    );
  }
}