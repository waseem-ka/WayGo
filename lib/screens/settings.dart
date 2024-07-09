import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:waygo/controllers/local_storage.dart';
import 'package:waygo/model/utiles/colors.dart';
import 'package:waygo/screens/login_screen/language.dart';
import 'package:waygo/screens/settings_screen/exp.dart';
import 'package:waygo/screens/settings_screen/history.dart';
import 'package:waygo/screens/settings_screen/myReservation.dart';
import 'package:waygo/screens/settings_screen/support.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Container(
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
                  const Text(
                    'Yaser Alsamsam',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Quicksand'),
                  ),
                  const Text(
                    "0966617100",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Quicksand',
                        fontSize: 18),
                  )
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20,10,20,5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MyReservation()),
                            );
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset("assets/icons/Wallet.svg"),
                              const Padding(
                                padding: EdgeInsets.only(left: 10,right: 10),
                                child: Text(
                                  "Reservation",
                                  style: TextStyle(
                                      color: Color(0xff352555),
                                      fontSize: 22,
                                      fontFamily: 'Quicksand',
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HistoryPage()),
                            );
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset("assets/icons/Calendar.svg"),
                              const Padding(
                                padding: EdgeInsets.only(left: 10,right: 10),
                                child: Text(
                                  "History",
                                  style: TextStyle(
                                      color: Color(0xff352555),
                                      fontSize: 22,
                                      fontFamily: 'Quicksand',
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                  "assets/icons/information.svg"),
                              const Padding(
                                padding: EdgeInsets.fromLTRB(10,0,10,0),
                                child: Text(
                                  "My informaion",
                                  style: TextStyle(
                                      color: Color(0xff352555),
                                      fontSize: 22,
                                      fontFamily: 'Quicksand',
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0,0,0,18),
                      child: TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              SvgPicture.asset("assets/icons/Heart.svg"),
                              const Padding(
                                padding: EdgeInsets.fromLTRB(10,0,10,0),
                                child: Text(
                                  "Special offers",
                                  style: TextStyle(
                                      color: Color(0xff352555),
                                      fontSize: 22,
                                      fontFamily: 'Quicksand',
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0,0,0,10),
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SupportPage()),
                            );
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                  "assets/icons/Shield-Done.svg"),
                              const Padding(
                                padding: EdgeInsets.fromLTRB(10,0,10,0),
                                child: Text(
                                  "Support & About us",
                                  style: TextStyle(
                                      color: Color(0xff352555),
                                      fontSize: 22,
                                      fontFamily: 'Quicksand',
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0,0,0,10),
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ExpScreen()),
                            );
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                  "assets/icons/bot.svg"),
                              const Padding(
                                padding: EdgeInsets.fromLTRB(10,0,10,0),
                                child: Text(
                                  "help payment AI",
                                  style: TextStyle(
                                      color: Color(0xff352555),
                                      fontSize: 22,
                                      fontFamily: 'Quicksand',
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0,0,0,10),
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SupportPage()),
                            );
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                  "assets/icons/exp.svg"),
                              const Padding(
                                padding: EdgeInsets.fromLTRB(10,0,10,0),
                                child: Text(
                                  "Suggest journey AI",
                                  style: TextStyle(
                                      color: Color(0xff352555),
                                      fontSize: 22,
                                      fontFamily: 'Quicksand',
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40,0,40,0),
                      child: TextButton(
                        onPressed: () async {
                          await LocalStorage.removeAll();
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => const StartPage()),
                              (route) => false);
                        },
                        child: const Text(
                          "Logout",
                          style: TextStyle(
                              fontSize: 22,
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF148A75),
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}
