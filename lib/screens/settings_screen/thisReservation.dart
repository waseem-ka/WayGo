import 'package:flutter/material.dart';
import 'package:waygo/model/bus.dart';
import 'package:waygo/model/utiles/colors.dart';

class ThisReservation extends StatefulWidget {
  final Reservation reservation;

  const ThisReservation({required this.reservation, super.key});

  @override
  State<ThisReservation> createState() => _ThisReservationState();
}

class _ThisReservationState extends State<ThisReservation> {
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
                      "ID Reservation: ${widget.reservation.tripId}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: "Quicksand",
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Text(
                      "Number of chair: ${widget.reservation.chear}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: "Quicksand",
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Text(
                      "From: ${widget.reservation.from}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: "Quicksand",
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Text(
                      "To: ${widget.reservation.to}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: "Quicksand",
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Text(
                      "Number of Bus: ${widget.reservation.numberBus}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: "Quicksand",
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Text(
                      "Ticket for seat: ${widget.reservation.myPeople} SYR",
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: "Quicksand",
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Text(
                      "${widget.reservation.date.substring(0, 10)} At ${widget.reservation.date.substring(12, 16)}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: "Quicksand",
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Text(
                      "Total Price: ${widget.reservation.totalPrice} SYR",
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
