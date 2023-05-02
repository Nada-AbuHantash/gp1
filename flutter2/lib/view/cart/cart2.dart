import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter2/models/product1.dart';
import 'package:flutter2/utils/globalColors.dart';
import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter2/view/MyHomePage.dart';
import 'package:flutter2/view/mainpage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import '../about/abo2.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';
import 'dart:typed_data';
import 'dart:convert';
import 'package:flutter2/view/rest_api.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../components/applocal.dart';


import 'dart:ui';

import 'package:timezone/timezone.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';


import 'package:async/async.dart';
import 'dart:convert';
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';




TextEditingController productNameController = TextEditingController();
TextEditingController productImageURLController = TextEditingController();
TextEditingController productPriceController = TextEditingController();
TextEditingController productMarketController = TextEditingController();
TextEditingController productManufactureingController = TextEditingController();



late  List<Product1> myList=[];

void _runFilter(String enteredKeyword) {
  List<Product1> results = [];

    results = myList;

  myList = results;
}



class cart2 extends StatefulWidget {
  const cart2({Key? key}) : super(key: key);
  @override
  _cart2State createState() => _cart2State();
}

class _cart2State extends State<cart2> {


  @override

  TextEditingController _textEditingController = TextEditingController();


  String text = "";
int _countdown=60;
late Timer _timer;
  @override

  void initState() {
    super.initState();
super.initState();
   _timer= Timer.periodic(Duration(seconds: 1), (Timer t) => _updateCountdown());

    _textEditingController.text = text;
    myList=[];
    getPostsData();
  }

 void _updateCountdown() {
    setState(() {
      _countdown--;
    });if (_countdown == 0) {
      _timer.cancel();
    }
  }
   @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
  ScrollController controller = ScrollController();

  bool closeTopContainer = false;
  double topContainer = 0;
  List<Widget> itemsData = [];
  void getlistitem() async {
    myList=await fetch.cart();
  }
 
  void getPostsData() async{
    List<Widget> listItems = [];
    List<Product1> A = [];
    if(myList.isEmpty)
      myList=await fetch.cart();
    // future: wish(myList);
    myList.forEach((post) {
      listItems.add(
          Container(
          height: 190,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              color: globalcolors.besiccolor,
              boxShadow: [
                BoxShadow(color: globalcolors.notetcolor.withAlpha(100), blurRadius: 10.0),
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      post.productName,
                     // "product name",
                      style:  TextStyle(
                          fontSize: 23, fontWeight: FontWeight.bold,color: globalcolors.textcolor,),
                    ),
                    Text(
                      post.marketName,
                      //"supermarket name",
                      style:  TextStyle(fontSize: 17,color: globalcolors.textcolor,),
                    ),

                    Text(
                      "count: ${post.amount}",
                     
                     // "count: 3",
                      style:  TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold,color: globalcolors.textcolor,),
                    ),Text(
                      "price: ${post.price} ₪",
                     // "price:15 ₪",
                      style:  TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold,color: globalcolors.textcolor,),
                    ),

                   Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[  ElevatedButton(
                          child: Text('buy'),
                          style: ElevatedButton.styleFrom(
                            primary: globalcolors.notetcolor,
                            onPrimary: Colors.white,
                            onSurface: Colors.grey,
                          ),
                          onPressed: () async{
                            buy(post.id);
                           print("marah1");
                          },
                        ),
                          SizedBox(width: 16.0),
                          ElevatedButton(
                            child: Text('boke'),
                            style: ElevatedButton.styleFrom(
                              primary: globalcolors.notetcolor,
                              onPrimary: Colors.white,
                              onSurface: Colors.grey,
                            ),
                            onPressed: () async{
                              book(post.id);
                              print("marah2");
                               DateTime now = DateTime.now();
                             var time='${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}';
                           print(time);
                            },
                          ),
                          IconButton(
                            onPressed: () {
                               showDialog(
                                
              context: context,
              builder: (BuildContext context) =>
                  AlertDialog(
title:Text("are you sure delete this itme ?"),
            titleTextStyle: TextStyle(color: globalcolors.textcolor,fontSize: 20),
            backgroundColor: globalcolors.besiccolor,
                    actions: [
                      const SizedBox(height: 20),
                     
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            
                            SizedBox(
                              child: ElevatedButton(

                                style: ElevatedButton.styleFrom(

                                  shape: RoundedRectangleBorder(

                                      borderRadius: BorderRadius.circular(20.0)),
                                  foregroundColor: globalcolors.maincolor,
                                  backgroundColor: globalcolors.notetcolor,
                                  minimumSize: Size(250, 50),
                                ),
                                child: Text("delete",

                                  style: TextStyle(color: globalcolors.maincolor,fontSize: 25),
                                ),
                                onPressed: ()  {
                                     delete(post.id);
                               getlistitem();
                               getPostsData();
                                    Fluttertoast.showToast(msg: "delete item done refrch to sure",
                                   textColor: globalcolors.besiccolor);

                                   },
                              ),
                            ),


                          ],

                        ),
                      ),
                     
                      const SizedBox(height: 20),

                    ],

                  )

          );
                           
                            },
                            icon: Icon(Icons.delete_forever,color: globalcolors.textcolor), // The icon to display on the button.
                          ),
                        ])


                  ],
                ),
                Image.asset(post.image,width: 100,height: 100,),
              //  Image.asset('assets/images/p4.jpg',width: 100,height: 100,),


              ],
            ),
          )));
    });
    setState(() {
      itemsData = listItems;
    });
  }


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height * 0.30;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,

        body: Container(
          height: size.height,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Expanded(
                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: kDefaultPadding),

                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Expanded(
                  child: ListView.builder(
                      controller: controller,
                      itemCount: itemsData.length,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Align(
                            heightFactor: 1,
                            alignment: Alignment.topCenter,
                            child: itemsData[index]);
                      })),
            ],
          ),
        ),
      ),
    );
  }
 void delete(int id) async {

  var res=  await fetch.deleteitems(id);
 
if(res!=null){

  Fluttertoast.showToast(msg: "delete item done refrch to sure",
          textColor: globalcolors.besiccolor);
}else{}
}

  void book(int id) async {

     var res=  await fetch.book(id);
     if(res!=null){

  Fluttertoast.showToast(msg: "book item done ",
          textColor: globalcolors.besiccolor);
}
 getlistitem();
                               getPostsData();
  }

  
  void buy(int id) async {

     var res=  await fetch.buy(id);
     if(res!=null){

  Fluttertoast.showToast(msg: "ordered done",
          textColor: globalcolors.besiccolor);
}
 getlistitem();
                               getPostsData();
  }
}

