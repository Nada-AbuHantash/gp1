import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'dart:async';
import 'package:hexcolor/hexcolor.dart';

class TaxiModel {
  late String lat, long, id, user, phone;

  TaxiModel(
      this.lat,
      this.long,
      this.id,
      this.user,
      this.phone,
      );

  TaxiModel.fromJson(Map<String, dynamic> map) {
    this.lat = map['xlocation'];
    this.long= map['ylocation'];
    this.id = map['superid'].toString();
    this.user= map['suparmarketname'];
    this.phone= map['sellerphone'].toString();

  }
}
