import 'package:flutter/cupertino.dart';

import '../../components/applocal.dart';

class DataModel {
  final String title;
  final String imagename;
  DataModel(
    this.title,
    this.imagename,
  );
}


List<DataModel> dataList=
// (BuildContext context){
// return
 [
    DataModel(
      //"${getLang(context, "m")}",
        "You can find stores now  offering curbside services near you. See all our sales. Pay less for the foodstuffs you love.",
      "assets/images/shop11.png"),
   
  DataModel(
      "advertisement here! The easiest and fastest way to make money ! See how much you can make.",
      "assets/images/market.png"),
      DataModel(
      "Do you have a bike? Take advantage of it with us by delivering orders to your area, take this your opportunity",
      "assets/images/delivery.png"),
];
