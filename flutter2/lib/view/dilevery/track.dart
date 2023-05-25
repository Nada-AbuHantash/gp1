import 'package:flutter/material.dart';
import 'package:flutter2/models/product1.dart';
import 'package:flutter2/utils/globalColors.dart';
import 'dart:ui';
import 'package:flutter2/view/MyHomePage.dart';
import 'package:flutter2/view/dilevery/all.dart';
import 'package:flutter2/view/dilevery/cust.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';

import '../../models/odertosuper.dart';

import '../../utils/Sharedsession.dart';

TextEditingController productNameController = TextEditingController();
TextEditingController IDController = TextEditingController();



late  List<super2> myList=[];

void _runFilter(String enteredKeyword) {
  List<super2> results = [];

  results = myList;

  myList = results;
}



class track extends StatefulWidget {
  const track({Key? key}) : super(key: key);
  @override
  _trackState createState() => _trackState();
}

class _trackState extends State<track> {
  Timer? _timer;

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
    myList=await fetch.trackord();
  }

  void getPostsData() async{
    List<Widget> listItems = [];
    List<super2> A = [];
    if(myList.isEmpty)
      myList=await fetch.trackord();
    // future: wish(myList);
    myList.forEach((post) {
      listItems.add(

          Container(

            height: 100,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                color: globalcolors.besiccolor,
                boxShadow: [
                  BoxShadow(color: globalcolors.notetcolor.withAlpha(100), blurRadius: 10.0),
                ]),
            child: GestureDetector(
                onTap: () async {
                 
                  print('go order!');
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => cust(id:post.id,
                      total:post.price+post.pls,
                      name:post.userName,
                      sname:post.marketName,
                      )));
              
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text("the order have ID ${post.id} is ${post.state} at",
                            style:  TextStyle(
                              fontSize: 16, color: globalcolors.textcolor,),
                          ),
                         Text(" ${post.time}",
                            style:  TextStyle(
                              fontSize: 16, color: globalcolors.textcolor,),
                          ),
                           Text(" ${post.date}",
                            style:  TextStyle(
                              fontSize: 16,color: globalcolors.textcolor,),
                          )
                        


                        ],
                      ),


                    ],
                  ),
                ) ),));
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
                height: 5,
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
                height: 5,
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

