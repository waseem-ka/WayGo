import 'package:flutter/material.dart';
import 'package:waygo/model/bus.dart';
import 'package:waygo/model/utiles/colors.dart';
import 'package:waygo/screens/resrvation_screen/bus_seats.dart';
import 'package:waygo/screens/resrvation_screen/info_seat.dart';

class BillSeat extends StatefulWidget {
  final List number;
  final Trip trip;

  const BillSeat({required this.number, required this.trip, super.key});

  @override
  State<BillSeat> createState() => _BillSeatState();
}

class _BillSeatState extends State<BillSeat> {
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
                "Bill",
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
                    Text(
                      "Company: ${widget.trip.companyName}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: "Quicksand",
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Text(
                      "Type: ${widget.trip.bus.type}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: "Quicksand",
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Text(
                      "From: ${widget.trip.from}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: "Quicksand",
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Text(
                      "To: ${widget.trip.to}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: "Quicksand",
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Text(
                      "Number of seat: ${widget.number.length}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: "Quicksand",
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    const Text(
                      "Numbers seats:",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Quicksand",
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Text(
                      widget.number.toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: "Quicksand",
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Text(
                      "Ticket for seat: ${widget.trip.ticketPrice} SYR",
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: "Quicksand",
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Text(
                      "${widget.trip.date.substring(0, 10)} At ${widget.trip.date.substring(12, 16)}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: "Quicksand",
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Text(
                      "Total Price: ${widget.trip.ticketPrice * widget.number.length} SYR",
                      style: TextStyle(
                          color: UltColor.green,
                          fontFamily: "Quicksand",
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 27),
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
                                  builder: (context) => SeatsInfo(
                                      number: selectedSeats, trip: widget.trip)),
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
            ]),
          )),
    );
  }
}
