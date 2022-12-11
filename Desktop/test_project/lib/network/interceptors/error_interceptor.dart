import 'package:dio/dio.dart';

import '../utils/utils.dart';

class ErrorInterceptor extends Interceptor {
  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    err = await HttpUtils.buildErrorResponse(err);
    if (err.requestOptions.path ==
            "https://core.development.4traderx.com/login" &&
        err.response?.statusCode == 403) {
      return super.onError(err, handler);
    }
  }
}
