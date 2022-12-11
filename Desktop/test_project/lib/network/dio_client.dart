import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:test_project/network/interceptors/interceptors.dart';
import 'package:test_project/network/network.dart';

final networkProvider = Provider((ref) {
  return DioClient(ref);
});

class DioClient {
  final Ref ref;
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: Endpoints.baseURL,
      connectTimeout: Endpoints.connectionTimeout,
      receiveTimeout: Endpoints.receiveTimeout,
    ),
  );
  DioClient(
    this.ref,
  ) {
    dio.interceptors.addAll([
      PrettyDioLogger(),
      AuthorizationInterceptor(),
      LoggerInterceptor(),
    ]);
  }

  // Future<User?> getUser({required int id}) async {
  //   try {
  //     final response = await _dio.get('${Endpoints.users}/$id');
  //     return User.fromJson(response.data);
  //   } on DioError catch (err) {
  //     final errorMessage = DioException.fromDioError(err).toString();
  //     throw errorMessage;
  //   } catch (e) {
  //     throw e.toString();
  //   }
  // }

  // Future createUser(String email, String password) async {
  //   Map data = {"username": email, "password": password};
  //   try {
  //     final response = await dio.post(Endpoints.users, data: data);
  //     return response.data;
  //   } on DioError catch (err) {
  //     final errorMessage = " The error message is: ${err.response!.data}";
  //     return errorMessage;
  //   } catch (e) {
  //     throw e.toString();
  //   }
  // }

  Future<void> deleteUser({required int id}) async {
    try {
      await dio.delete('${Endpoints.users}/$id');
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      throw errorMessage;
    } catch (e) {
      throw e.toString();
    }
  }
}
