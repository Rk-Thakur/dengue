import 'dart:async';
import 'dart:io';

import 'package:dengue/provider/crudprovider.dart';
import 'package:dengue/provider/image_provider.dart';
import 'package:dengue/provider/loginprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

class denguedetection extends StatefulWidget {
  late double lat;
  late double long;
  late String locality;
  late String sublocality;
  denguedetection(this.lat, this.long, this.locality, this.sublocality);

  @override
  State<denguedetection> createState() => denguedetectionState();
}

class denguedetectionState extends State<denguedetection> {
  TextEditingController descriptionController = TextEditingController();
  Completer<GoogleMapController> _controller = Completer();

  Set<Marker> marker = {};

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  //for customize of the map
  BitmapDescriptor? mapMarker;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // setCustomMarker();
  }

//customize the map logo and size
  // void setCustomMarker() async {
  //   mapMarker = await BitmapDescriptor.fromAssetImage(
  //       ImageConfiguration(size: Size(10, 10)), 'assets/images/login.png');
  // }

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
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer(
          builder: (context, ref, child) {
            final db = ref.watch(imageProvider);

            final isLoading = ref.watch(loadingProvider);

            return SingleChildScrollView(
              child: Form(
                key: _form,
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 15, left: 15, bottom: 0, right: 15),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Dengue Detection",
                                style: TextStyle(
                                  fontSize: 20,
                                  letterSpacing: 2,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 15, left: 15, bottom: 0, right: 15),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          '${widget.locality},${widget.sublocality}',
                          style: TextStyle(
                            fontSize: 20,
                            letterSpacing: 2,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 15, left: 15, bottom: 0, right: 15),
                      child: Container(
                        width: double.infinity,
                        height: 500,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Color(0xffe26a2c),
                            )),
                        child: GoogleMap(
                          markers: marker,
                          mapType: MapType.normal,
                          initialCameraPosition: CameraPosition(
                              target: LatLng(widget.lat, widget.long),
                              zoom: 14.47),
                          onMapCreated: (GoogleMapController controller) {
                            _controller.complete(controller);
                            _onMapCreate(controller);
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 15, left: 15, bottom: 0, right: 15),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Photo",
                          style: TextStyle(
                            fontSize: 20,
                            letterSpacing: 2,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 15, left: 15, bottom: 0, right: 15),
                      child: Container(
                        width: double.infinity,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              ref.read(imageProvider).getImage();
                            });
                          },
                          child: Container(
                            width: double.infinity,
                            height: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Color(0xffe26a2c),
                              ),
                            ),
                            child: db.image == null
                                ? Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.image,
                                          size: 35,
                                          color: Colors.grey,
                                        ),
                                        Text(
                                          "Select Images",
                                          style: TextStyle(
                                            fontSize: 10,
                                            height: 2,
                                            color: Colors.grey,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                : Image.file(
                                    File(db.image!.path),
                                    fit: BoxFit.fill,
                                  ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 15, left: 15, bottom: 0, right: 15),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Description",
                          style: TextStyle(
                            fontSize: 20,
                            letterSpacing: 2,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 15, left: 15, bottom: 0, right: 15),
                      child: TextFormField(
                        controller: descriptionController,
                        maxLines: 10,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Description is Required";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Description',
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Color(0xffe26a2c),
                          )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Color(0xffe26a2c),
                                width: 2.0,
                              )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 15, left: 15, bottom: 0, right: 15),
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xffE26A2C))),
                            onPressed: () async {
                              _form.currentState!.save();
                              FocusScope.of(context).unfocus();
                              if (_form.currentState!.validate()) {
                                final response = ref
                                    .watch(crudProvider)
                                    .addDetectionArea(
                                        lat: widget.lat,
                                        long: widget.long,
                                        image: db.image!,
                                        description:
                                            descriptionController.text.trim());
                                if (response == 'success') {
                                  print('send done');
                                  Navigator.pop(context);
                                }
                              }
                            },
                            child: isLoading
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Is Loading Please Wait!!',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    ],
                                  )
                                : Text(
                                    "Submit",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.5,
                                    ),
                                  ),
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
