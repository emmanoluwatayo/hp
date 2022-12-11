import 'dart:convert';

LoginRequest loginRequestFromJson(String str) =>
    LoginRequest.fromJson(json.decode(str));

String loginRequestToJson(LoginRequest data) => json.encode(data.toJson());

class LoginRequest {
  LoginRequest(
      {required this.username,
      required this.password,
      this.deviceIdentifier = "dev-from-mobile",
      this.registerAsNewDevice = false,
      this.otp = "",
      this.channel = "MOBILE"});

  String username;
  String password;
  String deviceIdentifier;
  bool registerAsNewDevice;
  String otp;
  String channel;

  factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
      username: json["username"],
      password: json["password"],
      deviceIdentifier: json["deviceIdentifier"],
      registerAsNewDevice: json["registerAsNewDevice"],
      otp: json["otp"],
      channel: json["channel"]);

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "deviceIdentifier": deviceIdentifier,
        "registerAsNewDevice": registerAsNewDevice,
        "otp": otp,
        "channel": channel,
      };
}
