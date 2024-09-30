import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMaps extends StatefulWidget {
  const GoogleMaps({super.key});

  @override
  State<GoogleMaps> createState() => _GoogleMapsState();
}

class _GoogleMapsState extends State<GoogleMaps> {
  late CameraPosition _kGooglePlex;

  Position? _currentPosition;
  late GoogleMapController _googleMapController;

  @override
  void initState() {
    _kGooglePlex = CameraPosition(
      target: LatLng(27.1751, 78.0421),
      zoom: 14.4746,
    );
    super.initState();
  }

  final markerId = MarkerId("current_location");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () async {
        _currentPosition = await Geolocator.getLastKnownPosition();
        _googleMapController.animateCamera(CameraUpdate.newLatLng(LatLng(
            _currentPosition?.latitude ?? 0, _currentPosition?.longitude ?? 0)));
        _googleMapController.showMarkerInfoWindow(markerId);
        setState(() {

        });
      }),
      body: GoogleMap(
          onMapCreated: (controller) {
            _googleMapController = controller;
          },
          markers: {
            Marker(
                markerId: markerId,
                position: LatLng(_currentPosition?.latitude ?? 0,
                    _currentPosition?.longitude ?? 0))
          },
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex),
    );
  }
}
