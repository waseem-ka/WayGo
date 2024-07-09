import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:waygo/model/otp_login_response_model.dart';
import 'package:waygo/model/utiles/colors.dart';
import 'package:waygo/screens/base.dart';
import 'package:waygo/screens/login_screen/info.dart';
import 'package:waygo/model/api_service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class otp extends StatefulWidget {
  final String? mobileNo;
  final String? otpHash;
  final String? accessNumber;

  const otp({super.key, required this.accessNumber, required this.mobileNo, required this.otpHash});

  @override
  State<otp> createState() => _otpState(mobileNo);
}

final myController = TextEditingController();

class _otpState extends State<otp> {
  String letMobile = '0';
  bool enableResendBtn = false;
  String _otpCode = "";
  final int _otpCodeLength = 4;
  bool _enableButton = false;
  //var autoFill;
  late FocusNode myFocusNode;
  bool isAPIcallProcess = false;

  _otpState(String? mobileNo);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 0.62,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: UltColor.blue,
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(150),
                            bottomRight: Radius.circular(150))),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(AppLocalizations.of(context)!.verification,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontFamily: 'Quicksand',
                                  fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          padding: const EdgeInsets.all(20),
                          child: Image.asset(
                            "assets/images/otp.png",
                            width: MediaQuery.of(context).size.width * 0.80,
                            height: MediaQuery.of(context).size.height * 0.25,
                            fit: BoxFit.contain,
                            alignment: Alignment.center,
                          ),
                        ),
                        Text(
                          AppLocalizations.of(context)!.enterSMS,
                          style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'Quicksand',
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                      ]),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!.theOTPsent,
                                    style: TextStyle(
                                        color: UltColor.green,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Quicksand'),
                                  ),
                                  Text(
                                    "0${widget.mobileNo}",
                                    style: TextStyle(
                                        color: UltColor.blue,
                                        fontFamily: 'Quicksand',
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              )),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                            //child: autoFill,
                            child: PinFieldAutoFill(
                              decoration: UnderlineDecoration(
                                textStyle: const TextStyle(
                                    fontSize: 20, color: Colors.black),
                                colorBuilder: FixedColorBuilder(
                                    Colors.black.withOpacity(0.3)),
                              ),
                              currentCode: _otpCode,
                              codeLength: _otpCodeLength,
                              onCodeSubmitted: (code) {},
                              onCodeChanged: (code) {
                                print(code);
                                if (code!.length == _otpCodeLength) {
                                  _otpCode = code;
                                  _enableButton = true;
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                }
                              },
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(bottom: 10, left: 30),
                            child: Center(
                                child: Row(
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.dontReciveOTP,
                                  style: TextStyle(
                                      color: UltColor.green,
                                      fontFamily: 'Quicksand',
                                      fontWeight: FontWeight.bold),
                                ),
                                TextButton(
                                    onPressed: () async {
                                      // await APIService.otpLogin(
                                      //         "$letMobile${widget.mobileNo}")
                                      //     .then((Response) async {
                                      //   setState(() {});
                                      //   debugPrint("OTP: ${Response.otp} ");
                                      //   debugPrint(Response.data);
                                      // });
                                      FormHelper.showSimpleAlertDialog(
                                  context,
                                  "WayGo",
                                  "${widget.accessNumber}",
                                  "OK",
                                  () {
                                    Navigator.pop(context);
                                  },
                                );
                                    },
                                    child: Text(
                                      AppLocalizations.of(context)!.resendOTP,
                                      style: TextStyle(
                                          color: UltColor.blue,
                                          fontFamily: 'Quicksand',
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            )),
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: UltColor.green,
                                textStyle: const TextStyle(fontSize: 23),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                side: BorderSide(
                                    color: UltColor.green, width: 0.5),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10.0,
                                  horizontal: 37.5,
                                ),
                              ),
                              onPressed: () {
                                if (_enableButton) {
                                  setState(() {
                                    isAPIcallProcess = true;
                                  });
                                  debugPrint("otp hash ${widget.otpHash}");
                                  APIService.verifyOTP(widget.mobileNo!,
                                          widget.otpHash!, _otpCode)
                                      .then((response) {
                                    setState(() {
                                      isAPIcallProcess = false;
                                    });
                                    print(response.runtimeType);
                                    if (response is OtpLoginResponseModel &&
                                        response.message ==
                                            "welcome , please register in our application") {
                                      //REDIRECT TO HOME SCREEN
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => info(
                                                  mobileNO:
                                                      "0${widget.mobileNo!}",
                                                )),
                                      );
                                    } else if (response == null) {
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const BaseScreen()),
                                        (route) => false,
                                      );
                                    } else {
                                      FormHelper.showSimpleAlertDialog(
                                        context,
                                        "WayGo",
                                        response.message!,
                                        "OK",
                                        () {
                                          Navigator.pop(context);
                                        },
                                      );
                                    }
                                  });
                                }
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    AppLocalizations.of(context)!.verification,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 23,
                                        fontFamily: 'Quicksand',
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.01,
                                  ),
                                  const Icon(
                                      Icons.control_point_duplicate_sharp)
                                ],
                              )),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.05),
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
