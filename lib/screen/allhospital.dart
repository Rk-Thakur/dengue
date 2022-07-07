import 'package:dengue/provider/crudprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllHospital extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink,
        body: SafeArea(child: Consumer(
          builder: (context, ref, child) {
            final hospitalStream = ref.watch(hospitalProvider);
            return Column(
              children: [
                Container(
                  child: hospitalStream.when(
                      data: (data) {
                        // return ListView.builder(
                        //     itemCount: data.length,
                        //     itemBuilder: (context, index) {
                        //       final dat = data[index];
                        //       return ListTile(
                        //         title: Text(dat.hospital_name),
                        //         subtitle: Text(dat.hospital_number.toString()),
                        //       );
                        //     });
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 15, right: 15, bottom: 0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  children: [
                                    Card(
                                      elevation: 5,
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(7.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Civil Hospital',
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    "+977-9810209060",
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              InkWell(
                                                onTap: () async {
                                                  FlutterPhoneDirectCaller
                                                      .callNumber('9810209060');
                                                },
                                                child: CircleAvatar(
                                                  backgroundColor:
                                                      Color(0xffFDA65D),
                                                  radius: 23,
                                                  child: Icon(
                                                    Icons.phone,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Card(
                                      elevation: 5,
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(7.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Bir Hospital',
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    "+977-9810209060",
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              CircleAvatar(
                                                backgroundColor:
                                                    Color(0xffFDA65D),
                                                radius: 23,
                                                child: Icon(
                                                  Icons.phone,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Card(
                                      elevation: 5,
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(7.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'KMC Hospital',
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    "+977-9810209060",
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              InkWell(
                                                onTap: () {},
                                                child: CircleAvatar(
                                                  backgroundColor:
                                                      Color(0xffFDA65D),
                                                  radius: 23,
                                                  child: Icon(
                                                    Icons.phone,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      error: (err, stack) => Text("$err"),
                      loading: () => Center(
                          child: CircularProgressIndicator(color: Colors.red))),
                )
              ],
            );
          },
        )));
  }
}
