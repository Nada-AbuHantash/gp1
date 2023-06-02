import 'package:flutter/material.dart';
import 'package:flutter2/components/applocal.dart';
import 'package:flutter2/view/rest_api.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:location/location.dart';
import 'package:flutter2/utils/globalColors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

rest_api fetch1 = new rest_api();

class map extends StatefulWidget {
  @override
  _mapState createState() => _mapState();
}

class _mapState extends State<map> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Join our world ! "),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: globalcolors.textcolor,// Customize the title as needed
      ),
      body: FutureBuilder<LocationData?>(
        future: _currentLocation(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapchat) {
          if (snapchat.hasData) {
            final LocationData currentLocation = snapchat.data;
            return Column(
              children: [
                Expanded(
                  child: SfMaps(
                    layers: [
                      MapTileLayer(
                        initialFocalLatLng: MapLatLng(
                            currentLocation.latitude!,
                            currentLocation.longitude!),
                        initialZoomLevel: 15,
                        initialMarkersCount: 1,
                        urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        markerBuilder:
                            (BuildContext context, int index) {
                          return MapMarker(
                            latitude: currentLocation.latitude!,
                            longitude: currentLocation.longitude!,
                            child: Icon(
                              Icons.location_on,
                              color: Colors.red[800],
                            ),
                            size: Size(20, 20),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      foregroundColor: globalcolors.maincolor,
                      backgroundColor: globalcolors.textcolor,
                      minimumSize: Size(250, 50),
                    ),
                    child: Text(
                      "${getLang(context, "map1")}",
                      style: TextStyle(
                        color: globalcolors.maincolor,
                        fontSize: 25,
                      ),
                    ),
                    onPressed: () {
                      print(currentLocation.latitude!);
                      print(currentLocation.longitude!);
                      addlocayion(
                        currentLocation.latitude,
                        currentLocation.longitude,
                      );
                    },
                  ),
                ),
              ],
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Future<void> addlocayion(double? altitude, double? longitude) async {
    final prefs = await SharedPreferences.getInstance();
    String email = prefs.get("emailemail").toString();
    var res = await fetch1.addlocation(email, altitude!, longitude!).then(
          (res) {
        print(res.toString());
        Fluttertoast.showToast(
          msg: "add location done",
          textColor: globalcolors.besiccolor,
        );
      },
    );
  }

  Future<LocationData?> _currentLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    Location location = new Location();

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return null;
      }
    }
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }
    return await location.getLocation();
  }
}
