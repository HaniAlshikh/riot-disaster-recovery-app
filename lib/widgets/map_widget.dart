import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();
  Map<MarkerId, Marker> _clustersMarkers = <MarkerId, Marker>{};
  Map<CircleId, Circle> _clustersCircles = <CircleId, Circle>{};

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          _getCircles();
        },
      markers: Set<Marker>.of(_clustersMarkers.values),
      circles: Set<Circle>.of(_clustersCircles.values),
      );
    //   floatingActionButton: FloatingActionButton.extended(
    //     onPressed: _goToTheLake,
    //     label: Text('To the lake!'),
    //     icon: Icon(Icons.directions_boat),
    //   ),
    // );
  }

  _getCircles() {
    setState(() {
          CircleId circleId = CircleId("TestC");
          _addClusterCircle(LatLng(37.42796133580664, -122.085749655962), circleId);
        });
  }

  Future _addClusterMarker(LatLng center) async {
    setState(() {
      MarkerId markerId = MarkerId("TestM");
        Marker marker = Marker(
            markerId: markerId,
            position: center,
            draggable: true,
            consumeTapEvents: true,
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueCyan),
            onTap: () {
              // _changeMarkerAndCircleType(
              //     center, CircleId(markerId.value.toString()), _activeCircle);
            });
        _clustersMarkers[markerId] = marker;
      });
  }

  Future _addClusterCircle(LatLng center, CircleId circleId) async {
    setState(() {
      _addClusterMarker(center);
      CircleId circleId = CircleId("TestC2");
        Circle circle = Circle(
            circleId: circleId,
            center: center,
            radius: 800,
            fillColor: Colors.cyan.withOpacity(0.3),
            strokeWidth: 3,
            consumeTapEvents: true,
            onTap: () {
              // _changeMarkerAndCircleType(center, circleId, _activeCircle);
            });
        _clustersCircles[circleId] = circle;
      // } else {
      //   Circle circle = Circle(
      //       circleId: circleId,
      //       center: center,
      //       radius: 800,
      //       fillColor: Colors.red.withOpacity(0.3),
      //       strokeWidth: 3);
      //   _clustersCircles[circleId] = circle;
      //   _activeCircle = circleId;
      // }
    });
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}