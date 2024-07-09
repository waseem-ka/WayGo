import 'package:flutter/material.dart';
import 'package:waygo/model/bus.dart';
import 'package:waygo/model/utiles/colors.dart';
import 'package:waygo/screens/base.dart';

class PaymentPage extends StatefulWidget {
  final Trip trip;
  final List number;
  const PaymentPage({super.key, required this.number, required this.trip});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: UltColor.blue,
            elevation: 0,
            leading: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Center(
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: UltColor.green,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                    ),
                  ),
                ),
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                "Payment",
                style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold,
                    color: UltColor.green,
                    fontSize: 24),
              ),
            ),
            centerTitle: true,
          ),
          body: SafeArea(
            child: Column(
              children: [
                Center(
                  child: Column(children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: UltColor.blue,
                      ),
                      width: MediaQuery.of(context).size.width * 0.85,
                      height: MediaQuery.of(context).size.height * 0.50,
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text(
                            "Select payment method",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Quicksand",
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.63,
                            height: MediaQuery.of(context).size.height * 0.10,
                            child: Card(
                              color: Colors.white,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(2),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 35,
                                          height: 35,
                                          child: Image.asset(
                                              "assets/images/MTN.png"),
                                        ),
                                        const SizedBox(width: 60),
                                        const Text(
                                          "MTN",
                                          style: TextStyle(
                                              fontFamily: "Quicksand",
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff352555)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 120,
                                    height: 2,
                                    color: UltColor.green,
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.63,
                            height: MediaQuery.of(context).size.height * 0.10,
                            child: Card(
                              color: Colors.white,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(2),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 35,
                                          height: 35,
                                          child: Image.asset(
                                              "assets/images/syriatel.png"),
                                        ),
                                        const SizedBox(width: 60),
                                        const Text(
                                          "SYRIATEL",
                                          style: TextStyle(
                                              fontFamily: "Quicksand",
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff352555)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 120,
                                    height: 2,
                                    color: UltColor.green,
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.63,
                            height: MediaQuery.of(context).size.height * 0.10,
                            child: Card(
                              color: Colors.white,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(2),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 35,
                                          height: 35,
                                          child: Image.asset(
                                              "assets/images/fatora.png"),
                                        ),
                                        const SizedBox(width: 60),
                                        const Text(
                                          "FATORA",
                                          style: TextStyle(
                                              fontFamily: "Quicksand",
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff352555)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 120,
                                    height: 2,
                                    color: UltColor.green,
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      )),
                    ),
                  ]),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: UltColor.green,
                      textStyle: const TextStyle(fontSize: 23),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      side: BorderSide(color: UltColor.green, width: 0.5),
                      padding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 37.5,
                      ),
                    ),
                    onPressed: () {},
                    child: const SizedBox(
                        width: 150, child: Center(child: Text("Go to cash")))),
                SizedBox(height: MediaQuery.of(context).size.height * 0.075),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 120,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                          ),
                          child: const Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 3.0, right: 6),
                                child: Icon(
                                  Icons.arrow_back_ios_rounded,
                                  size: 18,
                                ),
                              ),
                              Text(
                                "Previous",
                                style: TextStyle(
                                    fontFamily: 'Baloo',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 120,
                        child: Center(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const BaseScreen()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0)),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Next",
                                  style: TextStyle(
                                      fontFamily: 'Baloo',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.only(
                                      bottom: 3.0, start: 6),
                                  child: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
