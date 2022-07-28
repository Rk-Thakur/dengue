import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

import 'package:geolocator/geolocator.dart';

class redirectpage extends StatefulWidget {
  late double lat;
  late double long;
  late double destination_lat;
  late double destination_long;
  redirectpage(
      this.lat, this.long, this.destination_lat, this.destination_long);
  @override
  State<redirectpage> createState() => _redirectpageState();
}

class _redirectpageState extends State<redirectpage> {
  Completer<GoogleMapController> _controller = Completer();

  Set<Marker> marker = {};

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  //for customize of the map
  BitmapDescriptor? mapMarker;

  void _onMapCreate(GoogleMapController controller) {
    setState(() {
      marker.add(Marker(
          position: LatLng(widget.lat, widget.long),
          // icon: mapMarker!,
          infoWindow:
              InfoWindow(title: 'Mosquito', snippet: 'Dengue Detected???'),
          markerId: MarkerId('id_1')));
    });
  }

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  LocationPermission? locationPermission;
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();

  _addPolyLine() {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id, color: Colors.pink, points: polylineCoordinates);
    polylines[id] = polyline;
    setState(() {});
  }

  _getPolyline() async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        'AIzaSyCx7g7W9UfYj5tA5DYuWq9d6asEFLGpXQw',
        PointLatLng(widget.lat, widget.long),
        PointLatLng(widget.destination_lat, widget.destination_long),
        travelMode: TravelMode.driving);
    // wayPoints: [PolylineWayPoint(location: "Sabo, Yaba Lagos Nigeria")]);
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
    _addPolyLine();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 15, left: 15, bottom: 15, right: 15),
            child: Container(
              width: double.infinity,
              height: 625,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Color(0xffe26a2c),
                  )),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: GoogleMap(
                  polylines: Set<Polyline>.of(polylines.values),
                  markers: marker,
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(
                      target: LatLng(widget.lat, widget.long), zoom: 14.47),
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                    _onMapCreate(controller);
                    _getPolyline();
                  },
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
