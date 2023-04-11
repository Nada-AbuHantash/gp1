import 'package:flutter/material.dart';

import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
class map extends StatefulWidget {
  @override
  _mapState createState() => _mapState();
}

class _mapState extends State<map> {
  late LatLng _pickedLocation = LatLng(32.309718, 35.112541);

  void _handleTap(LatLng latLng) {
    print('Tapped on map at $latLng');
    setState(() {
      _pickedLocation = latLng;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
      ),
      body:
      GestureDetector(
        onTap: () => _handleTap(_pickedLocation),
        child: FlutterMap(
          options: MapOptions(
            center: LatLng(32.309718, 35.112541),
            zoom: 13.0,
          ),
          layers: [
            TileLayerOptions(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              subdomains: ['a', 'b', 'c'],
            ),
            MarkerLayerOptions(
              markers: [
                Marker(
                  width: 30.0,
                  height: 30.0,
                  point: _pickedLocation ?? LatLng(32.309718, 35.112541),
                  builder: (ctx) => Container(
                    child: Container(
                      child: Icon(
                        Icons.location_on,
                        color: Colors.blueAccent,
                        size: 40,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}