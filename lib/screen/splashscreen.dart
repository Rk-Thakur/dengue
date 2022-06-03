import 'package:dengue/screen/login.dart';
import 'package:dengue/screen/statuscheck.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class splashScreen extends StatefulWidget {
  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  void initState() {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return StatusCheck();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(31, 29, 29, 29),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "DENG",
                    style: TextStyle(
                      color: Color(0xffE26A2C),
                      // fontFamily: 'font',
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      letterSpacing: .03,
                    ),
                  ),
                  CircleAvatar(
                    radius: 36,
                    backgroundColor: Color(0xffE26A2C),
                    child: LottieBuilder.asset(
                      'assets/images/mosquito.json',
                      width: 65,
                      height: 65,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
