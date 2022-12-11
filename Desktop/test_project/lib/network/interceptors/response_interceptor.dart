// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiInterceptor extends Interceptor {
  @override
  Future<dynamic> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // final token = PreferenceManager.authToken;

    // if (options.path.contains("files")) {
    //   options.headers.remove("Authorization");
    //   options.contentType = "multipart/form-data";
    //   options.headers = {"client-id": "mizala"};
    // } else {
    //   options.headers.addAll({
    //     "Authorization": "Bearer $token",
    //     "version": "1.0.0+2",
    //     "platform": PreferenceManager.deviceName,
    //     "os": PreferenceManager.deviceOS,
    //     "platform_user": "user app"
    //   });
    // }
    debugPrint("Headers");
    print(options.headers);
    options.headers.forEach((k, v) => debugPrint('$k: $v'));
    if (options.queryParameters != {}) {
      debugPrint("queryParameters:");
      options.queryParameters.forEach((k, v) => debugPrint('$k: $v'));
    }
    if (options.data != null) {
      debugPrint("Body: ${options.data}");
    }
    debugPrint(
        "--> END ${options.method != "" ? options.method.toUpperCase() : 'METHOD'}");

    // options.headers.addAll({"X-Api-Key": "${Globals.xAPIKey}"});

    return super.onRequest(options, handler);
  }
}

@override
Future onResponse(Response response, ResponseInterceptorHandler handler) async {
  debugPrint("Headers:");
  response.headers.forEach((k, v) => debugPrint('$k: $v'));
  debugPrint("Response: ${response.data}");
  debugPrint("<-- END HTTP");
  // }
  return handler.next(response);
}
