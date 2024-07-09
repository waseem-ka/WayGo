import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:waygo/model/api_service.dart';
import 'package:waygo/model/bus.dart';
import 'package:waygo/model/utiles/colors.dart';
import 'package:waygo/screens/widget/my_skeleton.dart';
import 'resrvation_screen/trip_details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime time = DateTime(2023, 11, 4, 21);

  // DateTime time = DateTime.now();

  String timeString = '';

  void _addOneDay() {
    setState(() {
      time = time.add(const Duration(days: 1));
      timeString = '${time.year}/${time.month}/${time.day}';
    });
  }

  void _minusOneDay() {
    //------------------ this is importent ((Validation time))----------------------
    // if (time.isBefore(DateTime.now())) {
    // Fluttertoast.showToast(
    //     msg: "Sorry you can't select past time",
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.BOTTOM,
    //     backgroundColor: UltColor.green,
    //     textColor: Colors.white,
    //     fontSize: 16.0);
    // } else {
    //   setState(() {
    //     time = time.subtract(const Duration(days: 1));
    //     timeString = '${time.year}/${time.month}/${time.day}';
    //   });
    // }
    setState(() {
      time = time.subtract(const Duration(days: 1));
      timeString = '${time.year}/${time.month}/${time.day}';
    });
  }

  void socketListener() {
    final socket = ApiService.openSocket();
      socket.onError((data) => print('errrror $data'));

    socket.onConnect((data) {
      print('Sosket Connected');

      socket.emit('availabelTrips');
    });
      socket.on('availabelTrips', (data) {
        print(data);
      });
  }


  @override
  void initState() {
    socketListener();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      Object? from = 'Damascus';
      Object? to = 'Tartous';
      final List<DropdownMenuItem<Object>> _city = [
     DropdownMenuItem<Object>(
      value: "Damascus",
      child: Text(AppLocalizations.of(context)!.damascus),
    ),
    DropdownMenuItem<Object>(
      value: "Aleppo",
      child: Text(AppLocalizations.of(context)!.aleppo),
    ),
    DropdownMenuItem<Object>(
      value: "Hama",
      child: Text(AppLocalizations.of(context)!.hama),
    ),
    DropdownMenuItem<Object>(
      value: "Homse",
      child: Text(AppLocalizations.of(context)!.homse),
    ),
    DropdownMenuItem<Object>(
      value: "Tartous",
      child: Text(AppLocalizations.of(context)!.tartous),
    ),
  ];
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(fit: StackFit.passthrough, children: [
                Column(
                  children: <Widget>[
                    Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.293,
                        // height: 230,
                        color: const Color(0xFF2F4C78),
                        // color: Colors.amber,
                        child: SvgPicture.asset(
                          "assets/images/s.svg",
                          alignment: Alignment.bottomCenter,
                        ))
                  ],
                ),
                Column(
                  children: <Widget>[
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Text(
                      "WayGo",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.03,
                          decoration: TextDecoration.underline,
                          color: Colors.white,
                          fontFamily: 'Abhaya'),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 1,
                      height: MediaQuery.of(context).size.height * 0.055,
                      color: UltColor.blue.withOpacity(0.6),
                      child: DropdownButtonFormField<Object>(
                        hint: const Text(
                          'From',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Abhaya',
                              fontWeight: FontWeight.bold),
                        ),
                        dropdownColor: const Color(0xFF148A75),
                        
                        value: from,
                        items: _city,
                        onChanged: (value) {
                          setState(() {
                            from = value;
                            debugPrint("$value");
                          });
                        },
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          prefixIcon: SvgPicture.asset(
                            "assets/icons/arrow_green.svg",
                            matchTextDirection: true,
                          ),
                        ),
                        icon: Padding(
                          padding: const EdgeInsets.fromLTRB(15,0,0,0),
                          child: SvgPicture.asset(
                            "assets/icons/location.svg",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Container(
                      width: MediaQuery.of(context).size.width * 1,
                      height: MediaQuery.of(context).size.height * 0.055,
                      color: const Color(0xFF284269).withOpacity(0.6),
                      child: DropdownButtonFormField<Object>(
                        hint: const Text(
                          'To',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Abhaya',
                              fontWeight: FontWeight.bold),
                        ),
                        dropdownColor: UltColor.green,
                        value: to,
                        items: _city,
                        onChanged: (value) {
                          setState(() {
                            to = value;
                            debugPrint("$value");
                          });
                        },
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          prefixIcon: SvgPicture.asset(
                            "assets/icons/arrow_green.svg",
                            matchTextDirection: true,
                            color: Colors.red,
                          ),
                        ),
                        icon: Padding(
                          padding: const EdgeInsets.fromLTRB(15,0,0,0),
                          child: SvgPicture.asset(
                            "assets/icons/location.svg",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Container(
                      width: MediaQuery.of(context).size.width * 1,
                      height: MediaQuery.of(context).size.height * 0.05,
                      color: UltColor.blue.withOpacity(0.6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              TextButton(
                                  onPressed: () {
                                    _minusOneDay();
                                    debugPrint("${time.day}");
                                  },
                                  child:  Row(
                                    children: <Widget>[
                                      Text(
                                        AppLocalizations.of(context)!.preDay,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Abhaya',
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(width: MediaQuery.of(context).size.width*0.01,),
                                      const Icon(
                                        Icons.arrow_back_ios,
                                        color: Colors.white,
                                      )
                                    ],
                                  )),
                              Text(
                                "${time.day}.${time.month}.${time.year}",
                                style: const TextStyle(
                                    color: Colors.white, fontFamily: 'Kaisei'),
                              ),
                              TextButton(
                                  onPressed: () {
                                    _addOneDay();
                                    debugPrint("${time.day}");
                                  },
                                  child: Row(
                                    children: <Widget>[
                                      const Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        AppLocalizations.of(context)!.nextDay,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Abhaya',
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width*0.01,
                                      ),
                                    ],
                                  )),
                              const Icon(
                                Icons.calendar_month_outlined,
                                color: Colors.white,
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                )
              ]),
              //Card of the trips
              FutureBuilder(
                future: ApiService.getTripData(from.toString(), to.toString(),
                    "${time.year}-${time.month.toString().padLeft(2, '0')}-${time.day.toString().padLeft(2, '0')} 00:00:00"),
                // future: ApiService.getTripData(
                //     From.toString(), To.toString(), time.toString()),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Column(
                      children: [
                        SkeletonContainer(),
                        SkeletonContainer(),
                        SkeletonContainer(),
                        SkeletonContainer()
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return const Text('Error in internet connection');
                    // return Text('Error: ${snapshot.error}');
                  } else {
                    // Data has been loaded successfully
                    List<Trip> trips = [];

                    Map<String, dynamic> responseData = snapshot.data!.data;
                    List<dynamic> tripData = responseData['trips'];

                    tripData.forEach((data) {
                      debugPrint("this is response ${data}");
                      Trip trip = Trip.fromJson(data);
                      trips.add(trip);
                    });
                    if (trips.isEmpty) {
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
                              AppLocalizations.of(context)!.sorryNoTrip,
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
                      return SizedBox(
                        height: double.maxFinite,
                        child: ListView.builder(
                          itemCount: trips.length,
                          itemBuilder: (context, index) {
                            debugPrint("this is the new : ${trips.length}");
                            Bus busData = trips[index].bus;
                            String dateTrip = trips[index].date;
                            String hourTrip = dateTrip.substring(11, 16);
                            return Container(
                              margin: const EdgeInsets.all(7.0),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.16,
                              child: TextButton(
                                onPressed: () {
                                  // Replace 'details' with the correct route name for your details page
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailsPage(
                                            busData: busData,
                                            trip: trips[index])),
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(
                                        borderRadius:
                                            BorderRadiusDirectional.only(
                                          topStart: Radius.circular(17),
                                          bottomStart: Radius.circular(17),
                                        ),
                                        color: Color(0xFF148A75),
                                      ),
                                      width: MediaQuery.of(context).size.width *
                                          0.073,
                                      height:
                                          MediaQuery.of(context).size.height,
                                      child: Center(
                                        child: Text(
                                          "${index + 1}",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 23,
                                              fontFamily: 'Abril'),
                                        ),
                                      ),
                                    ),
                                    //the info of the trip part1
                                    Container(
                                        color: Colors.white,
                                        width: MediaQuery.of(context).size.width * 0.51,
                                        height: MediaQuery.of(context).size.height,
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  trips[index].companyName,
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      fontFamily: 'Abril',
                                                      color: Color(0xFF565656)),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(
                                                  "${AppLocalizations.of(context)!.from}: ",
                                                  style: const TextStyle(
                                                      color: Color(0xFF565656),
                                                      fontSize: 12,
                                                      fontFamily: 'Abril'),
                                                ),
                                                Text(
                                                  "$from",
                                                  style: const TextStyle(
                                                      fontSize: 10,
                                                      fontFamily: 'Kaisei',
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(
                                                  "${AppLocalizations.of(context)!.to}: ",
                                                  style: const TextStyle(
                                                      color: Color(0xFF565656),
                                                      fontSize: 12,
                                                      fontFamily: 'Abril'),
                                                ),
                                                Text(
                                                  trips[index].to,
                                                  style: const TextStyle(
                                                      fontSize: 10,
                                                      fontFamily: 'kaisei',
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(
                                                  ("Seats: ${busData.numOfSets}"),
                                                  style: const TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 21, 21, 21),
                                                      fontSize: 12,
                                                      fontFamily: 'Kaisei',
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  "${trips[index].ticketPrice} SYR",
                                                  style: const TextStyle(
                                                      fontSize: 13,
                                                      fontFamily: 'Abril'),
                                                )
                                              ],
                                            ),
                                          ],
                                        )),
                                    //the info of the trip part 2 with the price
                                    Container(
                                      decoration: const BoxDecoration(
                                          borderRadius:
                                              BorderRadiusDirectional.only(
                                                  topEnd: Radius.circular(18),
                                                  bottomStart:
                                                      Radius.circular(18),
                                                  bottomEnd:
                                                      Radius.circular(18)),
                                          color: Color(0xFF233862)),
                                      width: MediaQuery.of(context).size.width *
                                          0.32,
                                      height:
                                          MediaQuery.of(context).size.height,
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Type: ${trips[index].bus.type}",
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontFamily: 'Abril'),
                                          ),
                                          Text(
                                            "At: $hourTrip",
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontFamily: 'Abril'),
                                          ),
                                          Text(
                                            dateTrip.substring(0, 10),
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontFamily: 'Abril'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
