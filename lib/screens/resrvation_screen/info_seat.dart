import 'package:flutter/material.dart';
import 'package:waygo/model/bus.dart';
import 'package:waygo/model/utiles/colors.dart';
import 'package:waygo/screens/resrvation_screen/payment.dart';

class ClientInfoController {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final fatherNameController = TextEditingController();
  final motherNameController = TextEditingController();
  final issController = TextEditingController();

  final ValueNotifier<String?> gender = ValueNotifier(null);

  void changeGender(String newGender) {
    gender.value = newGender;
  }

  Map<String, dynamic> toJson() => {
    'firstNameController': firstNameController.value
  }; 

}

class SeatsInfo extends StatefulWidget {
  final List number;
  final Trip trip;
  const SeatsInfo({required this.number, required this.trip, super.key});

  @override
  State<SeatsInfo> createState() => _SeatsInfoState();
}

class _SeatsInfoState extends State<SeatsInfo> {
  PageController controller =
      PageController(viewportFraction: 1, keepPage: true);
  
  late final clientsControllers = List.generate(widget.number.length, (index) => ClientInfoController());

  List<Map<String, dynamic>> clientsInfoToJson() {
    return clientsControllers.map((e) => e.toJson()).toList();
  }

  Widget form(ClientInfoController clientController) {
    return Column(children: [
      SizedBox(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: TextField(
                      controller: clientController.firstNameController,
                      decoration: InputDecoration(
                        hintText: 'First name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: TextField(
                      controller: clientController.lastNameController,
                      decoration: InputDecoration(
                        hintText: 'Last name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: clientController.fatherNameController,
                      decoration: InputDecoration(
                        hintText: 'Father name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: clientController.motherNameController,
                      decoration: InputDecoration(
                        hintText: 'Mother name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: clientController.issController,
                      decoration: InputDecoration(
                        hintText: 'ISS',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ValueListenableBuilder<String?>(
                    valueListenable: clientController.gender,
                    builder: (context, gender, child) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [

                 Padding(
                         padding: EdgeInsets.all(8.0), child: IconButton(icon: Icon(Icons.female), color: gender == 'male' ? UltColor.green : null,onPressed: () {
                           clientController.changeGender('male');
                         },)),
                Padding(
                        padding: EdgeInsets.all(8.0), child: IconButton(icon: Icon(Icons.female), color: gender == 'female' ? UltColor.green : null, onPressed: () {
                          clientController.changeGender('female');
                        },)),
                        ],
                      );
                    }
                  ),
                ),
              ],
            ),
          ],
        ),
      )
    ]);
  }

  int pageNumber = 1;

  @override
  Widget build(BuildContext context) {
    print(widget.number);
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
              "Passenger Details",
              style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold,
                  color: UltColor.green,
                  fontSize: 24),
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.15,
                decoration: BoxDecoration(
                    color: UltColor.blue,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(150),
                        bottomRight: Radius.circular(150))),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Text(
                    "Please fill information for ${widget.number.length} seats",
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily: "Quicksand",
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.095,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                color: Colors.grey,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.0018,
              ),
              //// here you have to put the TextFild
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
                child: PageView.builder(
                  itemCount: widget.number.length,
                  controller: controller,
                  onPageChanged: (index) {
                    setState(() {
                      pageNumber = index +1;
                    });
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return form(clientsControllers[index]);
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.015,
              ),
              Container(
                color: Colors.grey,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.0028,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        controller.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease);
                      },
                      icon: const Icon(Icons.arrow_back)),
                  Text(
                    "$pageNumber/${widget.number.length}",
                    style: TextStyle(
                        fontFamily: "Quicksand",
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: UltColor.blue),
                  ),
                  IconButton(
                      onPressed: () {
                        controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease);
                      },
                      icon: const Icon(Icons.arrow_forward))
                ],
              ),
              Container(
                color: Colors.grey,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.0028,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
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
                                  builder: (context) => PaymentPage(
                                      trip: widget.trip,
                                      number: widget.number)),
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
      ),
    );
  }
}
