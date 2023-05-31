// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';
// import 'package:syncfusion_flutter_maps/maps.dart';
// void main() {
//   runApp(MaterialApp(
//     title: 'Flutter OpenStreetMap',
//     home: MyMap(),
//   ));
// }

// class MyMap extends StatefulWidget {
//   @override
//   _MyMapState createState() => _MyMapState();
// }

// class _MyMapState extends State<MyMap> {
//   late MapController mapController;

//   @override
//   void initState() {
//     super.initState();
//     mapController = MapController();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Map Example'),
//       ),
//       body: GestureDetector(
//         onTapUp: (TapUpDetails details) {
//           final RenderBox renderBox = context.findRenderObject() as RenderBox;
//           final localPosition = renderBox.globalToLocal(details.globalPosition);
//           final latLng = mapController
//               .pixelToLatLng(
//                   Offset(localPosition.dx, localPosition.dy).round())
//               .round();
//           print("Pressed coordinates: ${latLng.latitude}, ${latLng.longitude}");
//         },
//         child: FlutterMap(
//           options: MapOptions(
//             controller: mapController,
//           ),
//           layers: [
//             TileLayerOptions(
//               urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
//               subdomains: ['a', 'b', 'c'],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
