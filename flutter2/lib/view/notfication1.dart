import 'package:flutter/material.dart';
import 'package:flutter2/models/product.dart';
import 'package:flutter2/utils/globalColors.dart';
import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter2/view/cart/cart.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter2/view/rest_api.dart';
import 'package:flutter/material.dart';

import '../models/notifi.dart';




const double kDefaultPadding = 10;

TextEditingController productNameController = TextEditingController();
TextEditingController productImageURLController = TextEditingController();
TextEditingController productPriceController = TextEditingController();
TextEditingController productnewPriceController = TextEditingController();
TextEditingController productMarketController = TextEditingController();
TextEditingController productManufactureingController = TextEditingController();

late int count=1;

late  List<String1> myList=[];

void _runFilter(String enteredKeyword) {
  List<String1> results = [];
  if (enteredKeyword.isEmpty) {
    // if the search field is empty or only contains white-space, we'll display all users
    results = myList;
  }
  // else {
  //   results = myList
  //       .where((user) => user.productname
  //       .toLowerCase()
  //       .contains(enteredKeyword.toLowerCase()))
  //       .toList();

  // }

  myList = results;

}

class notfications1 extends StatefulWidget {
  const notfications1({Key? key}) : super(key: key);
  @override
  _notfications1State createState() => _notfications1State();
}

class _notfications1State extends State<notfications1> {

  @override

  TextEditingController _textEditingController = TextEditingController();

  String text = "";


  @override
  rest_api fetch=new rest_api();


  void initState()  {
    super.initState();
    _textEditingController.text = text;
    getPostsData();
    controller.addListener(() {
      double value = controller.offset / 125;

      setState(() {

        topContainer = value;
        closeTopContainer = controller.offset > 30;
      });
    });
  }

  ScrollController controller = ScrollController();

  bool closeTopContainer = false;
  double topContainer = 0;
  List<Widget> itemsData = [];
  void getlist() async{
    myList=await fetch.viewnotifi();
  }
 
  void getPostsData() async{

    List<Widget> listItems = [];
    List<String1> A = [];
    if(myList.isEmpty)
      myList=(await fetch.viewnotifi());

    myList.forEach((post) {


      listItems.add(InkWell(

        child: Container(
          height: 80,
          width: 330,
          padding: const EdgeInsets.only(left: 20,right: 20),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    Text(
                      post.namepro,

                      style:  TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold,color: globalcolors.textcolor),
                    ),
                    Text(
                      "${post.msg},\n The current quantity is ${post.count}",
                      style:  TextStyle(fontSize: 13, color: globalcolors.textcolor.withOpacity(0.6)),

                    ),
                   
                  ],

                ),
                Divider(
                  color: globalcolors.textcolor, // Specify the color of the line
                  thickness: 2.0, // Specify the thickness of the line
                ),

              ],
            ),
            
          ),
/////////
decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1.0, color: globalcolors.textcolor),
        ),
/////////
        ),

      ),
      ));

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
                        padding:
                        const EdgeInsets.symmetric(
                            horizontal: kDefaultPadding),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildSearchBar(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
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

  _buildSearchBar() {
    return Row(
      children: <Widget>[


        Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: globalcolors.besiccolor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 20,
                        offset: const Offset(10, 15)
                    ),
                  ]),

            )),
      ],
    );
  }
}