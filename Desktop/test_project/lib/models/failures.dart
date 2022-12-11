// To parse this JSON data, do
//
//     final failureRes = failureResFromJson(jsonString);

import 'dart:convert';

FailureRes failureResFromJson(String str) =>
    FailureRes.fromJson(json.decode(str));

String failureResToJson(FailureRes data) => json.encode(data.toJson());

class FailureRes {
  FailureRes({
    // required this.status,
    required this.error,
  });

  // String status;
  String error;

  factory FailureRes.fromJson(Map<String, dynamic> json) => FailureRes(
        // status: json["status"],
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        // "status": status,
        "error": error,
      };
}
