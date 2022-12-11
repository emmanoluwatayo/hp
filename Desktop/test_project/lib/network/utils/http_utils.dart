import 'dart:io';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:test_project/network/utils/utils.dart';

class HttpUtils {
  static final BaseOptions options = BaseOptions(
    connectTimeout: 999990,
    receiveTimeout: 89250,
  );

  static Dio getInstance() {
    Dio dio = Dio(options)
      ..interceptors.addAll([
        PrettyDioLogger(
            requestBody: true,
            requestHeader: true,
            responseBody: true,
            responseHeader: false,
            compact: false,
            error: true,
            maxWidth: 90)
      ]);
    return dio;
  }

  static Future<DioError> buildErrorResponse(DioError err) async {
    switch (err.type) {
      case DioErrorType.connectTimeout:
        if (await ConnectionUtils.getActiveStatus()) {
          err.error = HttpErrorStrings.connectionTimeOutActive;
        } else {
          err.error = HttpErrorStrings.connectionTimeOutNotActive;
        }
        break;
      case DioErrorType.sendTimeout:
        err.error = HttpErrorStrings.sendTimeOut;
        break;
      case DioErrorType.receiveTimeout:
        err.error = HttpErrorStrings.receiveTimeOut;
        break;
      case DioErrorType.response:
        if (err.response!.statusCode == HttpStatus.badRequest) {
          err.error = err.response!.data.toString();
        } else if (err.response!.statusCode == HttpStatus.unauthorized) {
          err.error = 'Unauthorized';
        } else {
          err.error = HttpErrorStrings.badResponse;
        }
        break;
      case DioErrorType.cancel:
        err.error = HttpErrorStrings.operationCancelled;
        break;
      case DioErrorType.other:
        if (!await ConnectionUtils.getActiveStatus()) {
          err.error = HttpErrorStrings.defaultResponse;
        } else {
          err.error = HttpErrorStrings.badResponse;
        }
        break;
      default:
        err.error = HttpErrorStrings.unknown;
        break;
    }

    return err;
  }
}
