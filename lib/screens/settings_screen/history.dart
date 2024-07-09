import 'package:flutter/material.dart';
import 'package:waygo/model/api_service.dart';
import 'package:waygo/model/bus.dart';
import 'package:waygo/model/utiles/colors.dart';
import 'package:waygo/screens/settings_screen/thisHistory.dart';
import 'package:waygo/screens/widget/my_skeleton.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
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
              "History",
              style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold,
                  color: UltColor.green,
                  fontSize: 23),
            ),
          ),
          centerTitle: true,
        ),
        backgroundColor: UltColor.blue,
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(15),
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.8,
            decoration: const BoxDecoration(
                color: Color(0xffEEEEEE),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: FutureBuilder(
              future: ApiService.getReservation(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SkeletonContainerSettings(),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SkeletonContainerSettings(),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SkeletonContainerSettings(),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return const Text('Error in internet connection');
                } else {
                  List<Reservation> myHistory = [];
                  Map<String, dynamic> responseData = snapshot.data!.data;
                  List<dynamic> history = responseData['reservations'];

                  history.forEach((data) {
                    debugPrint("this is response ${data}");
                    Reservation reser = Reservation.fromJson(data);
                    myHistory.add(reser);
                  });
                  if (history.isEmpty) {
                    return Column(
                      children: [
                        SizedBox(
                            height:
                                MediaQuery.of(context).size.height * 0.01),
                        Container(
                          decoration: BoxDecoration(
                            color: UltColor.green.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height * 0.08,
                          child: Center(
                              child: Text(
                            "Sorry there are no History",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.03,
                                color: Colors.white,
                                fontFamily: 'Abhaya',
                                fontWeight: FontWeight.bold),
                          )),
                        )
                      ],
                    );
                  } else {
                    return ListView.builder(

                      itemCount: myHistory.length,
                      itemBuilder: (context, index){
                        Reservation thisHistory = myHistory[index];
                      return TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ThisHistory( history: thisHistory)),
                            );
                        },
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
                                Text(
                                  "Total Price: ${thisHistory.totalPrice} SYR",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontFamily: "Quicksand",
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("${thisHistory.from}, ${thisHistory.to}",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontFamily: "Quicksand",
                                        fontWeight: FontWeight.bold)),
                                Container(
                                  color: Colors.white,
                                  width: MediaQuery.of(context).size.width * 0.45,
                                  height:
                                      MediaQuery.of(context).size.height * 0.0015,
                                ),
                                Text("${thisHistory.date.substring(0, 10)} At ${thisHistory.date.substring(12, 16)}",
                                    style: const TextStyle(
                                      color: Color(0xffC4C4C4),
                                      fontSize: 15,
                                      fontFamily: "Quicksand",
                                    ))
                              ]),
                        ),
                      );}
                    );
                  }
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
