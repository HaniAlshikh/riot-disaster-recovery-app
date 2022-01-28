import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsWidget extends StatefulWidget {
  const GoogleMapsWidget({Key? key}) : super(key: key);

  @override
  State<GoogleMapsWidget> createState() => GoogleMapsWidgetState();
}

// TODO: refactor me if still needed
class GoogleMapsWidgetState extends State<GoogleMapsWidget> {
  final Completer<GoogleMapController> _controller = Completer();
  final Map<MarkerId, Marker> _clustersMarkers = <MarkerId, Marker>{};
  final Map<CircleId, Circle> _clustersCircles = <CircleId, Circle>{};
  final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(53.557030, 10.023090),
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
          _addClusterCircle(LatLng(53.557030, 10.023090), CircleId("TestC"));
          _addClusterCircle(LatLng(53.570184, 10.025305), CircleId("Testb"));
          _addClusterCircle(LatLng(53.555910, 10.045575), CircleId("Testf"));
        });
  }

  Future _addClusterMarker(LatLng center, MarkerId markerid) async {
    setState(() {
        Marker marker = Marker(
            markerId: markerid,
            position: center,
            draggable: true,
            consumeTapEvents: true,
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueGreen),
            onTap: () {
              // _changeMarkerAndCircleType(
              //     center, CircleId(markerId.value.toString()), _activeCircle);
            });
        _clustersMarkers[marker.markerId] = marker;
      });
  }

  Future _addClusterCircle(LatLng center, CircleId circleId) async {
    setState(() {
      _addClusterMarker(center, MarkerId(circleId.value));
        Circle circle = Circle(
            circleId: circleId,
            center: center,
            radius: 800,
            fillColor: Colors.lightGreen.withOpacity(0.3),
            strokeColor: Colors.green,
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