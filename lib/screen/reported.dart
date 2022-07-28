import 'dart:async';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dengue/provider/crudprovider.dart';
import 'package:dengue/provider/image_provider.dart';
import 'package:dengue/provider/loginprovider.dart';
import 'package:dengue/screen/redirectoplace.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

class reportcase extends StatefulWidget {
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  State<reportcase> createState() => _reportcaseState();
}

class _reportcaseState extends State<reportcase> {
  LocationPermission? locationPermission;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer(builder: (context, ref, child) {
          final locationStream = ref.watch(locationProvider);

          return Padding(
            padding:
                const EdgeInsets.only(top: 30, left: 15, bottom: 0, right: 15),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Dengue Detected Place',
                    style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: locationStream.when(
                      data: (data) {
                        return ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              final dat = data[index];
                              return Card(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 400,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        width: double.infinity,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: CachedNetworkImage(
                                            placeholder: (context, String) {
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.pink,
                                                ),
                                              );
                                            },
                                            imageUrl: dat.image,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(dat.description)),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        locationPermission = await Geolocator
                                            .requestPermission();
                                        if (locationPermission ==
                                            LocationPermission.denied) {
                                          locationPermission = await Geolocator
                                              .requestPermission();
                                        } else if (locationPermission ==
                                            LocationPermission.deniedForever) {
                                          await Geolocator.openAppSettings();
                                        }
                                        if (locationPermission ==
                                                LocationPermission.whileInUse ||
                                            locationPermission ==
                                                LocationPermission.always) {
                                          final response = await Geolocator
                                              .getCurrentPosition();
                                          List<Placemark> placemarks =
                                              await placemarkFromCoordinates(
                                                  response.latitude,
                                                  response.longitude);

                                          print(placemarks);
                                          Placemark place = placemarks[0];

                                          // String address = '${place.locality}/${place.subLocality}';
                                          Get.to(
                                              () => redirectpage(
                                                  response.latitude,
                                                  response.longitude,
                                                  dat.lat,
                                                  dat.long),
                                              transition:
                                                  Transition.cupertinoDialog);
                                        }
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Align(
                                          alignment: Alignment.bottomRight,
                                          child: FaIcon(
                                            FontAwesomeIcons.mapMarked,
                                            color: Colors.amber,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                      },
                      error: (err, stack) => Text("$err"),
                      loading: () => Center(
                            child:
                                CircularProgressIndicator(color: Colors.purple),
                          )),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
