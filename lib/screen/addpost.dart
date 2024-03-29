import 'dart:io';

import 'package:dengue/provider/crudprovider.dart';
import 'package:dengue/provider/image_provider.dart';
import 'package:dengue/provider/loginprovider.dart';
import 'package:dengue/screen/allevent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/route_manager.dart';
import 'package:lottie/lottie.dart';

class AddPost extends StatelessWidget {
  final eventDescription = TextEditingController();
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(body: Consumer(builder: (context, ref, child) {
      final db = ref.watch(imageProvider);
      final isLoading = ref.watch(loadingProvider);
      return SingleChildScrollView(
        child: Form(
            key: _form,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Card(
                    elevation: .6,
                    child: Lottie.asset(
                      'assets/images/community.json',
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 15, left: 15, bottom: 0, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Events & Campaign',
                            style: TextStyle(
                              fontSize: 20,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(() => AllEvent(),
                                transition: Transition.leftToRightWithFade);
                          },
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Icon(
                              Icons.arrow_right,
                              size: 25,
                              color: Color(0xffe26a2c),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      ref.read(imageProvider).getImage();
                    },
                    child: Container(
                        height: 300,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black26,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: db.image == null
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                              )
                            : Image.file(
                                File(db.image!.path),
                                fit: BoxFit.fill,
                              )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: eventDescription,
                    keyboardType: TextInputType.multiline,
                    maxLines: 10,
                    minLines: 1,
                    textCapitalization: TextCapitalization.sentences,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'description is required';
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                        hintText: 'Description',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.09,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffe26a2c),
                      ),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xffe26a2c))),
                          onPressed: () async {
                            _form.currentState!.save();
                            FocusScope.of(context).unfocus();
                            _form.currentState!.validate();
                            if (db.image == null) {
                              Get.dialog(AlertDialog(
                                title:
                                    Text("Please Provide the quality images"),
                                actions: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    icon: Icon(Icons.close),
                                  )
                                ],
                              ));
                            } else {
                              final response = await ref
                                  .read(crudProvider)
                                  .addpost(
                                    image: db.image!,
                                    description: eventDescription.text.trim(),
                                  );
                              if (response == 'success') {
                                Navigator.pop(context);
                              }
                            }
                          },
                          child: Text(
                            "Add",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                            ),
                          ))),
                ],
              ),
            )),
      );
    })));
  }
}
