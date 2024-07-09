import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:waygo/controllers/local_storage.dart';
import 'package:waygo/model/bus.dart';
import 'package:waygo/model/config.dart';
import 'package:waygo/model/user_model.dart';
import 'otp_login_response_model.dart';
import 'package:waygo/api/api_url.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class APIService {
  static var client = http.Client();
  static Future<OtpLoginResponseModel> otpLogin(String mobileNumber) async {
    Map<String, String> requestHeader = {'Content-Type': 'application/json'};
    var url = Uri.http(Config.apiUrl, Config.otpLoginAPI);

    var response = await client.post(url,
        headers: requestHeader,
        body: jsonEncode(
          {"phoneNumber": mobileNumber},
        ));
    return otpLoginResponseJSON(response.body);
  }

  static Future<dynamic> verifyOTP(
      String mobileNo, String otpHash, String otpCode) async {
    Map<String, String> requestHeader = {'Content-Type': 'application/json'};
    var url = Uri.http(Config.apiUrl, Config.otpVerifyAPI);

    var response = await client.post(url,
        headers: requestHeader,
        body: jsonEncode(
          {
            "phoneNumber": mobileNo,
            "otp": otpCode,
            "hash": otpHash,
          },
        ));
    debugPrint(response.body);
    Map<String, dynamic> mapRespnse = jsonDecode(response.body);
    if (mapRespnse.containsKey("message")) {
      return otpLoginResponseJSON(response.body);
    } else {
      UserModel user = UserModel.fromJson(mapRespnse);
      await LocalStorage.setString(
        'user',
        json.encode(user.toJson()),
      );
    }
  }
}

/// Moaz code:
class ApiService {
  
  final String baseUrl;
  static final _dio = Dio(
    BaseOptions(
      baseUrl: APIUrl.baseURL,
    ),
  );

  ApiService(this.baseUrl);

  static Future<Response> post(String path, Map<String, dynamic> data) async {
    final response = await _dio.post(path, data: data);
    return response;
  }

  static Future<Response> getTripData(
      String from, String to, String date) async {
    final dio = Dio();
    debugPrint("$from / $to / $date");

    final response = await dio.post(
      APIUrl.search, // Replace with your API endpoint
      data: {
        'from': from,
        'to': to,
        'date': date,
      },
    );

    if (response.statusCode == 200) {
      // Request was successful, you can handle the response here
      debugPrint('Response data: ${response.data}');
    } else {
      // Handle errors or non-200 status codes
      debugPrint('Error: ${response.statusCode}');
    }
    return response;
  }

  static Future bookChear(String tripId, List<dynamic> chEars) async {
    Dio dio = Dio();
    try {
      String? user = LocalStorage.getString("user");
      dynamic json = jsonDecode(user!);
      debugPrint("token ${json['token']}");
      dio.options.headers['Authorization'] = json['token'];

      Response response = await dio.post(
        APIUrl.bookChear,
        data: {
          'tripId': tripId,
          'chear': chEars,
        },
      );

      if (response.statusCode == 200) {
        // Request was successful, handle response here
        debugPrint('Booking success: ${response.data}');
      } else {
        // Handle errors or non-200 status codes
        debugPrint('Error: ${response.statusCode}');
        debugPrint('Error message: ${response.data}');
      }
    } catch (e) {
      // Handle Dio errors or network issues
      debugPrint('Error: $e');
    }
  }

    static Future<List<Chear>> getChear(String id) async {
    Dio dio = Dio();
    try {
      String? user = LocalStorage.getString("user");
      dynamic json = jsonDecode(user!);
      debugPrint("token ${json['token']}");
      dio.options.headers['Authorization'] = json['token'];
      Response response = await dio.get("${APIUrl.getChear}/$id");
      if (response.statusCode == 200) {
        // Parse the data from the "chear" array in the response
        final List<Map<String, dynamic>> jsonData = List<Map<String, dynamic>>.from(response.data["chear"]);
        List<Chear> chEars = jsonData.map((data) => Chear.fromJson(data)).toList();
        return chEars;
      } else {
        // Handle errors or non-200 status codes
        debugPrint('Error: ${response.statusCode}');
        debugPrint('Error message: ${response.data}');
        return []; // Return an empty list or handle the error as needed
      }
    } catch (e) {
      // Handle Dio errors or network issues
      debugPrint('Error: $e');
      return []; // Return an empty list or handle the error as needed
    }
  }

  
// Function to update the user's profile
  static Future<Response> updateProfile({
    String? phoneNumber,
    String? firstName,
    String? lastName,
    String? fatherName,
    String? motherName,
    String? gender,
    String? iss,
  }) async {
    final dio = Dio();
    try {
      String? user = LocalStorage.getString("user");
      dynamic json = jsonDecode(user!);
      debugPrint("token ${json['token']}");
      // Set the authorization header with the user's token
       dio.options.headers['Authorization'] = json['token'];
      // Define the request body with the data to update
      final Map<String, dynamic> requestBody = {
        if (phoneNumber != null) 'phoneNumber': phoneNumber,
        if (firstName != null) 'firstName': firstName,
        if (lastName != null) 'lastName': lastName,
        if (fatherName != null) 'fatherName': fatherName,
        if (motherName != null) 'motherName': motherName,
        if (gender != null) 'gender': gender,
        if (iss != null) 'iss': iss,
      };
      final Response response = await dio.put(
        APIUrl.updateProfile, // Replace with your actual endpoint
        data: requestBody,
      );
      if (response.statusCode == 200) {
        // Request was successful, handle the response here
        debugPrint('Profile updated: ${response.data}');
        return response;
      } else {
        // Handle errors or non-200 status codes
        debugPrint('Error: ${response.statusCode}');
        debugPrint('Error message: ${response.data}');
        return response;
      }
    } catch (e) {
      // Handle Dio errors or network issues
      debugPrint('Error: $e');
      rethrow;
    }
  }

  static Future<Response> getReservation() async {
    Dio dio = Dio();
      try{
        String? user = LocalStorage.getString("user");
        dynamic json = jsonDecode(user!);
        debugPrint("token Reservation: ${json['token']}");
        dio.options.headers['Authorization'] = json['token'];
        Response response = await dio.get(APIUrl.myReservation);
        if (response.statusCode == 200) {
          // return the data of response
          return response;
        } 
        else {
          // Handle errors or non-200 status codes
          debugPrint('Error: ${response.statusCode}');
          debugPrint('Error message: ${response.data}');
          return response; 
        }
      }catch (e) {
      // Handle Dio errors or network issues
      debugPrint('Error: $e');
      rethrow;
    }
  }

    static Future<Response> getHistory() async {
    Dio dio = Dio();
    
      String? user = LocalStorage.getString("user");
      dynamic json = jsonDecode(user!);
      debugPrint("token Reservation: ${json['token']}");
      dio.options.headers['Authorization'] = json['token'];
      Response response = await dio.get(APIUrl.myHistory);
      if (response.statusCode == 200) {
        // return the data of response
        return response;
      } else {
        // Handle errors or non-200 status codes
        debugPrint('Error: ${response.statusCode}');
        debugPrint('Error message: ${response.data}');
        return response; 
      }
  }
  



  //// Fatora Services
  
  Future createPayment()async{
    Dio dio = Dio();
    try{
      Response response= await dio.post(APIUrl.createPayment);
    return response;
    }
    catch(e){
      return e;
    }
  }


  static IO.Socket openSocket() {
    // return IO.io('http://172.20.10.2:19991');
    return IO.io(
      'ws://172.20.10.2:19991',
      IO.OptionBuilder().setTransports(['websocket']).build()
    );
  }
}
