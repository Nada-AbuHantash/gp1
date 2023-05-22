import 'package:flutter/material.dart';
import 'package:flutter2/models/product1.dart';
import 'package:flutter2/utils/globalColors.dart';
import 'dart:ui';
import 'package:flutter2/view/MyHomePage.dart';
import 'package:flutter2/view/dilevery/all.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';

import '../../models/supermarket.dart';
import '../../utils/Sharedsession.dart';

TextEditingController productNameController = TextEditingController();

late List<super1> myList = [];

void _runFilter(String enteredKeyword) {
  List<super1> results = [];

  results = myList;

  myList = results;
}

class markets extends StatefulWidget {
  const markets({Key? key}) : super(key: key);
  @override
  _marketsState createState() => _marketsState();
}

class _marketsState extends State<markets> {
  Timer? _timer;

  @override
  TextEditingController _textEditingController = TextEditingController();
  String text = "";

  @override
  void initState() {
    super.initState();

    _textEditingController.text = text;
    myList = [];
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
    myList = await fetch.allsupermarkt();
  }

  void getPostsData() async {
    List<Widget> listItems = [];
    List<super1> A = [];
    if (myList.isEmpty) myList = await fetch.allsupermarkt();
    // future: wish(myList);
    myList.forEach((post) {
      listItems.add(Container(
        height: 60,
        width: 130,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            color: globalcolors.besiccolor,
            boxShadow: [
              BoxShadow(
                  color: globalcolors.notetcolor.withAlpha(100),
                  blurRadius: 10.0),
            ]),
        child: GestureDetector(
            onTap: () async {
              // Action to be performed when the container is pressed
              print('open this market!');
              Sharedsession shared = new Sharedsession();
              await shared.savenamesuper(post.marketName);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => all(
                        data: post.marketName,
                      )));
              // MaterialPageRoute(builder: (context) => all());
            },
            child: Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        post.marketName,
                        // "product name",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: globalcolors.textcolor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
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
    Fluttertoast.showToast(
        msg: "send the request", textColor: globalcolors.notetcolor);
    var res = await fetch.addorder();
  }
}
