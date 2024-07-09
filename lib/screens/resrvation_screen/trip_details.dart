import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:waygo/model/utiles/colors.dart';
import 'package:waygo/screens/resrvation_screen/bus_seats.dart';
import 'package:waygo/model/bus.dart';

class DetailsPage extends StatefulWidget {
  final Bus busData;
  final Trip trip;
  const DetailsPage({super.key, required this.busData, required this.trip});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
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
              height: MediaQuery.of(context).size.height * 0.09,
              width: MediaQuery.of(context).size.width * 0.09,
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
            "Trip Info",
            style: TextStyle(
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.bold,
                color: UltColor.green,
                fontSize: 24),
          ),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.60,
              decoration: BoxDecoration(
                  color: UltColor.blue,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(160),
                      bottomRight: Radius.circular(160))),
              child: Padding(
                padding: const EdgeInsetsDirectional.only(start: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 30.0),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: Text(
                          "Company: ${widget.trip.companyName}",
                          style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'Baloo',
                              fontSize: 20),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 30.0),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: Text(
                          "Type: ${widget.trip.bus.type}",
                          style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'Baloo',
                              fontSize: 20),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/images/location.svg"),
                          const SizedBox(width: 14),
                          Text(
                            "From: ${widget.trip.from}",
                            style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'Baloo',
                                fontSize: 20),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/images/location.svg"),
                          const SizedBox(width: 14),
                          Text(
                            "To: ${widget.trip.to}",
                            style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'Baloo',
                                fontSize: 20),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, bottom: 15),
                      child: Text(
                        "Time: ${widget.trip.date.substring(0, 10)} At ${widget.trip.date.substring(12, 16)}",
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Baloo',
                            fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                          start: 30.0, bottom: 15),
                      child: Text(
                        "Sets: ${widget.busData.numOfSets}",
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Baloo',
                            fontSize: 24),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                          start: 30.0, bottom: 15),
                      child: Text(
                        "Number of bus: ${widget.busData.numberOfBus}",
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Baloo',
                            fontSize: 24),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(10),
                child: SvgPicture.asset(
                  "assets/images/people.svg",
                )),
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
                                builder: (context) => GetSeat(
                                      trip: widget.trip,
                                    )),
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
      ),
    ));
  }
}
