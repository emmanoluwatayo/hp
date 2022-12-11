import 'package:test_project/models/login_request.dart';

abstract class IAuthManager {
  Future createAccount(LoginRequest loginRequest);
}
