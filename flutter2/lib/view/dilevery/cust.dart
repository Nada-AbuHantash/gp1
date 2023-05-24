// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter2/utils/globalColors.dart';
// import 'package:get/get.dart';
// import 'package:flutter2/view/login.dart';
// //import 'package:flutter2/view/logintest.dart';

//
//
//
// class cust extends StatefulWidget {
//   @override
//   _custState createState() => _custState();
// }
//
// class _custState extends State<cust> {
//   bool isAnimationVisible = false;
//   bool isButtonVisible = true;
//
//   @override
//     Widget build(BuildContext context) {
//       return Scaffold(
//
//         appBar: AppBar(
//           backgroundColor: globalcolors.notetcolor,
//           title: Text('Track the order !'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//
//                   ElevatedButton(
//                       child: Text('Take the order'),
//                     onPressed: () {
//                       setState(() {
//                         isAnimationVisible = true;
//                         Timer(Duration(seconds: 6), () {
//                           setState(() {
//                             isAnimationVisible = false;
//                           });
//                         });
//                       });}
//
//                   ),
//
//
//                   SizedBox(width: 80),
//                   ElevatedButton(
//
//                       child: Text('Order processing ,Your order is on the way'),
//                       onPressed: () {
//                         setState(() {
//                           isAnimationVisible = true;
//                           Timer(Duration(seconds: 6), () {
//                             setState(() {
//                               isAnimationVisible = false;
//                             });
//                           });
//                         });}
//
//                   ),
//
//
//              // SizedBox(height: 40),
//
//                   SizedBox(width: 80),
//                   ElevatedButton(
//
//                       child: Text('Order received successfully'),
//                       onPressed: () {
//                         setState(() {
//                           isAnimationVisible = true;
//                           Timer(Duration(seconds: 6), () {
//                             setState(() {
//                               isAnimationVisible = false;
//                             });
//                           });
//                         });}
//
//
//                   ),
//               SizedBox(height: 80),
//               Visibility(
//                 visible: isAnimationVisible,
//                 child: Lottie.network(
//                   'https://assets9.lottiefiles.com/packages/lf20_ardajn6t.json',
//                   height: 200,
//                   width: 200,
//                   fit: BoxFit.contain,
//                 ),
//
//               ),
//
//                 ],
//
//
//           ),
//         ),
//       );
//     }
//   }
//
import 'package:flutter2/models/odertosuper.dart';
import 'package:lottie/lottie.dart';
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
List<Product1> res=[];
  results = myList;

  myList = results;

}


class cust extends StatefulWidget {

  final int id;
  final int total;
  final String name;
  const cust({super.key, required this.id, required this.total, required this.name});

  @override
  _custState createState() => _custState();
}



class _custState extends State<cust> {
  bool isAnimationVisible = false;
  Timer? _timer;

  int _elapsedSeconds = 86400;
  @override
  TextEditingController _textEditingController = TextEditingController();
  String text = "";
  
  late List<Product1> myList3;

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
    int widgetId = widget.id;
    // myList=await fetch.viewbuyfromdil();
    myList=await fetch.viewbuysuper();
  
  }

  void getPostsData() async{
    int widgetId = widget.id;
    List<Widget> listItems = [];
    List<Product1> A = [];
    if(myList.isEmpty)
    // myList=await fetch.viewbuyfromdil();
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
                          "${post.productName},",
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
     int widgetId = widget.id;
     String NAME= widget.name;
     int to=widget.total;
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height * 0.30;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: globalcolors.notetcolor,
          title: Text('Track the order ! $NAME, $to'),
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
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  ElevatedButton(
                      child: Text('Take the order'),
                      onPressed: () {
                        fun(1);
                        setState(() {
                          isAnimationVisible = true;
                          Timer(Duration(seconds: 6), () {
                            setState(() {
                              isAnimationVisible = false;
                            });
                          });
                        });}

                  ),


                  SizedBox(width: 80),
                  ElevatedButton(

                      child: Text('Order processing ,Your order is on the way'),
                      onPressed: () {
                        fun(2);
                        setState(() {
                          isAnimationVisible = true;
                          Timer(Duration(seconds: 6), () {
                            setState(() {
                              isAnimationVisible = false;
                            });
                          });
                        });}

                  ),


                  // SizedBox(height: 40),

                  SizedBox(width: 80),
                  ElevatedButton(

                      child: Text('Order received successfully'),
                      onPressed: () {
                        fun(3);
                        setState(() {
                          isAnimationVisible = true;
                          Timer(Duration(seconds: 6), () {
                            setState(() {
                              isAnimationVisible = false;
                            });
                          });
                        });}


                  ),
                  SizedBox(height: 80),
                  Visibility(
                    visible: isAnimationVisible,
                    child: Lottie.network(
                      'https://assets9.lottiefiles.com/packages/lf20_ardajn6t.json',
                      height: 200,
                      width: 200,
                      fit: BoxFit.contain,
                    ),

                  ),

                ],


              ),
            ],
          ),

        ),
      ),
    );
  }
  
  Future<void> fun(int i) async {
    String msg;
    if(i==1){msg="Your order is taken";}
    else if(i==2){msg="Your order is on the way";}
    else{msg="Your Order received successfully";}
  int widgetId=widget.id;
  var res=  await fetch.upstate(widgetId,msg);

  }


  // Future<void> takeorders() async {

  //   Fluttertoast.showToast(msg: "Take the order dine ",
  //       textColor: globalcolors.notetcolor);
  //   var res=  await fetch.takeorder();
  //   MaterialPageRoute(builder: (context) =>  orders());

  // }
}

