import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:waygo/api/api_url.dart';
import 'package:waygo/controllers/local_storage.dart';
import 'package:waygo/model/api_service.dart';
import 'package:waygo/model/customer.dart';
import 'package:waygo/model/user_model.dart';
import 'package:waygo/model/utiles/colors.dart';
import 'dart:convert';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? user = LocalStorage.getString('username');

  bool isEditing = false;
  late TextEditingController phoneNumberController;
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController fatherNameController;
  late TextEditingController motherNameController;
  late TextEditingController genderController;
  late TextEditingController issController;
  String? controler = LocalStorage.getString("user");

  @override
  void initState() {
    dynamic json = jsonDecode(controler!);
    Customer customer = Customer.fromJson(json["profile"]);
    super.initState();
    // Initialize text editing controllers with user data.
    firstNameController = TextEditingController(text: customer.firstName);
    lastNameController = TextEditingController(text: customer.lastName);
    fatherNameController = TextEditingController(text: customer.fatherName);
    motherNameController = TextEditingController(text: customer.motherName);
    genderController = TextEditingController(text: customer.gender);
    issController = TextEditingController(text: customer.iss);
  }

  @override
  void dispose() {
    // Dispose of text editing controllers when done.
    firstNameController.dispose();
    lastNameController.dispose();
    fatherNameController.dispose();
    motherNameController.dispose();
    genderController.dispose();
    issController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    dynamic json = jsonDecode(controler!);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: UltColor.blue,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Profile',
          style: TextStyle(
              fontFamily: 'Quicksand',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: UltColor.green),
        ),
        actions: [
          IconButton(
            icon: Icon(isEditing ? Icons.check : Icons.edit),
            onPressed: isEditing
                ? () async {
                  final response = await ApiService.updateProfile(
                    phoneNumber:json["profile"]["phoneNumber"],
                    firstName:firstNameController.text,
                    lastName:lastNameController.text,
                    fatherName:fatherNameController.text,
                    motherName:motherNameController.text,
                    gender:genderController.text,
                    iss:issController.text
                  );
                  if(response.statusCode ==200){
                    json["profile"]["firstName"] = firstNameController.text;
                    json["profile"]["lastName"] = lastNameController.text;
                    json["profile"]["fatherName"] = fatherNameController.text;
                    json["profile"]["motherName"] = motherNameController.text;
                    json["profile"]["gander"] = genderController.text;
                    json["profile"]["iss"] = issController.text;
                    UserModel user = UserModel.fromJson(json);
                    await LocalStorage.setString(
                      'user',
                      jsonEncode(user.toJson()),
                    );}
                  //   else if (response.statusCode !=200){
                  //   Fluttertoast.showToast(
                  //                     msg: "Sorry, chick your internet connection",
                  //                     toastLength: Toast.LENGTH_SHORT,
                  //                     gravity: ToastGravity.BOTTOM,
                  //                     backgroundColor: UltColor.green,
                  //                     textColor: Colors.white,
                  //                     fontSize: 16.0);
                  // }
                    setState(() {
                      isEditing = !isEditing;
                    });
                  }
                : () {
                  Fluttertoast.showToast(
                                      msg: "Sorry, chick your internet connection",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      backgroundColor: UltColor.green,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                    setState(() {
                      isEditing = !isEditing;
                    });
                  },
          ),
        ],
      ),
      body: ListView(
        children: [
          Center(
              child: Container(
            color: UltColor.blue,
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.25,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: UltColor.green,
                    child: const Icon(
                      Icons.person,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    '${json["profile"]["firstName"]} ${json["profile"]["lastName"]}',
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Quicksand'),
                  ),
                  Text(
                    "${json["profile"]["phoneNumber"]}",
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Quicksand',
                        fontSize: 18),
                  )
                ],
              ),
            ),
          ),
          ),
          SizedBox(
            child: Text("${json["profile"]["phoneNumber"]}",style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Quicksand',
                        fontSize: 18)),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: firstNameController,
                  readOnly: !isEditing,
                  decoration: const InputDecoration(labelText: 'First Name'),
                ),
                TextFormField(
                  controller: lastNameController,
                  readOnly: !isEditing,
                  decoration: const InputDecoration(labelText: 'Last Name'),
                ),
                TextFormField(
                  controller: fatherNameController,
                  readOnly: !isEditing,
                  decoration: const InputDecoration(labelText: 'Father Name'),
                ),
                TextFormField(
                  controller: motherNameController,
                  readOnly: !isEditing,
                  decoration: const InputDecoration(labelText: 'Mother Name'),
                ),
                TextFormField(
                  controller: genderController,
                  readOnly: !isEditing,
                  decoration: const InputDecoration(labelText: 'Gender'),
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: issController,
                  readOnly: !isEditing,
                  decoration: const InputDecoration(labelText: 'ISS'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
