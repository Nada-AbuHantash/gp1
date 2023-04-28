import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';


import 'package:flutter2/mudel/pos.dart';
import 'dart:convert';
import 'package:flutter2/view/rest_api.dart';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:geolocator/geolocator.dart';

import 'package:flutter2/view/widgets/marah1.dart';
import 'package:flutter2/mudel/pos.dart';
// import 'package:flutter2/utils/globalColors.dart';
import 'dart:convert';
import 'package:flutter2/view/rest_api.dart';
import 'dart:math';
import 'dart:convert';
import 'dart:ffi';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:geolocator/geolocator.dart';

class map1 extends StatefulWidget {
  const map1({Key? key}) : super(key: key);
  @override
  _map1State createState() => _map1State();
}

class _map1State extends State<map1> {
  bool isChecked = false;
  double _latPoint=32.309718;
  double _longPoint=35.112541;
  @override
  void initState() {
    distance=[];
    pos1();
    super.initState();
    fetchAllPoints();

    /// connect with database and get all positions
  }
  pos1() async{

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position.latitude);
    print(position.longitude);
  }
  @override
  List<TaxiModel> _points = []; //x and y points
  List<TaxiModel> _diff = [];
  List<TaxiModel> _3KNN = [];

  late List<double> distance;
  late String _call;
  late String _text;

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(

        title: Text("where are you!"),
      ),
      body: Container(
        child: FlutterMap(
          options:
          MapOptions(center: LatLng(_latPoint,_longPoint), zoom: 13.0),
          layers: [
            TileLayerOptions(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png'),
            //**********************************************
            // MarkerLayerOptions(
            //   markers: _points
            //       .map((e) => Marker(
            //     width: 45.0,
            //     height: 45.0,
            //     point:
            //     LatLng(double.parse(e.lat), double.parse(e.long)), //no change
            //     builder: (context) => Container(
            //       child: IconButton(
            //           icon: Icon(Icons.local_taxi),
            //           color: Color.fromARGB(255, 26, 47, 99), // my icon
            //           onPressed: () {
            //             //my notification
            //
            //             addMarker(e.user,e.phone);
            //             print('Marker tapped!');
            //           }),
            //     ),
            //   ))
            //       .toList(),
            // ),
            // MarkerLayerOptions( // taxis
            //   markers: _diff.getRange(1,3)
            //       .map((e) => Marker(
            //     width: 45.0,
            //     height: 45.0,
            //     point:
            //     LatLng(double.parse(e.lat), double.parse(e.long)), //no change
            //     builder: (context) => Container(
            //       child: IconButton(
            //           icon: Icon(Icons.local_taxi),
            //           color: Color.fromARGB(255, 229, 128, 46),// my icon
            //           onPressed: () {
            //             //my notification
            //             addMarker(e.user,e.phone);
            //             print('near to you');
            //           }),
            //     ),
            //   ))
            //       .toList(),
            // ),
            MarkerLayerOptions( // taxis
              markers: _diff.getRange(0,1)
                  .map((e) => Marker(
                width: 45.0,
                height: 45.0,
                point:
                LatLng(double.parse(e.lat), double.parse(e.long)), //no change
                builder: (context) => Container(
                  child: IconButton(
                      icon: Icon(Icons.local_taxi),
                      color: Colors.red,// my icon
                      onPressed: () {
                      //  addMarker(e.user,e.phone);
                        Calculate_KNN();
                        print('near to you');
                      }),
                ),
              ))
                  .toList(),
            ),
            MarkerLayerOptions( // taxis
                markers: [
                  Marker(point: LatLng(_latPoint, _longPoint),
                    builder: (context) => Container(
                      child: IconButton(
                          icon: Icon(Icons.location_pin),
                          color: Color.fromARGB(255, 26, 47, 99), // my icon
                          onPressed: () {
                            //addMarker();
                            print('My location');
                          }),
                    ),
                  )
                ]
            )
            ////////////////////////////////////******************
          ],
        ),
      ),
    );
  }
  void fetchAllPoints() async {
    var data = await FetchTaxis();
    setState(() {
      this._points = data;
      this._diff= data;
    });
    print(_diff);
    Calculate_KNN();
  }
  // Future addMarker(String name,String phone) async { // pop //up
  //   await showDialog(
  //       context: context,
  //       barrierDismissible: true,
  //       builder: (BuildContext context) {
  //         return new AlertDialog(
  //           title: Text(
  //             '$name \n $phone',
  //             style: TextStyle(
  //               fontFamily: 'halter',
  //               fontSize: 15,
  //               package: 'flutter_credit_card',
  //               color: Color.fromARGB(255, 26, 47, 99),
  //
  //             ),
  //             textAlign: TextAlign.center,
  //           ),
  //
  //           actions: <Widget>[
  //             Center(
  //               child: Column(
  //                 children: [
  //
  //                   SizedBox(
  //                     height: 10,
  //                   ),
  //
  //                   SizedBox(
  //                     width: MediaQuery.of(context).size.width / 1.6,
  //                     child:  Container(
  //                       decoration:
  //                       ThemeHelper().buttonBoxDecoration(context),
  //                       child: ElevatedButton(
  //                         style: ThemeHelper().buttonStyle(),
  //                         child: Padding(
  //                           padding:
  //                           EdgeInsets.fromLTRB(40, 10, 40, 10),
  //                           child: Text(
  //                             'Call',
  //                             style: TextStyle(
  //                                 fontFamily: 'halter',
  //                                 fontSize: 18,
  //                                 package: 'flutter_credit_card',
  //                                 color: Colors.white),
  //                           ),
  //                         ),
  //                         onPressed:()async{
  //                           _call ='tel:$phone';
  //                           if ( await canLaunch (_call) ){
  //                             await launch(_call);
  //                           }},
  //                       ),
  //                     ),),
  //                   SizedBox(
  //                     height: 20,
  //                   ),
  //                   SizedBox(
  //                     width: MediaQuery.of(context).size.width / 1.6,
  //                     child:  Container(
  //                       decoration:
  //                       ThemeHelper().buttonBoxDecoration(context),
  //                       child: ElevatedButton(
  //                         style: ThemeHelper().buttonStyle(),
  //                         child: Padding(
  //                           padding:
  //                           EdgeInsets.fromLTRB(40, 10, 40, 10),
  //                           child: Text(
  //                             'Message',
  //                             style: TextStyle(
  //                                 fontFamily: 'halter',
  //                                 fontSize: 18,
  //                                 package: 'flutter_credit_card',
  //                                 color: Colors.white),
  //                           ),
  //                         ),
  //                         onPressed:()async{
  //                           _text ='sms:$phone';
  //                           if ( await canLaunch (_text) ){
  //                             await launch(_text);
  //                           }},
  //                       ),
  //                     ),
  //
  //                   ),
  //                   SizedBox(
  //                     height: 20,
  //                   ),
  //                 ],
  //               ),
  //             )
  //           ],
  //         );
  //       });
  // }
  Future<List<TaxiModel>> FetchTaxis() async {
   const String basurl = "http://192.168.131.52:3000/";
 late  List<TaxiModel> myList=[];
    var res = await http.get(Uri.parse(utils.basurl + "viewloca"));
    // var body = jsonDecode(res.body) as List;
     var jsonString = json.decode(res.body);
      List<TaxiModel> list =
      List<TaxiModel>.from(jsonString.map((i) => TaxiModel.fromJson(i)));
      myList = list;

//  var encodeFirst = json.encode(res.body);
//       var body = json.decode(encodeFirst) as List;
    return myList;
  }

  Future<List<TaxiModel>> Calculate_KNN() async{
    distance.clear();
    double min=0;
    TaxiModel minSort;

    for(int i=0;i<_points.length;i++){
      distance.add(calculateDistance(_latPoint, _longPoint,
          double.tryParse((_points.elementAt(i).lat).replaceAll(RegExp(r'[^0-9.]'),'')),
           double.tryParse((_points.elementAt(i).long).replaceAll(RegExp(r'[^0-9.]'),''))));
    }

    print("hi before");
    print(_points.elementAt(0).lat);
    for(int i=0;i<_diff.length;i++){

      for(int j=i+1;j<_points.length;j++){
        if(distance[i]>distance[j]){
          min=distance[i];
          distance[i]=distance[j];
          distance[j]=min;
          minSort=_diff[i];
          _diff[i]=_diff[j];
          _diff[j]=minSort;
        }
      }

    }
    print("hi after");
    print(_diff.elementAt(0).lat);
    print(distance);

    return _diff;
  }
  double calculateDistance( lat1, lon1,lat2, lon2){
    var p = 0.017453292519943295;
    var a = 0.5 - cos((lat2 - lat1) * p)/2 +
        cos(lat1 * p) * cos(lat2 * p) *
            (1 - cos((lon2 - lon1) * p))/2;
    return 12742 * asin(sqrt(a));
  }


}