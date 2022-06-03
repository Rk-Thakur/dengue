import 'dart:io';

import 'package:dengue/provider/authprovider.dart';
import 'package:dengue/provider/image_provider.dart';
import 'package:dengue/provider/loginprovider.dart';
import 'package:dengue/screen/forgetpassword.dart';
import 'package:dengue/screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:lottie/lottie.dart';

class login_screen extends StatelessWidget {
  final userNameController = TextEditingController();
  final mailController = TextEditingController();
  final passController = TextEditingController();

  final _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: SafeArea(
        child: Scaffold(body: Consumer(builder: (context, ref, child) {
          final isLogin = ref.watch(loginProvider);
          final db = ref.watch(imageProvider);
          final isLoading = ref.watch(loadingProvider);
          return SingleChildScrollView(
            child: Form(
              key: _form,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 55,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "DENG",
                            style: TextStyle(
                              color: Color(0xffE26A2C),
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
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Align(
                        alignment:
                            isLogin ? Alignment.center : Alignment.topLeft,
                        child: Text(
                          isLogin ? 'Welcome ' : 'Sign Up Form',
                          style: TextStyle(
                            fontSize: isLogin ? 35 : 25,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 20, 20, 20),
                          ),
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    if (!isLogin)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: TextFormField(
                          controller: userNameController,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 239, 235, 234),
                                    width: 2.0),
                              ),
                              labelText: "Username",
                              prefixIcon: Icon(
                                FontAwesomeIcons.user,
                                size: 15,
                              ),
                              hintText: 'Username',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                    if (!isLogin)
                      InkWell(
                        onTap: () {
                          ref.read(imageProvider).getImage();
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Container(
                            height: 200,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black26,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: db.image == null
                                ? Center(
                                    // child: Text('Please Select an image'),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.fileImage,
                                          size: 50,
                                          color: Colors.grey,
                                        ),
                                        Text(
                                          "Please Select Image",
                                          style: TextStyle(
                                            fontSize: 15,
                                            height: 4,
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (email) {
                          if (email == null || email.isEmpty) {
                            return 'Enter valid email';
                          }
                          return null;
                        },
                        controller: mailController,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                color: Color(0xffE26A2C), width: 2.0),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: "Email",
                          prefixIcon: Icon(
                            FontAwesomeIcons.at,
                            size: 15,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is Required!!';
                          }
                          return null;
                        },
                        controller: passController,
                        obscureText: true,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                color: Color(0xffE26A2C), width: 2.0),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: 'Password',
                          prefixIcon: Icon(
                            Icons.lock,
                            size: 15,
                          ),
                          alignLabelWithHint: true,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    if (isLogin)
                      InkWell(
                        onTap: () {
                          Get.to(() => forgetPassword());
                        },
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            'Forget Password?',
                            style: TextStyle(
                              color: Color(0xffE26A2C),
                            ),
                          ),
                        ),
                      ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 45,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30)),
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xffE26A2C))),
                          onPressed: () async {
                            _form.currentState!.save();
                            // ref.read(loadingProvider.notifier).toogle();
                            FocusScope.of(context).unfocus();
                            _form.currentState!.validate();
                            if (isLogin) {
                              final response = ref
                                  .read(loginsignProvider)
                                  .Login(
                                      email: mailController.text.trim(),
                                      password: passController.text.trim());
                              if (response != 'success') {
                                ref.read(loadingProvider.notifier).toogle();
                                Get.showSnackbar(GetSnackBar(
                                  title: 'Got some error',
                                  duration: Duration(seconds: 1),
                                  message: 'Please Confirm Your Id Password',
                                ));
                              }
                            } else {
                              if (db.image == null) {
                                Get.defaultDialog(
                                    title: 'Please Provide a Image',
                                    content: Text('Image must be Select'));
                              } else {
                                ref.read(loginsignProvider).signUp(
                                    email: mailController.text.trim(),
                                    password: passController.text.trim(),
                                    userName: userNameController.text.trim(),
                                    image: db.image!);
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
                                  'Submit',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.5,
                                  ),
                                ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    if (isLogin)
                      Center(
                        child: Container(
                          width: 30,
                          height: 30,
                          child: Center(
                              child: Text(
                            "OR",
                            style: TextStyle(
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          )),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 163, 160, 160),
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                        ),
                      ),
                    SizedBox(
                      height: 10,
                    ),
                    if (isLogin)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 45,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: SignInButton(
                            Buttons.Google,
                            onPressed: () {},
                          ),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(isLogin
                              ? 'New to Logistics?'
                              : 'Joined Us Before?'),
                          TextButton(
                              style: ButtonStyle(
                                  foregroundColor: MaterialStateProperty.all(
                                      Color(0xffE26A2C))),
                              onPressed: () {
                                ref.read(loginProvider.notifier).toogle();
                              },
                              child: Text(isLogin ? 'SignUp' : 'Login')),
                          // TextButton(
                          //   onPressed: () {
                          //     if (customermailController.text.isNotEmpty) {
                          //       ref.read(logSignProvider).ResetPassword(
                          //           customermailController.text.trim());
                          //     } else {
                          //       Get.showSnackbar(GetSnackBar(
                          //         title: 'Email not provided',
                          //         duration: Duration(seconds: 1),
                          //         message: 'Please Provide the email',
                          //       ));
                          //     }
                          //   },
                          //   child: Text(isLogin ? 'Forget' : ''),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        })),
      ),
    );
  }
}
