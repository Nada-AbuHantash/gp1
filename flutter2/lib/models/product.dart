import 'package:flutter/cupertino.dart';
import 'dart:math';
import 'dart:typed_data';
import 'dart:convert';
enum Shade { orange, green }

class Product {
  final String namesupermarket;
  final String productname;
  final int  id;
    final int  count;
  final int price;
  final int newprice;
  final String exp;
  // final String expiryDate;
  // final int productNumber;
// final List<int> image;
  // final String? description;
  final bool inCart;
  final Shade shade;
  final  String   image;

  factory Product.fromJson(Map<String,dynamic> json) => Product(
    namesupermarket: json['namesupermarket']  == null ? '' : json['namesupermarket']as String,
    productname: json['productname']  == null ? '' : json['productname']as String,
    id: json['productid']  == null ? 0 : json['productid'] as int,
     count: json['productcount']  == null ? 0 : json['productcount'] as int,
    price: json['oldprice'] == null ? 0 : json['oldprice'] as int,
     newprice: json['newprice'] == null ? 0 : json['newprice'] as int,
    exp: json['exp']  == null ? '' : json['exp']as String,
    //  image: json['image'] as List<int>?,
    // image: Uint8List.fromList((json['image'] as List)
    //          .map((e) => e as int).toList())
    // expiryDate: json['expiryDate']  == null ? '' : json['expiryDate']as String,
    // productNumber: json['productNumber']   == null ? 0 : json['productNumber'] as int,
    //  image : List<int>.from(json["image"]),
    //  image: json['image'] as Map<String,dynamic> ,
    image: json['productimage']  == null ? '' : json['productimage']as String,
  );

  Product({
    required this.namesupermarket,
    required this.productname,
    // required this.image,
    required this.id,
    required this.count,
    required this.price,
    required this.newprice,
    required this.exp,
    required this.image,
    // this.description,
    this.inCart = false,
    this.shade = Shade.green,
  });

  String getFormattedPrice() {
    return '\$$price';
  }




  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['namesupermarket'] = this.namesupermarket;
    data['productname'] = this.productname;
     data['productid '] = this.id;
     data['productcount'] = this.count;
    data['oldprice'] = this.price;
data['newprice'] = this.newprice;
    data['exp'] = this.exp;

//بتحكيلك جوناء اسم الفنكشن بالفيتش راتا موست
    return data;
  }

}