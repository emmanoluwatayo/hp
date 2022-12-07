import 'package:dio/dio.dart';
import 'package:test_project/network/interceptors/interceptors.dart';
import 'package:test_project/network/network.dart';

class DioClient {
  DioClient()
      : _dio = Dio(
          BaseOptions(
            baseUrl: Endpoints.baseURL,
            connectTimeout: Endpoints.connectionTimeout,
            receiveTimeout: Endpoints.receiveTimeout,
            responseType: ResponseType.json,
          ),
        )..interceptors.addAll([
            AuthorizationInterceptor(),
            LoggerInterceptor(),
          ]);

  late final Dio _dio;

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

  Future createUser(String email, String password) async {
    Map data = {"username": email, "password": password};
    try {
      final response = await _dio.post(Endpoints.users, data: data);
      return response.data;
    } on DioError catch (err) {
      final errorMessage = err.response!.data;
      return errorMessage;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> deleteUser({required int id}) async {
    try {
      await _dio.delete('${Endpoints.users}/$id');
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      throw errorMessage;
    } catch (e) {
      throw e.toString();
    }
  }
}
