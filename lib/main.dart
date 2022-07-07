import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:dengue/screen/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.black,
  ));

  //For the Notifications
  AwesomeNotifications().initialize(null, [
    NotificationChannel(
        channelKey: 'notification',
        channelName: 'Dengue Notification',
        channelDescription: "Dengue",
        ledColor: Color(0xffe26a2c),
        playSound: true,
        enableLights: true,
        enableVibration: true,
        defaultColor: Color(0xffe26a2c))
  ]);

  runApp(ProviderScope(child: myapp()));
  //for the preview viewer
  // runApp(DevicePreview(builder: (context) => ProviderScope(child: myapp())));
}

class myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      // theme: ThemeData(primaryColor: Color(0xffE26A2C)),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      home: splashScreen(),
    );
  }
}
