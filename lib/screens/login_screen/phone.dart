import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:waygo/model/utiles/colors.dart';
import 'package:waygo/screens/login_screen/otp.dart';
import 'package:waygo/model/api_service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class phoneNumber extends StatefulWidget {
  const phoneNumber({super.key});

  @override
  State<phoneNumber> createState() => _phoneNumberState();
}

final myController = TextEditingController();

class _phoneNumberState extends State<phoneNumber> {
  String mobileNo = '';
  bool isAPICallProcess = false;
  String letMobile = '0';
  String? otpNumber;
  @override
  // void dispose() {
  //   // Clean up the controller when the widget is removed from the widget tree.
  //   // This also removes the _printLatestValue listener.
  //   myController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 0.61,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: UltColor.blue,
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(150),
                            bottomRight: Radius.circular(150))),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(children: <Widget>[
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05),
                        const Text("WayGo",
                            style:
                                TextStyle(color: Colors.white, fontSize: 30)),
                        Container(
                          padding: const EdgeInsets.all(20),
                          child: Image.asset(
                            "assets/images/phone.png",
                          ),
                        ),
                      ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text(
                            AppLocalizations.of(context)!.enterYourPhoneNumner,
                            style: TextStyle(color: UltColor.green),
                          ),
                          Directionality(
                            textDirection: TextDirection.ltr,
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 20.0,left: 15,right: 10),
                                    child: Icon(
                                      Icons.phone,
                                      color: UltColor.blue,
                                    ),
                                  ),
                                  Expanded(
                                    child: TextField(
                                      maxLength: 10,
                                      keyboardType: TextInputType.phone,
                                      controller: myController,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "0****",
                                      ),
                                      onSubmitted: (value) => mobileNo = value,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.035),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: UltColor.green,
                              textStyle: const TextStyle(fontSize: 23),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              side:
                                  BorderSide(color: UltColor.green, width: 0.5),
                              padding: const EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 37.5,
                              ),
                            ),
                            onPressed: () async {
                              debugPrint(mobileNo);
                              if (mobileNo.length == 10) {
                                setState(() {
                                  isAPICallProcess = true;
                                });
                                await APIService.otpLogin(mobileNo)
                                    .then((Response) async {
                                  setState(() {
                                    isAPICallProcess = false;
                                  });
                                  otpNumber = Response.otp;
                                  debugPrint("OTP: ${Response.otp} ");
                                  debugPrint(Response.data);
                                  if (Response.data != null) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => otp(
                                            otpHash: Response.data,
                                            mobileNo: mobileNo, accessNumber: otpNumber,),
                                      ),
                                    );
                                  }
                                });
                              } else {
                                FormHelper.showSimpleAlertDialog(
                                  context,
                                  "WayGo",
                                  AppLocalizations.of(context)!.enterYourPhoneNumner,
                                  "OK",
                                  () {
                                    Navigator.pop(context);
                                  },
                                );
                              }
                            },
                            child: Text(
                              AppLocalizations.of(context)!.next,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 23,
                                  fontFamily: 'Quicksand',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height * 0.06)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
