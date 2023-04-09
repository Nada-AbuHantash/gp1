import 'package:flutter/material.dart';
import 'package:flutter2/models/product.dart';
import 'package:flutter2/utils/globalColors.dart';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter2/view/rest_api.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../components/applocal.dart';



const double kDefaultPadding = 10;

TextEditingController productNameController = TextEditingController();
TextEditingController productImageURLController = TextEditingController();
TextEditingController productPriceController = TextEditingController();
TextEditingController productnewPriceController = TextEditingController();
TextEditingController productMarketController = TextEditingController();
TextEditingController productManufactureingController = TextEditingController();

late int count=1;
late int flag=1;

late  List<Product> myList=[];

void _runFilter(String enteredKeyword) {
  List<Product> results = [];
  if (enteredKeyword.isEmpty) {
    results = myList;
  }
  else {
    results = myList
        .where((user) => user.productname
        .toLowerCase()
        .contains(enteredKeyword.toLowerCase()))
        .toList();

  }

  myList = results;

}

class homesel extends StatefulWidget {
  const homesel({Key? key}) : super(key: key);
  @override
  _homeselState createState() => _homeselState();
}

class _homeselState extends State<homesel> {

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
    final prefs = await SharedPreferences.getInstance();
  String name= prefs.get("supermarket").toString();
    if(flag==2){
      myList=await fetch.most2(name);}
    else{
    myList=await fetch.most2(name);
    }
  }

  void getPostsData() async{

    List<Widget> listItems = [];
    List<Product> A = [];
    if(myList.isEmpty){
      final prefs = await SharedPreferences.getInstance();
  String name= prefs.get("supermarket").toString();
      if(flag==2){
        myList=await fetch.most2(name);}
      else{
        myList=await fetch.most2(name);
      }
    }

    myList.forEach((post) {


      listItems.add(Container(
          height: 120,
          width: 330,
          padding: const EdgeInsets.only(left: 20,right: 20),
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
          title:
          Text("${getLang(context,"wel")}"),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: globalcolors.textcolor,
          actions: [
            PopupMenuButton<String>(
              icon: Icon(Icons.filter_alt_outlined, color: globalcolors.textcolor),
              onSelected: _handleMenuItemPressed,
              itemBuilder: (context) => [
                PopupMenuItem<String>(
                  value: 'item1',
                  child: Text("${getLang(context,"item1")}", style: TextStyle(fontSize: 16,color: globalcolors.textcolor, fontWeight: FontWeight.bold)),
                ),
                PopupMenuItem<String>(
                  value: 'item2',
                  child: Text("${getLang(context,"item2")}", style: TextStyle(fontSize: 16,color: globalcolors.textcolor, fontWeight: FontWeight.bold)),
                ),

              ],
            ),
          ],
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
              ),
              const SizedBox(
                height: 8,
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
              child: Padding(
                padding: const EdgeInsets.only(left: 25,right: 25, top: 4),
                child: TextField(
                  onChanged: (value) => {_runFilter(value),getPostsData(),getlist()},
                  controller: _textEditingController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: text,
                      hintStyle: TextStyle(
                          color: globalcolors.textcolor
                      ),
                      suffixIcon: Icon(
                        Icons.search,
                        color: globalcolors.textcolor,
                      )),
                ),
              ),
            )),
      ],
    );
  }
  void _handleMenuItemPressed(String value) {
    // Perform an action based on the selected menu item
    switch (value) {
      case 'item1':
        flag=2;
        print("one");
      // Do something for menu item 1
        break;
      case 'item2':
        flag=1;
        print("tow");
      // Do something for menu item 2
        break;
      default:
        flag=1;
        break;
    }
  }
}

