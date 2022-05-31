import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

class Seetting extends StatefulWidget {
  @override
  State<Seetting> createState() => _SeettingState();
}

class _SeettingState extends State<Seetting> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              // color: Colors.red,
              ),
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
                        backgroundImage: AssetImage('assets/images/avatar.png'),
                      ),
                      Text(
                        "Ranjan Kumar Thakur",
                        style: TextStyle(
                          fontSize: 15,
                          letterSpacing: 3,
                          fontWeight: FontWeight.bold,
                          height: 2,
                        ),
                      ),
                      Text(
                        "tranjan638@gmail.com",
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
                                            fontWeight: FontWeight.bold,
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
                                    if (isSwitched == true) notify();

                                    if (isSwitched == true)
                                      Get.showSnackbar(GetSnackBar(
                                        title: "Notification ",
                                        duration: Duration(seconds: 2),
                                        message:
                                            'Notification Set for Cleaning Place',
                                      ));
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
                      Container(
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
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
        interval: 5,
        timeZone: timezon,
      )); //repeats:true time interval must be at least 60 if repeating
}
