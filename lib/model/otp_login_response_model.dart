import 'dart:convert';

OtpLoginResponseModel loginResponseJson(String str) =>
    OtpLoginResponseModel.fromJson(json.decode(str));

OtpLoginResponseModel otpLoginResponseJSON(var str) =>
    OtpLoginResponseModel.fromJson(json.decode(str));

class OtpLoginResponseModel {
  OtpLoginResponseModel(
      {required this.message, required this.data, required this.otp});
  late final String? message;
  late final String? data;
  late final String? otp;

  @override
  String toString() {
    return "message: $message || data: $data || otp: $otp";
  }

  OtpLoginResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    otp = json['otp'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['data'] = data;
    _data['otp'] = otp;
    return _data;
  }
}
