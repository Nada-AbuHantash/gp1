import 'package:flutter/material.dart';
import 'package:flutter2/models/product1.dart';
import 'package:flutter2/utils/globalColors.dart';
import 'dart:ui';
import 'package:flutter2/view/MyHomePage.dart';
import 'package:flutter2/view/cart/cart3.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';

TextEditingController productNameController = TextEditingController();
TextEditingController productImageURLController = TextEditingController();
TextEditingController productPriceController = TextEditingController();
TextEditingController productMarketController = TextEditingController();
TextEditingController productManufactureingController = TextEditingController();

late List<Product1> myList = [];

void _runFilter(String enteredKeyword) {
  List<Product1> results = [];

  results = myList;

  myList = results;
}

class cart4 extends StatefulWidget {
  const cart4({Key? key}) : super(key: key);
  @override
  _cart4State createState() => _cart4State();
}

class _cart4State extends State<cart4> {
  Timer? _timer;
  int _elapsedSeconds = 86400;
  @override
  TextEditingController _textEditingController = TextEditingController();
  String text = "";

  @override
  void initState() {
    super.initState();

    _startTimer();

    _textEditingController.text = text;
    myList = [];
    getPostsData();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_elapsedSeconds == 0) {
          _timer?.cancel();
        } else {
          _elapsedSeconds--;
        }
      });
    });
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    String twoDigitHours = twoDigits(duration.inHours.remainder(24));
    return "$twoDigitHours:$twoDigitMinutes:$twoDigitSeconds";
  }

  ScrollController controller = ScrollController();

  bool closeTopContainer = false;
  double topContainer = 0;
  List<Widget> itemsData = [];
  void getlistitem() async {
    myList = await fetch.viewbuy();
  }

  void getPostsData() async {
    List<Widget> listItems = [];
    List<Product1> A = [];
    if (myList.isEmpty) myList = await fetch.viewbuy();
    // future: wish(myList);
    myList.forEach((post) {
      listItems.add(Container(
          height: 80,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              color: globalcolors.besiccolor,
              boxShadow: [
                BoxShadow(
                    color: globalcolors.notetcolor.withAlpha(100),
                    blurRadius: 10.0),
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
                      post.productName + ", " + post.marketName,
                      // "product name",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: globalcolors.textcolor,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "count: ${post.amount}, price: ${post.price} ₪",

                          // "count: 3",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: globalcolors.textcolor,
                          ),
                        ),
                        SizedBox(width: 20.0),
                      ],
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                              title: Text("are you sure delete this itme ?"),
                              titleTextStyle: TextStyle(
                                  color: globalcolors.textcolor, fontSize: 20),
                              backgroundColor: globalcolors.besiccolor,
                              actions: [
                                // const SizedBox(height:10),

                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20.0)),
                                            foregroundColor:
                                                globalcolors.maincolor,
                                            backgroundColor:
                                                globalcolors.notetcolor,
                                            minimumSize: Size(250, 50),
                                          ),
                                          child: Text(
                                            "delete",
                                            style: TextStyle(
                                                color: globalcolors.maincolor,
                                                fontSize: 25),
                                          ),
                                          onPressed: () {
                                            delete(post.id);
                                            getlistitem();
                                            getPostsData();
                                            Fluttertoast.showToast(
                                                msg:
                                                    "delete item done refrch to sure",
                                                textColor:
                                                    globalcolors.besiccolor);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ));
                  },
                  icon: Icon(Icons.delete_forever,
                      color: globalcolors
                          .notetcolor), // The icon to display on the button.
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
                      child: Text('buy'),
                      style: ElevatedButton.styleFrom(
                        primary: globalcolors.notetcolor,
                        onPrimary: Colors.white,
                        onSurface: Colors.grey,
                      ),
                      onPressed: () async {
                        addO();
                      },
                    ),
                  ]),
            ],
          ),
        ),
      ),
    );
  }

  void delete(int id) async {
    var res = await fetch.deleteitems(id);

    if (res != null) {
      Fluttertoast.showToast(
          msg: "delete id done refrch to sure",
          textColor: globalcolors.besiccolor);
    } else {}
  }

  Future<void> addO() async {
    Fluttertoast.showToast(
        msg: "send the request", textColor: globalcolors.notetcolor);
    var res = await fetch.addorder();
  }
}
