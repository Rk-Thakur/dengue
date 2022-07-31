import 'dart:async';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dengue/provider/crudprovider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:map_launcher/map_launcher.dart';

class reportcase extends StatefulWidget {
  @override
  State<reportcase> createState() => _reportcaseState();
}

class _reportcaseState extends State<reportcase> {
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
                                        final availableMap =
                                            await MapLauncher.installedMaps;
                                        print(availableMap);
                                        // await availableMap.first.showMarker(
                                        //     coords: Coords(response.latitude,
                                        //         response.longitude),
                                        //     title: 'response.lon');

                                        await availableMap.first.showDirections(
                                            destination:
                                                Coords(dat.lat, dat.long));
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
