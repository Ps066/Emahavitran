import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(19.70605281658863, 72.78344872822629),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(19.757601299521536, 72.7568660525586),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
            "E-Maha",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),),
      ),
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: {
          Marker(
            markerId: const MarkerId("marker1"),
            infoWindow: InfoWindow(title: "MSEDCL(Mahavitran) Office"),
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
            position: const LatLng(19.757601299521536, 72.7568660525586),
            draggable: true,
            onDragEnd: (value) {
              // value is the new position
            },
            // To do: custom marker icon
          ),

          Marker(
            markerId: const MarkerId("marker2"),
            infoWindow: InfoWindow(title: "Your Current Location"),
            icon: BitmapDescriptor.defaultMarker,
            position: const LatLng(19.70605281658863, 72.78344872822629),
          ),
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('Nearest Mahavitran office'),
        icon: const Icon(Icons.electric_bolt),
      ),

    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}