import 'dart:ffi';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dengue/provider/authprovider.dart';
import 'package:dengue/provider/loginprovider.dart';
import 'package:dengue/screen/admin.dart';
import 'package:dengue/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Seetting extends StatefulWidget {
  @override
  State<Seetting> createState() => _SeettingState();
}

class _SeettingState extends State<Seetting> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: Consumer(builder: (context, ref, child) {
        final user = ref.watch(userStream);
        return Center(
            child: user.when(
                data: (data) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            child: Column(
                              children: [
                                GFAvatar(
                                  size: GFSize.MEDIUM,
                                  radius: 50,
                                  backgroundImage: CachedNetworkImageProvider(
                                      data.userImage),
                                ),
                                Text(
                                  data.userName,
                                  style: TextStyle(
                                    fontSize: 15,
                                    letterSpacing: 3,
                                    fontWeight: FontWeight.bold,
                                    height: 2,
                                  ),
                                ),
                                Text(
                                  data.email,
                                  style: TextStyle(
                                    fontSize: 10,
                                    letterSpacing: 2,
                                    fontWeight: FontWeight.w400,
                                    height: 2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            width: double.infinity,
                            height: 350,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                data.userId == 'pvdbT2Qob3VaoxUg8hfp23Lz8X32'
                                    ? InkWell(
                                        onTap: () => setState(() {
                                          Get.to(() => admin(),
                                              transition: Transition.fadeIn);
                                        }),
                                        child: Container(
                                          width: double.infinity,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color: Color(0xfffda65d),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons
                                                      .admin_panel_settings_sharp,
                                                  size: 28,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  "Admin DashBoard",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    : SizedBox(
                                        height: 10,
                                      ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 55,
                                  decoration: BoxDecoration(
                                    color: Color(0xfffda65d),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.notification_important,
                                          size: 28,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        isSwitched == true
                                            ? Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Notification",
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    "Reminder to Clean the place",
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      height: 1.7,
                                                    ),
                                                  )
                                                ],
                                              )
                                            : Text(
                                                "Notification",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                        SizedBox(
                                          width: isSwitched ? 55 : 110,
                                        ),
                                        Switch(
                                          value: isSwitched,
                                          onChanged: (value) {
                                            setState(() {
                                              isSwitched = value;
                                              print(isSwitched);

                                              //Notifications
                                              // isSwitched == true
                                              //     ? notify()
                                              //     : null;
                                              if (isSwitched == true) {
                                                notify();
                                              }
                                              isSwitched == true
                                                  ? Get.showSnackbar(
                                                      GetSnackBar(
                                                      title: "Notification ",
                                                      duration:
                                                          Duration(seconds: 2),
                                                      message:
                                                          'Notification Set for Cleaning Place',
                                                    ))
                                                  : null;
                                            });
                                          },
                                          activeTrackColor: Color(0xffE26A2C),
                                          activeColor: Color(0xffFFB243),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      ref.read(loginsignProvider).Logout();
                                      // ref.refresh(loadingProvider.notifier);
                                    });
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Color(0xfffda65d),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.logout,
                                            size: 28,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Logout",
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                error: (err, stack) => Text("${err}"),
                loading: () => Center(
                        child: CircularProgressIndicator(
                      color: Color(0xffe26a2c),
                    ))));
      })),
    );
  }

  void didChangedAppLifeCycleState(AppLifecycleState state) {
    var appInBackgroud = (state == AppLifecycleState.inactive);
    if (appInBackgroud) {
      notify();
    }
  }
}

void notify() async {
  String timezon = await AwesomeNotifications().getLocalTimeZoneIdentifier();
  await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 1,
        channelKey: 'notification',
        body: 'Did u clean ur place??',
      ),
      schedule: NotificationInterval(
        interval: 10, //second
        timeZone: timezon,
        // repeats:isSwitched
      )); //repeats:true time interval must be at least 60 if repeating
}
