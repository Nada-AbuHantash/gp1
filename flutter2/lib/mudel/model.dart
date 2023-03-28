import 'dart:js_util';

import 'package:flutter2/view/signup.dart';

List<model>modelfromjson(dynamic str)=>
List<model>.from((str).map((x)=>model.fromJson(x)));


class model{
  late String? id;
    late String? name;
 
 model({this.id,this.name});
 model.fromJson(Map<String,dynamic>json){
  id=json["id"];
  name=json["name"];
 }

Map<String,dynamic>toJson(){
  final data =<String,dynamic>{};
  data["_id"]=id;
  data["name"]=name;
  return data;
}
}