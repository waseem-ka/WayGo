import 'package:dio/dio.dart';
import 'package:waygo/api/api_url.dart';
import 'package:waygo/model/user_model.dart';

class Register {
  final dio = Dio(
    BaseOptions(
      baseUrl: APIUrl.baseURL,
    ),
  );

  Future<UserModel> register({
    required String firstName,
    required String lastName,
    required String fatherName,
    required String motherName,
    required String iss,
    required String gender,
    required String phoneNumber,
  }) async {
    final response = await dio.post('/customer/register', data: {
      'firstName': firstName,
      'lastName': lastName,
      'fatherName': fatherName,
      'motherName': motherName,
      'iss': iss,
      'gender': gender,
      'phoneNumber': phoneNumber,
    });
    return UserModel.fromJson(response.data);
  }

// this function for update the user controller or to login and get the information of the user
  Future<UserModel> updateUserController({
    required String firstName,
    required String lastName,
    required String fatherName,
    required String motherName,
    required String iss,
    required String gender,
    required String phoneNumber,
  }) async {
    print("dio............///.....  $dio");
    final response = await dio.post('/customer/register', data: {
      'firstName': firstName,
      'lastName': lastName,
      'fatherName': fatherName,
      'motherName': motherName,
      'iss': iss,
      'gender': gender,
      'phoneNumber': phoneNumber,
    });
    return UserModel.fromJson(response.data);
  }
}
