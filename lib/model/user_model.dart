import 'package:waygo/model/customer.dart';

class UserModel {
  final String token;
  final Customer customer;

  UserModel.fromJson(Map<String, dynamic> data)
      : token = data['token'],
        customer = Customer.fromJson(data['profile']);

  Map<String, dynamic> toJson() => {
        'token': token,
        'profile': customer.toJson(),
      };
}
