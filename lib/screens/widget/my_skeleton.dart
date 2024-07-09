import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:waygo/model/utiles/colors.dart';

class SkeletonContainer extends StatelessWidget {
  const SkeletonContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: Container(
        margin: const EdgeInsets.all(7.0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.16,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(17),
                  bottomStart: Radius.circular(17),
                ),
                color: Color(0xFF148A75),
              ),
              width: MediaQuery.of(context).size.width * 0.073,
              height: MediaQuery.of(context).size.height * 0.15,
              child: const Center(
                child: Text(
                  "1",
                  style: TextStyle(
                      color: Colors.white, fontSize: 23, fontFamily: 'Abril'),
                ),
              ),
            ),
            //the info of the trip part1
            Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width * 0.51,
                height: MediaQuery.of(context).size.height * 0.15,
                padding: const EdgeInsets.all(16.0),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Hello world",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Abril',
                              color: Color(0xFF565656)),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "From: ",
                          style: TextStyle(
                              color: Color(0xFF565656),
                              fontSize: 12,
                              fontFamily: 'Abril'),
                        ),
                        Text(
                          "Damascus",
                          style: TextStyle(
                              fontSize: 10,
                              fontFamily: 'Kaisei',
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "To: ",
                          style: TextStyle(
                              color: Color(0xFF565656),
                              fontSize: 12,
                              fontFamily: 'Abril'),
                        ),
                        Text(
                          "Damascus",
                          style: TextStyle(
                              fontSize: 10,
                              fontFamily: 'kaisei',
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          ("Seats: 42"),
                          style: TextStyle(
                              color: Color.fromARGB(255, 21, 21, 21),
                              fontSize: 12,
                              fontFamily: 'Kaisei',
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "4500 SYR",
                          style: TextStyle(fontSize: 13, fontFamily: 'Abril'),
                        )
                      ],
                    ),
                  ],
                )),
            //the info of the trip part 2 with the price
            Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadiusDirectional.only(
                      topEnd: Radius.circular(18),
                      bottomStart: Radius.circular(18),
                      bottomEnd: Radius.circular(18)),
                  color: Color(0xFF233862)),
              width: MediaQuery.of(context).size.width * 0.32,
              height: MediaQuery.of(context).size.height * 0.15,
              padding: const EdgeInsets.all(16.0),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Type: normal",
                    style: TextStyle(
                        color: Colors.white, fontSize: 12, fontFamily: 'Abril'),
                  ),
                  Text(
                    "At: 14:14",
                    style: TextStyle(
                        color: Colors.white, fontSize: 12, fontFamily: 'Abril'),
                  ),
                  Text(
                    "22/22/22",
                    style: TextStyle(
                        color: Colors.white, fontSize: 12, fontFamily: 'Abril'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class SkeletonContainerSettings extends StatelessWidget {
  const SkeletonContainerSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: Container(
            padding: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.height * 0.15,
            decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(15),
                color: UltColor.blue),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Total Price: 27000 SYR",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: "Quicksand",
                        fontWeight: FontWeight.bold),
                  ),
                  const Text("Damascus, Aleppo",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: "Quicksand",
                          fontWeight: FontWeight.bold)),
                  Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width * 0.45,
                    height: MediaQuery.of(context).size.height * 0.0015,
                  ),
                  const Text("2023-2-25 10:25",
                      style: TextStyle(
                        color: Color(0xffC4C4C4),
                        fontSize: 13,
                        fontFamily: "Quicksand",
                      ))
                ]),
          ),
    );
  }
}