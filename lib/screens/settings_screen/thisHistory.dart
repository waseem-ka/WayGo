import 'package:flutter/material.dart';
import 'package:waygo/model/bus.dart';
import 'package:waygo/model/utiles/colors.dart';

class ThisHistory extends StatefulWidget {
  final Reservation history;

  const ThisHistory({required this.history, super.key});

  @override
  State<ThisHistory> createState() => _ThisHistoryState();
}

class _ThisHistoryState extends State<ThisHistory> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
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
                "Reservation",
                style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold,
                    color: UltColor.green,
                    fontSize: 24),
              ),
            ),
            centerTitle: true,
          ),
          body: Center(
            child: Column(children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: UltColor.blue,
                ),
                width: MediaQuery.of(context).size.width * 0.85,
                height: MediaQuery.of(context).size.height * 0.65,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      "Yser Alsamsam",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Quicksand",
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Text(
                      "ID Reservation: ${widget.history.tripId}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: "Quicksand",
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Text(
                      "Number of chair: ${widget.history.chear}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: "Quicksand",
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Text(
                      "From: ${widget.history.from}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: "Quicksand",
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Text(
                      "To: ${widget.history.to}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: "Quicksand",
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Text(
                      "Number of Bus: ${widget.history.numberBus}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: "Quicksand",
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Text(
                      "Ticket for seat: ${widget.history.myPeople} SYR",
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: "Quicksand",
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Text(
                      "${widget.history.date.substring(0, 10)} At ${widget.history.date.substring(12, 16)}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: "Quicksand",
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Text(
                      "Total Price: ${widget.history.totalPrice} SYR",
                      style: TextStyle(
                          color: UltColor.green,
                          fontFamily: "Quicksand",
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ],
                ),
              ),
            ]),
          )),
    );
  }
}
