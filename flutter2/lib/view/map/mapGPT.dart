import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter2/mudel/pos.dart';
import 'package:flutter2/utils/globalColors.dart';
import 'package:flutter2/view/mainpage.dart';
import 'dart:convert';
import 'package:flutter2/view/rest_api.dart';
import 'package:flutter2/view/widgets/marah1.dart';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:geolocator/geolocator.dart';

import '../chat/ChatRoom.dart';

double x0 = 0;
double y0 = 0;

class addBasket extends StatefulWidget {
  const addBasket({Key? key}) : super(key: key);
  @override
  _addBasket createState() => _addBasket();
}

class _addBasket extends State<addBasket> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyMap(),
    );
  }
}

class MyMap extends StatefulWidget {
  @override
  _MyMap createState() => new _MyMap();
}

class _MyMap extends State<MyMap> with WidgetsBindingObserver {
  Map<String, dynamic>? userMap;
  bool isLoading = false;
  // late final bool isme;
  final TextEditingController _search = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  void initState() {
    super.initState();
    distance = [];
    pos();

    /// pos();
    // super.initState();
    fetchAllPoints();
    WidgetsBinding.instance!.addObserver(this);
    setStatus("Online");
  }

  void setStatus(String status) async {
    await _firestore.collection('users').doc(_auth.currentUser!.uid).update({
      "status": status,
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // online
      setStatus("Online");
    } else {
      // offline
      setStatus("Offline");
    }
  }

  String chatRoomId(String user1, String user2) {
    if (user1[0].toLowerCase().codeUnits[0] >
        user2.toLowerCase().codeUnits[0]) {
      return "$user1$user2";
    } else {
      return "$user2$user1";
    }
  }

  void onSearch() async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    setState(() {
      isLoading = true;
    });

    await _firestore
        .collection('users')
        .where("name", isEqualTo: "ahmad")
        .get()
        .then((value) {
      setState(() {
        userMap = value.docs[0].data();
        isLoading = false;
      });
      print("nnnnnnnnnnnnnnnn");
    });
  }

  bool isChecked = false;

  double _latPoint = x0;
  double _longPoint = y0;

  @override
  List<TaxiModel> _points = []; //x and y points
  List<TaxiModel> _diff = [];
  List<TaxiModel> _3KNN = [];
  // final String _phone ='+09987777';
  late List<double> distance;
  late String _call;
  late String _text;
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          title: Text("Look who's around"),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: globalcolors.textcolor,
          leading: IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage1()),
              );
              // Perform the desired action when the back button is pressed
            },
          ),
        ),
        body: FlutterMap(
          options: new MapOptions(
            center: new LatLng(_latPoint, _longPoint), // my location
            minZoom: 7.0,
            zoom: 12,
          ),
          layers: [
            new TileLayerOptions(
                urlTemplate:
                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c']),
            MarkerLayerOptions(
              // taxis
              markers: _points
                  .map((e) => Marker(
                        width: 45.0,
                        height: 45.0,
                        point: LatLng(double.parse(e.lat),
                            double.parse(e.long)), //no change
                        builder: (context) => Container(
                          child: IconButton(
                              icon: Icon(Icons.store),
                              color: globalcolors.textcolor, // my icon
                              onPressed: () async {
                                //my notification
                                FirebaseFirestore _firestore =
                                    FirebaseFirestore.instance;

                                setState(() {
                                  isLoading = true;
                                });

                                addMarker(e.user, e.phone);
                                print('Marker tapped!');
                              }),
                        ),
                      ))
                  .toList(),
            ),
          ],
        ));
  }

  void fetchAllPoints() async {
    var data = await FetchTaxis();
    setState(() {
      this._points = data;
      this._diff = data;
    });
    Calculate_KNN();
  }

  Future addMarker(String name, String phone) async {
    // pop //up
    await showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: Text(
              '$name \n $phone',
              style: TextStyle(
                fontFamily: 'halter',
                fontSize: 15,
                package: 'flutter_credit_card',
                color: Color.fromARGB(255, 26, 47, 99),
              ),
              textAlign: TextAlign.center,
            ),
            actions: <Widget>[
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.6,
                      child: Container(
                        decoration: ThemeHelper().buttonBoxDecoration(context),
                        child: ElevatedButton(
                          style: ThemeHelper().buttonStyle(),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                            child: Text(
                              'Call',
                              style: TextStyle(
                                  fontFamily: 'halter',
                                  fontSize: 18,
                                  package: 'flutter_credit_card',
                                  color: Colors.white),
                            ),
                          ),
                          onPressed: () async {
                            _call = 'tel:$phone';
                            if (await canLaunch(_call)) {
                              await launch(_call);
                            }
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    userMap != null
                        ? SizedBox(
                            width: MediaQuery.of(context).size.width / 1.6,
                            child: Container(
                              decoration:
                                  ThemeHelper().buttonBoxDecoration(context),
                              child: ElevatedButton(
                                style: ThemeHelper().buttonStyle(),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                                  child: Text(
                                    'Message',
                                    style: TextStyle(
                                        fontFamily: 'halter',
                                        fontSize: 18,
                                        package: 'flutter_credit_card',
                                        color: Colors.white),
                                  ),
                                ),
                                //  userMap != null
                                // ? ListTile():Column()
                                onPressed: () async {
                                  // _text ='sms:$phone';
                                  // if ( await canLaunch (_text) ){
                                  //   await launch(_text);
                                  // }
                                  String roomId = chatRoomId(
                                      _auth.currentUser!.displayName!,
                                      userMap!['name']);

                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => ChatRoom(
                                        chatRoomId: roomId,
                                        userMap: userMap!,
                                        //  isme:  _auth.currentUser==userMap!['email'],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          )
                        : Column(),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              )
            ],
          );
        });
  }

  Future<List<TaxiModel>> FetchTaxis() async {
    const String basurl = "http://192.168.69.52:3000/";
    var res = await http.get(Uri.parse(utils.basurl + "viewloca"));
    var body = jsonDecode(res.body) as List;

    return body.map((taxi) => TaxiModel.fromJson(taxi)).toList();
  }

  Future<List<TaxiModel>> Calculate_KNN() async {
    distance.clear();
    double min = 0;
    TaxiModel minSort;

    for (int i = 0; i < _points.length; i++) {
      distance.add(calculateDistance(
          _latPoint,
          _longPoint,
          double.parse(_points.elementAt(i).lat),
          double.parse(_points.elementAt(i).long)));
    }
    print(x0);
    print(y0);
    print("hi before");
    print(_points.elementAt(0).lat);
    for (int i = 0; i < _diff.length; i++) {
      for (int j = i + 1; j < _points.length; j++) {
        if (distance[i] > distance[j]) {
          min = distance[i];
          distance[i] = distance[j];
          distance[j] = min;
          minSort = _diff[i];
          _diff[i] = _diff[j];
          _diff[j] = minSort;
        }
      }
    }
    print("hi after");
    print(_diff.elementAt(0).long);
    print(distance);

    return _diff;
  }

  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var a = 0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }
}

pos() async {
  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
  print(position.latitude);
  print(position.longitude);
  x0 = position.latitude;
  y0 = position.longitude;
}
