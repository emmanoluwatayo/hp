// ignore_for_file: prefer_collection_literals

class LoginUser {
  String? username;
  String? password;
  String? deviceIdentifier;
  bool? registerAsNewDevice;
  String? otp;
  String? channel;

  LoginUser(
      {this.username,
      this.password,
      this.deviceIdentifier,
      this.registerAsNewDevice,
      this.otp,
      this.channel});

  LoginUser.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    deviceIdentifier = json['deviceIdentifier'];
    registerAsNewDevice = json['registerAsNewDevice'];
    otp = json['otp'];
    channel = json['channel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['username'] = username;
    data['password'] = password;
    data['deviceIdentifier'] = deviceIdentifier;
    data['registerAsNewDevice'] = registerAsNewDevice;
    data['otp'] = otp;
    data['channel'] = channel;
    return data;
  }
}
