import 'package:dengue/screen/chat.dart';
import 'package:dengue/screen/dashboard.dart';
import 'package:dengue/screen/denguedetection.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class main_Screen extends StatefulWidget {
  @override
  State<main_Screen> createState() => _main_ScreenState();
}

class _main_ScreenState extends State<main_Screen> {
  String thaukoname = '';
  int currentTab = 0;
  final List<Widget> screens = [
    dashboard(),
    Seetting(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = dashboard();
  LocationPermission? locationPermission;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
        body: PageStorage(
          bucket: bucket,
          child: currentScreen,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xffE26A2C),
          child: Lottie.asset('assets/images/mosquito.json'),
          onPressed: () async {
            locationPermission = await Geolocator.requestPermission();
            if (locationPermission == LocationPermission.denied) {
              locationPermission = await Geolocator.requestPermission();
            } else if (locationPermission == LocationPermission.deniedForever) {
              await Geolocator.openAppSettings();
            }
            if (locationPermission == LocationPermission.whileInUse ||
                locationPermission == LocationPermission.always) {
              final response = await Geolocator.getCurrentPosition();
              List<Placemark> placemarks = await placemarkFromCoordinates(
                  response.latitude, response.longitude);

              print(placemarks);
              Placemark place = placemarks[0];
              // String address = '${place.locality}/${place.subLocality}';
              Get.to(
                () => denguedetection(response.latitude, response.longitude,
                    place.locality.toString(), place.subLocality.toString()),
                transition: Transition.downToUp,
              );
            }
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          child: Container(
            decoration: BoxDecoration(
                color: Color(0xffFDA65D),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      currentScreen = dashboard();
                      currentTab = 0;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.houseUser,
                        size: 30,
                        color: currentTab == 0 ? Colors.white : Colors.grey,
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      currentScreen = Seetting();
                      currentTab = 1;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.userNinja,
                        size: 30,
                        color: currentTab == 1 ? Colors.white : Colors.grey,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
