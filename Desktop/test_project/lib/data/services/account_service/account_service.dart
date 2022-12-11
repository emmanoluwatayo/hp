import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_project/models/login_request.dart';
import '../../../network/network.dart';

final authServiceProvider = Provider((ref) {
  final dioProvider = ref.watch(networkProvider);
  return AuthService(dio: dioProvider.dio);
});

class AuthService {
  final Dio dio;
  AuthService({
    required this.dio,
  });

  Future createAccount(LoginRequest loginRequest) async {
    const url = Endpoints.users;
    try {
      final res = await dio.post(url, data: loginRequest.toJson());
      final result = res.data;
      return result;
    } on DioError catch (e) {
      final errorMessage = " The error message is: ${e.response!.data}";

      throw errorMessage;
    }
  }
}
