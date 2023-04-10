import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class mapgpt extends StatefulWidget {
  @override
  _mapgptState createState() => _mapgptState();
}

class _mapgptState extends State<mapgpt> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(
    title: Text('Map Screen'),
  ),
  body: GoogleMap(
    initialCameraPosition: CameraPosition(
      target: LatLng(37.7749, -122.4194),
      zoom: 12,
    ),
 markers: {
    Marker(
      markerId: MarkerId('marker_1'),
      position: LatLng(37.7749, -122.4194),
      infoWindow: InfoWindow(
        title: 'San Francisco',
        snippet: 'Population: 883,305',
      ),
    ),
  },

  ),
);

  }
}