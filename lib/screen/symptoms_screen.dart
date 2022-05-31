import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class symptoms_screen extends StatefulWidget {
  const symptoms_screen({Key? key}) : super(key: key);

  @override
  State<symptoms_screen> createState() => _symptoms_screenState();
}

// Text(fever == null ? "Null" : fever),

class _symptoms_screenState extends State<symptoms_screen> {
  var fever,
      headache,
      eyepain,
      joinpain,
      musclepain,
      skinrash,
      mildbleeding,
      nausea,
      vomiting,
      joingswelling;

  late String check;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Let's Check Dengue,",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 170,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Fever",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              child: Row(
                                children: [
                                  GFRadio(
                                      type: GFRadioType.blunt,
                                      size: GFSize.LARGE,
                                      activeBorderColor: Color(0xffe26a2c),
                                      value: "Yes",
                                      groupValue: fever,
                                      onChanged: (value) {
                                        setState(() {
                                          fever = value;
                                        });
                                      },
                                      inactiveIcon: null,
                                      customBgColor: Color(0xffe26a2c)),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Yes"),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  GFRadio(
                                      type: GFRadioType.blunt,
                                      size: GFSize.LARGE,
                                      activeBorderColor: Color(0xffe26a2c),
                                      value: "No",
                                      groupValue: fever,
                                      onChanged: (value) {
                                        setState(() {
                                          fever = value;
                                        });
                                      },
                                      inactiveIcon: null,
                                      customBgColor: Color(0xffe26a2c)),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("No"),
                                  SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Headache",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              child: Row(
                                children: [
                                  GFRadio(
                                      type: GFRadioType.blunt,
                                      size: GFSize.LARGE,
                                      activeBorderColor: Color(0xffe26a2c),
                                      value: "Yes",
                                      groupValue: headache,
                                      onChanged: (value) {
                                        setState(() {
                                          headache = value;
                                        });
                                      },
                                      inactiveIcon: null,
                                      customBgColor: Color(0xffe26a2c)),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Yes"),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  GFRadio(
                                      type: GFRadioType.blunt,
                                      size: GFSize.LARGE,
                                      activeBorderColor: Color(0xffe26a2c),
                                      value: "No",
                                      groupValue: headache,
                                      onChanged: (value) {
                                        setState(() {
                                          headache = value;
                                        });
                                      },
                                      inactiveIcon: null,
                                      customBgColor: Color(0xffe26a2c)),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("No"),
                                  SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Eye Pain",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              child: Row(
                                children: [
                                  GFRadio(
                                      type: GFRadioType.blunt,
                                      size: GFSize.LARGE,
                                      activeBorderColor: Color(0xffe26a2c),
                                      value: "Yes",
                                      groupValue: eyepain,
                                      onChanged: (value) {
                                        setState(() {
                                          eyepain = value;
                                        });
                                      },
                                      inactiveIcon: null,
                                      customBgColor: Color(0xffe26a2c)),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Yes"),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  GFRadio(
                                      type: GFRadioType.blunt,
                                      size: GFSize.LARGE,
                                      activeBorderColor: Color(0xffe26a2c),
                                      value: "No",
                                      groupValue: eyepain,
                                      onChanged: (value) {
                                        setState(() {
                                          eyepain = value;
                                        });
                                      },
                                      inactiveIcon: null,
                                      customBgColor: Color(0xffe26a2c)),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("No"),
                                  SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Joint Pain",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              child: Row(
                                children: [
                                  GFRadio(
                                      type: GFRadioType.blunt,
                                      size: GFSize.LARGE,
                                      activeBorderColor: Color(0xffe26a2c),
                                      value: "Yes",
                                      groupValue: joinpain,
                                      onChanged: (value) {
                                        setState(() {
                                          joinpain = value;
                                        });
                                      },
                                      inactiveIcon: null,
                                      customBgColor: Color(0xffe26a2c)),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Yes"),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  GFRadio(
                                      type: GFRadioType.blunt,
                                      size: GFSize.LARGE,
                                      activeBorderColor: Color(0xffe26a2c),
                                      value: "No",
                                      groupValue: joinpain,
                                      onChanged: (value) {
                                        setState(() {
                                          joinpain = value;
                                        });
                                      },
                                      inactiveIcon: null,
                                      customBgColor: Color(0xffe26a2c)),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("No"),
                                  SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Muscle Pain",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              child: Row(
                                children: [
                                  GFRadio(
                                      type: GFRadioType.blunt,
                                      size: GFSize.LARGE,
                                      activeBorderColor: Color(0xffe26a2c),
                                      value: "Yes",
                                      groupValue: musclepain,
                                      onChanged: (value) {
                                        setState(() {
                                          musclepain = value;
                                        });
                                      },
                                      inactiveIcon: null,
                                      customBgColor: Color(0xffe26a2c)),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Yes"),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  GFRadio(
                                      type: GFRadioType.blunt,
                                      size: GFSize.LARGE,
                                      activeBorderColor: Color(0xffe26a2c),
                                      value: "No",
                                      groupValue: musclepain,
                                      onChanged: (value) {
                                        setState(() {
                                          musclepain = value;
                                        });
                                      },
                                      inactiveIcon: null,
                                      customBgColor: Color(0xffe26a2c)),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("No"),
                                  SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Skin Rash",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              child: Row(
                                children: [
                                  GFRadio(
                                      type: GFRadioType.blunt,
                                      size: GFSize.LARGE,
                                      activeBorderColor: Color(0xffe26a2c),
                                      value: "Yes",
                                      groupValue: skinrash,
                                      onChanged: (value) {
                                        setState(() {
                                          skinrash = value;
                                        });
                                      },
                                      inactiveIcon: null,
                                      customBgColor: Color(0xffe26a2c)),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Yes"),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  GFRadio(
                                      type: GFRadioType.blunt,
                                      size: GFSize.LARGE,
                                      activeBorderColor: Color(0xffe26a2c),
                                      value: "No",
                                      groupValue: skinrash,
                                      onChanged: (value) {
                                        setState(() {
                                          skinrash = value;
                                        });
                                      },
                                      inactiveIcon: null,
                                      customBgColor: Color(0xffe26a2c)),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("No"),
                                  SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Nausea",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              child: Row(
                                children: [
                                  GFRadio(
                                      type: GFRadioType.blunt,
                                      size: GFSize.LARGE,
                                      activeBorderColor: Color(0xffe26a2c),
                                      value: "Yes",
                                      groupValue: nausea,
                                      onChanged: (value) {
                                        setState(() {
                                          nausea = value;
                                        });
                                      },
                                      inactiveIcon: null,
                                      customBgColor: Color(0xffe26a2c)),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Yes"),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  GFRadio(
                                      type: GFRadioType.blunt,
                                      size: GFSize.LARGE,
                                      activeBorderColor: Color(0xffe26a2c),
                                      value: "No",
                                      groupValue: nausea,
                                      onChanged: (value) {
                                        setState(() {
                                          nausea = value;
                                        });
                                      },
                                      inactiveIcon: null,
                                      customBgColor: Color(0xffe26a2c)),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("No"),
                                  SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Vomiting",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              child: Row(
                                children: [
                                  GFRadio(
                                      type: GFRadioType.blunt,
                                      size: GFSize.LARGE,
                                      activeBorderColor: Color(0xffe26a2c),
                                      value: "Yes",
                                      groupValue: vomiting,
                                      onChanged: (value) {
                                        setState(() {
                                          vomiting = value;
                                        });
                                      },
                                      inactiveIcon: null,
                                      customBgColor: Color(0xffe26a2c)),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Yes"),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  GFRadio(
                                      type: GFRadioType.blunt,
                                      size: GFSize.LARGE,
                                      activeBorderColor: Color(0xffe26a2c),
                                      value: "No",
                                      groupValue: vomiting,
                                      onChanged: (value) {
                                        setState(() {
                                          vomiting = value;
                                        });
                                      },
                                      inactiveIcon: null,
                                      customBgColor: Color(0xffe26a2c)),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("No"),
                                  SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.09,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffe26a2c),
                  ),
                  child: Center(
                    child: Text(
                      "Dengue or Not?",
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
        ),
      ),
    );
  }
}
