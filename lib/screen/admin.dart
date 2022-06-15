import 'package:dengue/screen/addpost.dart';
import 'package:dengue/screen/alarm.dart';
import 'package:dengue/screen/hospital.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class admin extends StatefulWidget {
  @override
  State<admin> createState() => _adminState();
}

class _adminState extends State<admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 40, left: 15, bottom: 0, right: 15),
          child: Column(
            children: [
              Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Card(
                            elevation: 5,
                            child: Container(
                              height: 130,
                              width: 140,
                              child: Column(
                                children: [
                                  Container(
                                    height: 90,
                                    width: 100,
                                    child: Lottie.asset(
                                      'assets/images/knowledge.json',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Knowledge',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              Get.to(() => Alarm(),
                                  transition: Transition.fade);
                            });
                          },
                          child: Card(
                            elevation: 5,
                            child: Container(
                              height: 130,
                              width: 140,
                              child: Column(
                                children: [
                                  Container(
                                    height: 100,
                                    width: 120,
                                    child: Lottie.asset(
                                      'assets/images/alarm.json',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Text(
                                    'Alarm Alert',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Card(
                            elevation: 5,
                            child: Container(
                              height: 130,
                              width: 140,
                              child: Column(
                                children: [
                                  Container(
                                    height: 90,
                                    width: 100,
                                    child: Lottie.asset(
                                      'assets/images/mosquito.json',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Case Reporting',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Card(
                            elevation: 5,
                            child: Container(
                              height: 130,
                              width: 140,
                              child: Column(
                                children: [
                                  Container(
                                    height: 100,
                                    width: 120,
                                    child: Lottie.asset(
                                      'assets/images/warning.json',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Text(
                                    'Warning',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              Get.to(() => AddPost(),
                                  transition: Transition.leftToRight);
                            });
                          },
                          child: Card(
                            elevation: 5,
                            child: Container(
                              height: 130,
                              width: 140,
                              child: Column(
                                children: [
                                  Container(
                                    height: 90,
                                    width: 100,
                                    child: Lottie.asset(
                                      'assets/images/community.json',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Community',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              Get.to(() => Hospital(),
                                  transition: Transition.downToUp);
                            });
                          },
                          child: Card(
                            elevation: 5,
                            child: Container(
                              height: 130,
                              width: 140,
                              child: Column(
                                children: [
                                  Container(
                                    height: 100,
                                    width: 120,
                                    child: Lottie.asset(
                                      'assets/images/hospital.json',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Text(
                                    'Hospital',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
