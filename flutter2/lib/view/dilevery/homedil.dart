import 'package:flutter/material.dart';
import 'package:flutter2/models/product1.dart';
import 'package:flutter2/utils/globalColors.dart';
import 'dart:ui';
import 'package:flutter2/view/MyHomePage.dart';
import 'package:flutter2/view/dilevery/orders.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';

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

class homedil extends StatefulWidget {
 
  final String data;
  const homedil({super.key, required this.data});

  @override
  _homedilState createState() => _homedilState();
}



class _homedilState extends State<homedil> {
  Timer? _timer;
  int _elapsedSeconds = 86400;
  @override
  TextEditingController _textEditingController = TextEditingController();
  String text = "";

  @override

  void initState() {
    super.initState();



    _textEditingController.text = text;
    myList=[];
    getPostsData();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }



  ScrollController controller = ScrollController();

  bool closeTopContainer = false;
  double topContainer = 0;
  List<Widget> itemsData = [];
  void getlistitem() async {
    myList=await fetch.viewbuysuper();
  }

  void getPostsData() async{
    List<Widget> listItems = [];
    List<Product1> A = [];
    if(myList.isEmpty)
      myList=await fetch.viewbuysuper();
    // future: wish(myList);
    myList.forEach((post) {
      listItems.add(
          Container(

              height: 80,
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
                          post.productName+", "+post.marketName,
                          // "product name",
                          style:  TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold,color: globalcolors.textcolor,),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "count: ${post.amount}, price: ${post.price} ₪",

                              // "count: 3",
                              style:  TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold,color: globalcolors.textcolor,),
                            ),
                            SizedBox(width: 20.0),


                          ],
                        ),



                      ],
                    ),


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
              const SizedBox(
                height: 12,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      child: Text('Take the order !'),
                      style: ElevatedButton.styleFrom(
                        primary: globalcolors.notetcolor,
                        onPrimary: Colors.white,
                        onSurface: Colors.grey,
                      ),
                      onPressed: () async{
                        addO();
                        MaterialPageRoute(builder: (context) =>  orders());
                      },
                    ),
                  ]

              ),
            ],
          ),

        ),
      ),
    );
  }


  Future<void> addO() async {
    Fluttertoast.showToast(msg: "send the request",
        textColor: globalcolors.notetcolor);
    var res=  await fetch.addorder();



  }
}

