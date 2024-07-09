import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:waygo/controllers/user_controller.dart';
import 'package:waygo/model/utiles/colors.dart';
import 'package:waygo/screens/base.dart';

class info extends StatefulWidget {
  final mobileNO;
  info({super.key, this.mobileNO});

  @override
  State<info> createState() => _infoState();
}

class _infoState extends State<info> {
  String selectedGender = "";
  final formKey = GlobalKey<FormState>();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final fatherName = TextEditingController();
  final motherName = TextEditingController();
  final iss = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * 0.60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: UltColor.blue,
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(150),
                              bottomRight: Radius.circular(150))),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: ListView(children: <Widget>[
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.04),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.08,
                            child: TextFormField(
                              controller: firstName,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter your first name";
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                hintText: 'First name',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                filled: true,
                                fillColor: Colors.grey[200],
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10.0),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.08,
                            child: TextFormField(
                              controller: lastName,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter your last name";
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                hintText: 'Last name',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                filled: true,
                                fillColor: Colors.grey[200],
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10.0),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.08,
                            child: TextFormField(
                              controller: fatherName,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter your father name";
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                hintText: 'Father name',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                filled: true,
                                fillColor: Colors.grey[200],
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10.0),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.08,
                            child: TextFormField(
                              controller: motherName,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter your mother name";
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                hintText: 'Mother name',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                filled: true,
                                fillColor: Colors.grey[200],
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10.0),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.084,
                            child: TextFormField(
                              maxLength: 11,
                              keyboardType: TextInputType.number,
                              controller: iss,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter your iss number";
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                hintText: 'ISS number',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                filled: true,
                                fillColor: Colors.grey[200],
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10.0),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Radio(
                                  value: "Male",
                                  groupValue: selectedGender,
                                  activeColor: UltColor.green,
                                  onChanged: ((value) {
                                    setState(() {
                                      selectedGender = value.toString();
                                    });
                                  })),
                              const Text(
                                "Male",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 23),
                              ),
                              Radio(
                                  value: "Female",
                                  groupValue: selectedGender,
                                  activeColor: UltColor.green,
                                  onChanged: ((value) {
                                    setState(() {
                                      selectedGender = value.toString();
                                    });
                                  })),
                              const Text(
                                "Female",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 23),
                              ),
                            ],
                          )
                        ]),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              margin: const EdgeInsets.only(right: 60.0),
                              child: Image.asset("assets/images/bus.png")),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.01),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: UltColor.green,
                                textStyle: const TextStyle(fontSize: 23),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                side: BorderSide(
                                    color: UltColor.green, width: 0.5),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 20.0,
                                  horizontal: 37.5,
                                ),
                              ),
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  debugPrint(widget.mobileNO);
                                  try {
                                    await Get.find<UserController>().register(
                                      firstName: firstName.text,
                                      lastName: lastName.text,
                                      fatherName: fatherName.text,
                                      motherName: motherName.text,
                                      iss: iss.text,
                                      gender: selectedGender,
                                      phoneNumber: widget.mobileNO,
                                    );
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const BaseScreen()),
                                      (route) => false,
                                    );
                                  } catch (e) {
                                    debugPrint("catch error : $e");
                                    FormHelper.showSimpleAlertDialog(
                                      context,
                                      "WayGo",
                                      "catch error $e",
                                      "OK",
                                      () {
                                        Navigator.pop(context);
                                      },
                                    );
                                  }
                                }
                              },
                              child: const Text(
                                "Enter >",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 23,
                                    fontFamily: 'Quicksand',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.68),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
