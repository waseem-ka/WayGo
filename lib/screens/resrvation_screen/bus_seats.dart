import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waygo/model/api_service.dart';
import 'package:waygo/model/bus.dart';
import 'package:waygo/model/utiles/colors.dart';
import 'package:waygo/screens/resrvation_screen/bill.dart';
import 'package:fluttertoast/fluttertoast.dart';


class GetSeat extends StatefulWidget {
  final Trip trip;

  const GetSeat({super.key, required this.trip});

  @override
  State<GetSeat> createState() => _GetSeatState();
}

class _GetSeatState extends State<GetSeat> {
  List<Chear> chairs=[];

  @override
    void initState() {
    super.initState();
    fetchChairData(); // Fetch chair data when the widget is initialized
    selectedSeats.clear();
  }
  
  Future<void> fetchChairData() async {
  final String id = widget.trip.id.toString();
  chairs = await ApiService.getChear(id);
  setState(() {
    
  });
  print("chairs.length: ${chairs.length}");
  print("Trip ID: ${widget.trip.id}");

}


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: UltColor.blue,
        title: Text(
          "Get Seats",
          style: TextStyle(
              fontFamily: 'Quicksand',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: UltColor.green),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Center(
            child: Container(
              height: MediaQuery.of(context).size.width *0.1,
              width: MediaQuery.of(context).size.height *0.1,
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
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: UltColor.blue,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 40.0),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Please select your seats",
                    style: TextStyle(
                        fontFamily: 'Baloo',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: Colors.white,
                            size: 15,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Available",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Baloo',
                                color: Colors.white),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            size: 15,
                            color: Color.fromARGB(255, 153, 17, 7),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Busy",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Baloo',
                                color: Colors.white),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.circle_outlined,
                            size: 15,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Your seats",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Baloo',
                                color: Colors.white),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.825,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(80),
                      topRight: Radius.circular(80))),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.005,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.74,
                    height: MediaQuery.of(context).size.height * 0.68,
                    decoration: const BoxDecoration(
                        color: Color(0xffD9D9D9),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30))),
                    child: Builder(builder: (context) {
                      
                      if (widget.trip.bus.type == "vip") {
                        return VipBus(chaer: chairs,);
                      } else if(widget.trip.bus.type == "normal") {
                        return
                        // const BusNormal();
                        Padding(
                          padding: const EdgeInsets.only(top: 50.0),
                          child: ChairGrid(chairs: chairs),
                        );
                      }
                      else {
                        return const Text("sorry there are no chair in this bus");
                      }
                      
                    }),
                  ),
               //_________________________________________________________________________
               //_________________________________________________________________________

                  Padding(
                    padding: const EdgeInsets.only(top: 10,left: 18,right: 18),
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
                                  padding:
                                      EdgeInsets.only(bottom: 3.0, right: 6),
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
                              onPressed: () async{
                                if (selectedSeats.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg: "Please select your seat",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      backgroundColor: UltColor.green,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                } else if (selectedSeats.length > 5) {
                                  Fluttertoast.showToast(
                                      msg:
                                          "Sorry you can't select more then 10 seats",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      backgroundColor: UltColor.green,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                } else {
                                  print(selectedSeats.length);
                                  await ApiService.bookChear("${widget.trip.id}", selectedSeats);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => BillSeat(
                                              number: selectedSeats,
                                              trip: widget.trip,
                                            )),
                                  );
                                }
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
          ],
        ),
      ),
    ));
  }
}

final List selectedSeats = [];

const apiSeatStates = [
  Colors.white,
  Colors.red,
  Colors.grey,
];

class VipBus extends StatelessWidget {
  final List <Chear> chaer;
  const VipBus({super.key, required this.chaer});

  Color getState(String status) {
    if(status == "yes")
    {
      return Colors.red;
    }
    else if(status == "no")
    {
      return Colors.white;
    }
    else if(status == "isBooking")
    {
      return Colors.grey;
    }
    else{
      return Colors.blue;
    }
}

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.separated(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => Row(
                  children: [
                    SeatWidget(
                      seatColor: getState(chaer[int.parse('${index >= 6 ? (index * 3) : (index * 3) + 1}')].state),
                      seatNumber:
                          '${index >= 6 ? (index * 3) : (index * 3) + 1}',
                    ),
                    const SizedBox(width: 10.0),
                    SeatWidget(
                      seatColor: getState(chaer[int.parse('${index >= 6 ? (index * 3) + 1 : (index * 3) + 2}')].state),
                      seatNumber:
                          '${index >= 6 ? (index * 3) + 1 : (index * 3) + 2}',
                    ),
                    if (index == 10)
                      Row(
                        children: [
                          const SizedBox(width: 15.0),
                          SeatWidget(
                            seatColor: getState(chaer[32].state),
                            seatNumber: '32',
                          ),
                        ],
                      ),
                    const Spacer(),
                    if (index != 5)
                      Row(
                        children: [
                          SeatWidget(
                            seatColor: getState(chaer[int.parse('${index == 10 ? 33 : index >= 6 ? (index * 3) + 2 : (index * 3) + 3}')].state),
                            seatNumber:
                                '${index == 10 ? 33 : index >= 6 ? (index * 3) + 2 : (index * 3) + 3}',
                          ),
                        ],
                      ),
                  ],
                ),
            separatorBuilder: (context, index) => const SizedBox(
                  height: 14,
                ),
            itemCount: 11),
      ),
    );
  }
}


class NormalBus extends StatelessWidget {
  const NormalBus({super.key});

  T getRandomElement<T>(List<T> list) {
  final random = Random();
  var i = random.nextInt(list.length);
  return list[i];
}

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView.separated(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => Row(
                    children: [
                      SeatWidget(
                        seatColor: getRandomElement(apiSeatStates),
                        seatNumber:
                            '${index >= 6 ? (index * 4) - 1 : (index * 4) + 1}',
                      ),
                      const SizedBox(width: 10.0),
                      SeatWidget(
                        seatColor: getRandomElement(apiSeatStates),
                        seatNumber:
                            '${index >= 6 ? (index * 4) : (index * 4) + 2}',
                      ),
                      if (index == 11)
                        Row(
                          children: [
                            const SizedBox(width: 8.0),
                            SeatWidget(
                              seatColor: getRandomElement(apiSeatStates),
                              seatNumber: '45',
                            ),
                          ],
                        ),
                      const Spacer(),
                      if (index != 5)
                        Row(
                          children: [
                            SeatWidget(
                              seatColor: getRandomElement(apiSeatStates),
                              seatNumber:
                                  '${index == 11 ? 46 : index >= 6 ? (index * 4) + 1 : (index * 4) + 3}',
                            ),
                            const SizedBox(width: 10.0),
                            SeatWidget(
                              seatColor: getRandomElement(apiSeatStates),
                              seatNumber:
                                  '${index == 11 ? 47 : index >= 6 ? (index * 4) + 2 : (index * 4) + 4}',
                            ),
                          ],
                        ),
                    ],
                  ),
              separatorBuilder: (context, index) => const SizedBox(
                    height: 14,
                  ),
              itemCount: 12)),
    );
  }
}


class SeatWidget extends StatelessWidget {
  final String seatNumber;
  final Color seatColor;
  const SeatWidget(
      {super.key, required this.seatNumber, required this.seatColor});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<Color> seatState = ValueNotifier(seatColor);
    return ValueListenableBuilder(
      valueListenable: seatState,
      builder: (context, value, child) => InkWell(
        borderRadius: BorderRadius.circular(20.0),
        onTap: () {
          if (seatState.value == Colors.red || seatState.value == Colors.grey) {
            return;
          }
          if (selectedSeats.contains(seatNumber)) {
            selectedSeats.remove(seatNumber);
            seatState.value = Colors.white;
          } else if (!(selectedSeats.length >= 5)) {
            selectedSeats.add(seatNumber);
            seatState.value = Colors.green;
          }
        },
        child: Container(
          height: 30,
          width: 35,
          decoration: BoxDecoration(
            color: seatState.value,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(
            child: Text(
              seatNumber,
              style: const TextStyle(
                fontSize: 18.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
  
}







// ==================================================
// ==================================================
class ChairGrid extends StatefulWidget {
  final List<Chear> chairs;

  const ChairGrid({super.key, required this.chairs});

  @override
  State<ChairGrid> createState() => _ChairGridState();
}

class _ChairGridState extends State<ChairGrid> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      
      itemCount: (widget.chairs.length / 4).ceil(),
      itemBuilder: (context, rowIndex) {
        return Directionality(
          textDirection: TextDirection.ltr,
          child: _buildRow(rowIndex));
      },
    );
  }

  Widget _buildRow(int rowIndex) {
    int start = rowIndex * 4;
    int end = (rowIndex + 1) * 4;
    end = end > widget.chairs.length ? widget.chairs.length : end;

    if (rowIndex == (widget.chairs.length / 4).ceil() - 1) {
      // Last row with 5 seats
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ChairWidget(chair: widget.chairs[start - 2]),
          ChairWidget(chair: widget.chairs[start - 1]),
          ChairWidget(chair: widget.chairs[start]),
          ChairWidget(chair: widget.chairs[start + 1]),
          ChairWidget(chair: widget.chairs[start + 2]),
        ],
      );
    } else if (rowIndex > 6) {
      // Rows after the 7th row with indices adjusted by +2
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ChairWidget(chair: widget.chairs[start - 2]),
          ChairWidget(chair: widget.chairs[start - 1]),
          const SizedBox(width: 15),
          ChairWidget(chair: widget.chairs[start]),
          ChairWidget(chair: widget.chairs[start + 1]),
        ],
      );
    } else if (rowIndex == 6) {
      // 7th row with 2 seats and space
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ChairWidget(chair: widget.chairs[start]),
          ChairWidget(chair: widget.chairs[start + 1]),
          const SizedBox(width: 130),
        ],
      );
    } else {
      // Regular row with 4 seats and space in the middle
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ChairWidget(chair: widget.chairs[start]),
          ChairWidget(chair: widget.chairs[start + 1]),
          const SizedBox(width: 15),
          ChairWidget(chair: widget.chairs[start + 2]),
          ChairWidget(chair: widget.chairs[start + 3]),
        ],
      );
    }
  }
}

// class ChairGrid extends StatelessWidget {
//   final List<Chear> chairs;
//   final Bus bus;

//   const ChairGrid({Key? key, required this.chairs, required this.bus}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     int rown=4;
//     return GridView.builder(
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 5, // 4 columns
//       ),
//       itemCount: chairs.length, // Use the number of chairs from the fetched data
//       itemBuilder: (context, index) {
//         // Calculate the row number (1-based)
//         int rowNumber = (index ~/ 4) + 1;
//         int rowCount = (chairs.length / 4).ceil();

//         if (rowNumber == rowCount) {
//           rown=5;
//           print("row number isssss:::::::::::::::$rown");
//           // Display five chairs in the final row
//           return Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               if (index % 4 == 0) ChairWidget(chair: chairs[chairs.length-5]),
//               if (index % 4 == 1) ChairWidget(chair: chairs[chairs.length-4]),
//               if (index % 4 == 2) ChairWidget(chair: chairs[chairs.length-3]),
//               if (index % 4 == 2) ChairWidget(chair: chairs[chairs.length-2]),
//               if (index % 4 == 2) ChairWidget(chair: chairs[chairs.length-1]),
//             ]
//           );
//         } else if (rowNumber == 7) {
//           // Special case for the 7th row
//           return Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               if (index % 4 == 0) ChairWidget(chair: chairs[index]),
//               if (index % 4 == 1) ChairWidget(chair: chairs[index]),
//               if (index % 4 == 2) const SizedBox(width: 30),
//               if (index % 4 == 3) const SizedBox(width: 30),
//               SizedBox(width: 1)
//             ],
//           );
//         }else if(rowNumber>7){
//           // Display two chairs, a space of width 15, and two chairs in other rows
//           return Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               if (index % 4 == 0) ChairWidget(chair: chairs[index-2]),
//               if (index % 4 == 1) ChairWidget(chair: chairs[index-2]),
//               if (index % 4 == 2) ChairWidget(chair: chairs[index-2]),
//               if (index % 4 == 3) ChairWidget(chair: chairs[index-2]),
//               SizedBox(width: 50),

//             ],
//           );
//         }else {
//           // Display two chairs, a space of width 15, and two chairs in other rows
//           return Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               if (index % 4 == 0) ChairWidget(chair: chairs[index]),
//               if (index % 4 == 1) ChairWidget(chair: chairs[index]),
//               if (index % 4 == 0) const SizedBox(width: 15),
//               if (index % 4 == 2) ChairWidget(chair: chairs[index]),
//               if (index % 4 == 3) ChairWidget(chair: chairs[index]),
//             ],
//           );
//         }
//       },
//     );
//   }
// }



class ChairWidget extends StatefulWidget {
  final Chear chair;

  const ChairWidget({required this.chair});

  @override
  _ChairWidgetState createState() => _ChairWidgetState();
}

class _ChairWidgetState extends State<ChairWidget> {
  late Color seatColor;
    Color colorSeat(String state){
      if(state == 'yes') {
        return Colors.red;
      } else if(state == 'isBooking'){
        return Colors.grey;
      }
      else if(state == 'no' ){
      return Colors.white;}

      else {return Colors.white;}
    }

  @override
  void initState() {
    seatColor=colorSeat(widget.chair.state);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(seatColor == Colors.white){
          selectedSeats.add(widget.chair.number);
          setState(() {
            seatColor=Colors.green;
          });
        }
        else if(seatColor==Colors.green){
          selectedSeats.remove(widget.chair.number);
          setState(() {
            seatColor=Colors.white;
          });
        }
      },
      child: Container(
        width: 30,
        height: 30,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: seatColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Text(
            '${widget.chair.number}',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
// ---------------------------------------------------

class ChairGridVIP extends StatelessWidget {
  final List<Chear> chairs;
  final Bus bus;

  const ChairGridVIP({Key? key, required this.chairs, required this.bus}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, // 4 columns
        mainAxisSpacing: 30,
        crossAxisSpacing: 30,
        childAspectRatio: 1,
      ),
      itemCount: chairs.length, // Use the number of chairs from the fetched data
      itemBuilder: (context, index) {
        // Calculate the row number (1-based)
        int rowNumber = (index ~/ 3) + 1;
        int rowCount = (chairs.length / 4).ceil();

        if (rowNumber == rowCount) {
          // Display five chairs in the final row
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (index % 4 == 0) ChairWidget(chair: chairs[chairs.length-5]),
              if (index % 4 == 1) ChairWidget(chair: chairs[chairs.length-4]),
              if (index % 4 == 2) ChairWidget(chair: chairs[chairs.length-3]),
              if (index % 4 == 2) ChairWidget(chair: chairs[chairs.length-2]),
              if (index % 4 == 2) ChairWidget(chair: chairs[chairs.length-1]),
            ],
          );
        } else if (rowNumber == 7) {
          // Special case for the 7th row
          return Row(
            children: [
              if (index % 4 == 0) ChairWidget(chair: chairs[index]),
              if (index % 4 == 1) ChairWidget(chair: chairs[index]),
              if (index % 4 == 2) const SizedBox(width: 15),
              if (index % 4 == 3) const SizedBox(width: 15),
            ],
          );
        }else if(rowNumber>7){
          // Display two chairs, a space of width 15, and two chairs in other rows
          return Row(
            children: [
              if (index % 4 == 0) ChairWidget(chair: chairs[index-2]),
              if (index % 4 == 1) ChairWidget(chair: chairs[index-2]),
              if (index % 4 == 2) ChairWidget(chair: chairs[index-2]),
              if (index % 4 == 3) ChairWidget(chair: chairs[index-2]),
            ],
          );
        }else {
          // Display two chairs, a space of width 15, and two chairs in other rows
          return Row(
            children: [
              if (index % 4 == 0) ChairWidget(chair: chairs[index]),
              if (index % 4 == 1) ChairWidget(chair: chairs[index]),
              if (index % 4 == 1) const SizedBox(width: 15),
              if (index % 4 == 2) ChairWidget(chair: chairs[index]),
              if (index % 4 == 3) ChairWidget(chair: chairs[index]),
            ],
          );
        }
      },
    );
  }
}

