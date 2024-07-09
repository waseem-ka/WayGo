import 'dart:convert';
import 'package:get/get.dart';
import 'package:waygo/controllers/local_storage.dart';
import 'package:waygo/model/api_service.dart';
import 'package:waygo/model/user_model.dart';

class UserController extends GetxController {
  static const _userKey = 'user';

  UserModel? _user;
  UserModel? get user => _user;

  bool get isLoggedIn => _user != null;

  UserController() {
    initialize();
  }

  void initialize() {
    final userJson = LocalStorage.getString(_userKey);
    if (userJson != null) {
      final userMap = json.decode(userJson);
      _user = UserModel.fromJson(userMap);
      update();
    }
  }

  Future<void> register({
    required String firstName,
    required String lastName,
    required String fatherName,
    required String motherName,
    required String iss,
    required String gender,
    required String phoneNumber,
  }) async {
    final data = {
      'firstName': firstName,
      'lastName': lastName,
      'fatherName': fatherName,
      'motherName': motherName,
      'iss': iss,
      'gender': gender,
      'phoneNumber': phoneNumber,
    };
    final response = await ApiService.post('/customer/register', data);
    _user = UserModel.fromJson(response.data);
    await LocalStorage.setString(
      _userKey,
      json.encode(_user!.toJson()),
    );

    print("keeeeeeeeeeeey $_userKey");
    print("tokkkkkken ${LocalStorage.getString("token")}");
    update();
  }
}
