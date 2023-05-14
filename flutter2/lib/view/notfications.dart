import 'package:flutter/material.dart';
import 'package:flutter2/models/product.dart';/////اسم البرودكتس زي مهي بالتيبل عشان تنعرض هون
import 'package:flutter2/utils/globalColors.dart';
import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter2/view/cart/cart.dart';
import '../utils/Sharedsession.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter2/view/rest_api.dart';
import 'package:flutter/material.dart';

import '../components/applocal.dart';



const double kDefaultPadding = 10;

TextEditingController productNameController = TextEditingController();
TextEditingController productImageURLController = TextEditingController();
TextEditingController productPriceController = TextEditingController();
TextEditingController productnewPriceController = TextEditingController();
TextEditingController productMarketController = TextEditingController();
TextEditingController productManufactureingController = TextEditingController();

late int count=1;

late  List<Product> myList=[];

void _runFilter(String enteredKeyword) {
  List<Product> results = [];
  if (enteredKeyword.isEmpty) {
    // if the search field is empty or only contains white-space, we'll display all users
    results = myList;
  } else {
    results = myList
        .where((user) => user.productname
        .toLowerCase()
        .contains(enteredKeyword.toLowerCase()))
        .toList();

  }

  myList = results;

}

class notfications extends StatefulWidget {
  const notfications({Key? key}) : super(key: key);
  @override
  _notficationsState createState() => _notficationsState();
}

class _notficationsState extends State<notfications> {

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
    myList=await fetch.most();
  }
  // int daysBetween(DateTime from, DateTime to) {
  //    from = DateTime(from.year, from.month, from.day);
  //    to = DateTime(to.year, to.month, to.day);
  //  return (to.difference(from).inHours / 24).round();
  // }
  void getPostsData() async{

    List<Widget> listItems = [];
    List<Product> A = [];
    if(myList.isEmpty)
      myList=await fetch.most();

    myList.forEach((post) {

// final dd= DateTime(post.exp as int);
//  final date2 = DateTime.now();
//    final difference = daysBetween(dd as DateTime, date2);


      listItems.add(InkWell(

        child: Container(
          height: 120,
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
                    SizedBox(height: 6,),
                    Text(
                      post.productname,

                      style:  TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold,color: globalcolors.textcolor),
                    ),
                    Text(
                      post.namesupermarket,
                      style:  TextStyle(fontSize: 13, color: globalcolors.textcolor.withOpacity(0.6)),
                    ),
                    Text("Available up to :"+ post.exp,
                      style: TextStyle(fontSize: 13, color: globalcolors.textcolor.withOpacity(0.6)),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "The old price : \₪ ${post.price}",
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          fontSize: 13,
                          color: globalcolors.notetcolor,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 3,),
                    Text(
                      "The new price : \₪ ${post.newprice}",
                      style: TextStyle(
                          fontSize: 13,
                          color: globalcolors.besiccolor,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:<Widget>[
                        // add your row widgets here
                      ],
                    ),
                  ],
                ),
                Divider(
                  color: globalcolors.textcolor, // Specify the color of the line
                  thickness: 3.0, // Specify the thickness of the line
                ),

              ],
            ),
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
