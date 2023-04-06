import 'package:flutter/material.dart';
import 'package:flutter2/models/product.dart';/////اسم البرودكتس زي مهي بالتيبل عشان تنعرض هون
import 'package:flutter2/utils/globalColors.dart';
import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/cupertino.dart';
import 'dart:math';
import 'dart:typed_data';
import 'dart:convert';
import 'package:flutter2/view/rest_api.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

List<String> imagesList = [
  "https://thumbs.dreamstime.com/z/d-isometric-vector-concept-mobile-grocery-list-shopping-app-flat-181622871.jpg",
  "https://barn2.com/wp-content/uploads/2018/03/Create-a-WooCommerce-Price-List-Blog-Header-820x369.png",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRz94eeo8JMzupDzTlwT0gQ41B9h-BCLUOZ4g&usqp=CAU",
  "https://www.evolutionnutrition.com/sites/default/files/article-images/Online%20Grocery%20Inside.jpg",
];
int _currentImageIndex = 0;
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

class homecust extends StatefulWidget {
  const homecust({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<homecust> {

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


      listItems.add(Container(
          height: 120,
          width: 330,
          padding: const EdgeInsets.only(left: 30,),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(

              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: <Widget>[
                Column(
                  
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      post.productname,
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      post.namesupermarket,
                      style: const TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                    Text("avilable up to "+
                      post.exp,
                      style: const TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "the old price : \$ ${post.price}",
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                          fontSize: 13,
                          color: globalcolors.notetcolor,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5,),
                     Text(
                      "the new price : \$ ${post.newprice}",
                      style: TextStyle(
                          fontSize: 13,
                          color: globalcolors.besiccolor,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10,),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                        children:<Widget>[



                        ]),
                  ],
                ),
                Image.asset(post.image,width: 100,height: 80,),


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
        appBar: AppBar(
          elevation: 0,
          title: const Text('Welcome to SALE !'),
          backgroundColor: Colors.white,
          foregroundColor: globalcolors.textcolor,

        ),
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
              ),Container(
                // margin: const EdgeInsets.symmetric(vertical: 20.0),
                margin: EdgeInsets.all(
                    2
                ),
                height: 200.0,

                child: ListView(
                  // This next line does the trick.


                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    //  Image.asset("assets/images/of_main_bg.png",

                    //                           ),
                    //                             Image.asset("assets/images/of_main_bg.png",
                    //                           height: 100, width: 120
                    //                           ),
                    //                             Image.asset("assets/images/b.jpg",
                    //                           height: 100, width: 120
                    //                           ),
                    Container(

                      margin: EdgeInsets.all(
                          5
                      ),width: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://thumbs.dreamstime.com/z/d-isometric-vector-concept-mobile-grocery-list-shopping-app-flat-181622871.jpg"),
                            fit: BoxFit.cover),
                        border: Border.all(

                            color: globalcolors.besiccolor,
                            width: 5.0,
                            style: BorderStyle.solid
                        ),
                        borderRadius: BorderRadius.circular(20),
                        color:globalcolors.notetcolor.withOpacity(0.5),
                      ),
                      child: const Center (

                      ),

                    ),
                    Container(

                      margin: EdgeInsets.all(
                          5
                      ),width: 150,

                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://barn2.com/wp-content/uploads/2018/03/Create-a-WooCommerce-Price-List-Blog-Header-820x369.png"),
                            fit: BoxFit.cover),
                        border: Border.all(
                            color: globalcolors.besiccolor,
                            width: 5.0,
                            style: BorderStyle.solid
                        ),
                        borderRadius: BorderRadius.circular(20),
                        color:globalcolors.notetcolor.withOpacity(0.5),
                      ),
                      child: const Center (

                      ),
                    ),
                    Container(

                      margin: EdgeInsets.all(
                          5
                      ),width: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRz94eeo8JMzupDzTlwT0gQ41B9h-BCLUOZ4g&usqp=CAU"),
                            fit: BoxFit.cover),
                        border: Border.all(
                            color: globalcolors.besiccolor,
                            width: 5.0,
                            style: BorderStyle.solid
                        ),
                        borderRadius: BorderRadius.circular(20),
                        color:globalcolors.notetcolor.withOpacity(0.5),
                      ),
                      child: const Center (
                          child: Text('')
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(
                          5
                      ),width: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://www.evolutionnutrition.com/sites/default/files/article-images/Online%20Grocery%20Inside.jpg"),
                            fit: BoxFit.cover),
                        border: Border.all(
                            color:globalcolors.besiccolor,
                            width: 5.0,
                            style: BorderStyle.solid
                        ),
                        borderRadius: BorderRadius.circular(20),
                        color:globalcolors.notetcolor.withOpacity(0.5),
                      ),
                      child: const Center (
                          child: Text('')
                      ),
                    ),

                  ],
                ),
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

  _buildSearchBar() {
    return Row(
      children: <Widget>[


        Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 30,
                        offset: const Offset(0, 5)),
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 4),
                child: TextField(
                  onChanged: (value) => {_runFilter(value),getPostsData(),getlist()},
                  controller: _textEditingController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: text,
                      hintStyle: TextStyle(
                        color: Color.fromARGB(255, 7, 0, 0),
                      ),
                      suffixIcon: Icon(
                        Icons.search,
                        color: Color.fromARGB(255, 9, 9, 9).withOpacity(0.30),
                      )),
                ),
              ),
            )),
      ],
    );
  }
}

