import 'dart:io';

import 'package:dengue/provider/crudprovider.dart';
import 'package:dengue/provider/image_provider.dart';
import 'package:dengue/provider/loginprovider.dart';
import 'package:dengue/screen/allhospital.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:phonenumbers/phonenumbers.dart';

class Hospital extends StatelessWidget {
  final hospitalnumber = TextEditingController();
  final hospitalname = TextEditingController();
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(body: Consumer(builder: (context, ref, child) {
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
                      'assets/images/hospital.json',
                      height: 300,
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
                            'Hospital Details',
                            style: TextStyle(
                              fontSize: 25,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(() => AllHospital(),
                                transition: Transition.leftToRight);
                          },
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Icon(
                              Icons.arrow_right,
                              size: 30,
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
                  TextFormField(
                    controller: hospitalname,
                    keyboardType: TextInputType.text,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Hospital name is   required';
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: 'Hospital Name',
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                        hintText: 'Hospital Name ',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: hospitalnumber,
                    keyboardType: TextInputType.number,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Hospital Number  is required';
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: 'Hospital Number',
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                        hintText: 'Hospital Number',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () async {
                      _form.currentState!.save();
                      FocusScope.of(context).unfocus();
                      _form.currentState!.validate();
                      final response = await ref
                          .read(crudProvider)
                          .addhospitaldetails(
                              name: hospitalname.text.trim(),
                              number: int.parse(hospitalnumber.text));

                      if (response == 'success') {
                        Navigator.of(context).pop();
                      }
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.09,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xffe26a2c),
                      ),
                      child: Center(
                        child: Text(
                          "Add Hospital Details",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      );
    })));
  }
}
