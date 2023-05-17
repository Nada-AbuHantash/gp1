import 'package:flutter/material.dart';
import 'package:flutter2/models/filtert.dart';
import 'package:flutter2/utils/globalColors.dart';
import 'dart:ui';
import 'package:flutter2/view/MyHomePage.dart';
import 'package:flutter2/view/dilevery/homedil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';

import '../../models/odertosuper.dart';

TextEditingController productNameController = TextEditingController();
TextEditingController productImageURLController = TextEditingController();
TextEditingController productPriceController = TextEditingController();
TextEditingController productMarketController = TextEditingController();
TextEditingController productManufactureingController = TextEditingController();

late  List<super2> myList=[];
class all extends StatefulWidget {
 
  final String data;
  const all( { required this.data,});

  @override
  _allState createState() => _allState();
}
void _runFilter(String enteredKeyword) {
  List<super2> results = [];

  results = myList;

  myList = results;
}



// class all extends StatefulWidget {
//   const all({Key? key, required String date}) : super(key: key);
//   @override
//   _allState createState() => _allState();
// }

class _allState extends State<all> {


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
    myList=await fetch.odrdertosupermarkt();
  }

  void getPostsData() async{
    List<Widget> listItems = [];
    List<super2> A = [];
    if(myList.isEmpty)
      myList=await fetch.odrdertosupermarkt();
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
              child: GestureDetector(
                  onTap: () {
                    // Action to be performed when the container is pressed
                    print('open this case!');
                    MaterialPageRoute(builder: (context) =>  dil());
                  },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          post.userName,
                          // "product name",
                          style:  TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold,color: globalcolors.textcolor,),
                        ),
                        Text(
                          "Market name: ${ post.marketName}",

                          //"supermarket name",
                          style:  TextStyle(fontSize: 17,color: globalcolors.textcolor,),
                        ),
                        Text(
                          "the number of pieces: ${ post.amount}",

                          //"supermarket name",
                          style:  TextStyle(fontSize: 17,color: globalcolors.textcolor,),
                        ),
                        Text(
                          "ID: ${post.id}",

                          // "count: 3",
                          style:  TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold,color: globalcolors.notetcolor,),
                        ),Text(
                          "Total price: ${post.price} ₪",
                          // "price:15 ₪",
                          style:  TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold,color: globalcolors.textcolor,),
                        ),




                      ],
                    ),
                    //Image.asset(post.image,width: 100,height: 100,),
                    //  Image.asset('assets/images/p4.jpg',width: 100,height: 100,),


                  ],
                ),
              )),));
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



}

