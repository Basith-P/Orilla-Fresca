import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const LatLng srcLoc = LatLng(42.7477863, -71.1699932);
const LatLng destLoc = LatLng(42.743902, -71.170009);
const double camZoomVal = 16.0;
const double camTiltVal = 80.0;
const double camBearingVal = 30.0;

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Completer<GoogleMapController> _controller = Completer();
  late final BitmapDescriptor sourceIcon;
  late final BitmapDescriptor destinationIcon;
  final Set<Marker> _markers = {};

  final LatLng _currentPos = LatLng(srcLoc.latitude, srcLoc.longitude);
  final LatLng _destPos = LatLng(destLoc.latitude, destLoc.longitude);

  @override
  void initState() {
    setSrcAndDestMarkerIcons();
    super.initState();
  }

  void setSrcAndDestMarkerIcons() async {
    sourceIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(devicePixelRatio: 2.0),
      'assets/imgs/source_pin.png',
    );
    destinationIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(devicePixelRatio: 2.0),
      'assets/imgs/destination_pin.png',
    );
  }

  @override
  Widget build(BuildContext context) {
    CameraPosition initialCameraPosition = CameraPosition(
      target: _currentPos,
      zoom: camZoomVal,
      tilt: camTiltVal,
      bearing: camBearingVal,
    );
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: initialCameraPosition,
      ),
    );
  }
}
