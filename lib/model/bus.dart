class Bus {
  final int id;
  final String type;
  final int numOfSets;
  final String numberOfBus;

  Bus.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        type = json['type'],
        numOfSets = json['numOfSets'],
        numberOfBus = json['numberOfBus'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'numOfSets': numOfSets,
        'numberOfBus': numberOfBus,
      };
}

class Trip {
  final int id;
  final String companyName;
  final String from;
  final String to;
  final Bus bus;
  // final List<Chear> chear; // Change from 'cheers'
  final int ticketPrice;
  final String date;

  Trip.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        companyName = json['companyName'],
        from = json['from'],
        to = json['to'],
        bus = Bus.fromJson(json['bus']),
        ticketPrice = json['ticktPrice'],
        date = json['date'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'companyName': companyName,
        'from': from,
        'to': to,
        'ticktPrice': ticketPrice,
        'date': date,
        'trips["bus"]': bus
      };
}

class Chear {
  final int number;
  final String state;

  Chear.fromJson(Map<String, dynamic> json)
      : number = json['number'],
        state = json['isBooked'];
}

class Offer {
  late String companyName;
  late String discount;
  late String img;
}

class People{
  final String firstName;
  final String lastName;
  final String iss;

  People.fromJson(Map<String, dynamic> json)
  : firstName = json['firstName'],
    lastName = json['lastName'],
    iss = json['iss'];
}

class Reservation {
  final int tripId;
  final int totalPrice;
  final int chear; // Change from 'cheers'
  final String date;
  final String from;
  final String to;
  final String numberBus;
  final List<dynamic> myPeople;

  Reservation.fromJson(Map<String, dynamic> json)
  : tripId = json['tripId'],
    totalPrice = json['totalPrice'],
    chear = json['numberOfSets'],
    date = json['date'],
    from = json['from'],
    to = json['to'],
    numberBus= json['numberOfBus'],
    myPeople = json['myPeople'];
    
}

// this is response {tripId: 19, totalPrice: 10000, date: 2023-11-23T04:03:11.000Z, from: Homse, to: Tartous, numberOfBus: 024, numberOfSets: 2, chearNum: 2,4,
//  myPeople: [{firstName: wawa, lastName: rara, iss: 05100012163}, {firstName: soso, lastName: fofo, iss: 05100014113}]}