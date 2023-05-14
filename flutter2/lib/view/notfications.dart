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

class CardInfoPage extends StatelessWidget {
  final List<String> cardInfo = [
    'Card 1 Information',
    'Card 2 Information',
    'Card 3 Information',
    // Add more card information here
  ];

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

      body: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: cardInfo.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                //  title: Text(cardInfo[index]),
                subtitle: Container(
                    height: 100,
                    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    // decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    //     color: Colors.white,
                    //     boxShadow: [
                    //       BoxShadow(color: globalcolors.notetcolor.withAlpha(100), blurRadius: 10.0),
                    //     ]),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 9),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(cardInfo[index]),

                              Text(
                                // post.productName,
                                "custmer name",
                                style:  TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold,color: Colors.green,),
                              ),
                              Text(
                                // post.productName,
                                "product name",
                                style:  TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold,color: globalcolors.textcolor,),
                              ),
                              Text(
                                //   post.marketName,
                                "supermarket name",
                                style:  TextStyle(fontSize: 17,color: Colors.red,fontWeight: FontWeight.bold,),
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
