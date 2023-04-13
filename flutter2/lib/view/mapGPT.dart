import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';



class map1 extends StatefulWidget {
  @override
  _map1State createState() => _map1State();
}

class _map1State extends State<map1> {
  LocationData? _currentLocation;

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  Future<void> _getLocation() async {
    final location = Location();
    final status = await location.hasPermission();
    if (status == PermissionStatus.denied) {
      await location.requestPermission();
    }

    final currentLocation = await location.getLocation();
    setState(() {
      _currentLocation = currentLocation;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location Demo'),
      ),
      body: _currentLocation == null
          ? Center(child: CircularProgressIndicator())
          : FlutterMap(
        options: MapOptions(
          center: LatLng(
            _currentLocation!.latitude!,
            _currentLocation!.longitude!,
          ),
          zoom: 13.0,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayerOptions(
            markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(
                  _currentLocation!.latitude!,
                  _currentLocation!.longitude!,
                ),
                builder: (ctx) => Icon(
                  Icons.location_on,
                  color: Colors.red,
                  size: 50.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}