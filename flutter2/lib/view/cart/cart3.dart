import 'package:flutter/material.dart';
import 'package:flutter2/models/product1.dart';
import 'package:flutter2/utils/globalColors.dart';
import 'dart:ui';
import 'package:flutter2/view/MyHomePage.dart';
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



class cart03 extends StatefulWidget {
  const cart03({Key? key}) : super(key: key);
  @override
  _cart03State createState() => _cart03State();
}

class _cart03State extends State<cart03> {
  Timer? _timer;
  int _elapsedSeconds = 86400;
  @override
  TextEditingController _textEditingController = TextEditingController();
  String text = "";

  @override

  void initState() {
    super.initState();
    super.initState();
    _startTimer();

    _textEditingController.text = text;
    myList=[];
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
    myList=await fetch.viewbook();
  }

  void getPostsData() async{
    List<Widget> listItems = [];
    List<Product1> A = [];
    if(myList.isEmpty)
      myList=await fetch.viewbook();
    // future: wish(myList);
    myList.forEach((post) {
      listItems.add(
          Container(
            
              height: 80,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  color: globalcolors.notetcolor,
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
                      children: <Widget>[ Text(
                                _formatDuration(Duration(seconds: _elapsedSeconds)),
                                style: TextStyle(fontSize: 17),
                              ),
                        Text(
                          post.productName+", "+post.marketName,
                          // "product name",
                          style:  TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold,color: globalcolors.maincolor,),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Text(
                          "count: ${post.amount}, price: ${post.price} ₪",

                          // "count: 3",
                          style:  TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold,color: globalcolors.maincolor,),
                        ),
                         SizedBox(width: 20.0),

                              
                          ],
                        ),
                        
                        // Text(
                        //   post.marketName,
                        //   //"supermarket name",
                        //   style:  TextStyle(fontSize: 17,color: globalcolors.textcolor,),
                        // ),

                       
                        // Text(
                        //   "price: ${post.price} ₪",
                        //   // "price:15 ₪",
                        //   style:  TextStyle(
                        //     fontSize: 17, fontWeight: FontWeight.bold,color: globalcolors.textcolor,),
                        // ),

                        


                      ],
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

                                              // const SizedBox(height: 20),

                                            ],

                                          )

                                  );

                                },
                                icon: Icon(Icons.delete_forever,color: globalcolors.textcolor), // The icon to display on the button.
                              ),
                    // Image.asset(post.image,width: 100,height: 100,),
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
                            horizontal: kDefaultPadding
                            ),

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
                            
                      }
                      )
                      
                      ),
                        
            ],
            
          ),
        ),
      ),
    );
  }
  void delete(int id) async {

    var res=  await fetch.deleteitems(id);

    if(res!=null){

      Fluttertoast.showToast(msg: "delete id done refrch to sure",
          textColor: globalcolors.besiccolor);
    }else{}
  }
}

