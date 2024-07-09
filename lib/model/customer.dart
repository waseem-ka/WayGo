class Customer {
  final int id;
  final String phoneNumber;
  final String firstName;
  final String lastName;
  final String fatherName;
  final String motherName;
  final String iss;
  final String gender;

  Customer.fromJson(Map<String, dynamic> data)
      : id = data['id'],
        phoneNumber = data['phoneNumber'],
        firstName = data['firstName'],
        lastName = data['lastName'],
        fatherName = data['fatherName'],
        motherName = data['motherName'],
        gender = data['gender'],
        iss = data['iss'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'fatherName': fatherName,
        'motherName': motherName,
        'iss': iss,
        'gender': gender,
        'phoneNumber': phoneNumber,
      };
}
//  data = new Customer();
//     data?.firstName = json["profile"]["firstName"];
//     data?.lastName = json["profile"]["lastName"];
//     data?.fatherName = json["profile"]["fatherName"];
//     data?.motherName = json["profile"]["motherName"];
//     data?.gander = json["profile"]["gander"];
//     data?.iss = json["profile"]["iss"];
//     data?.id = json["profile"]["id"];
//     data?.phoneNumber = json["profile"]["phoneNumber"];
