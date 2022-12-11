import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_project/data/repositories/AccountRepo/i_auth_manager.dart';
import 'package:test_project/models/login_request.dart';

import '../../services/account_service/account_service.dart';

final authManagerProvider = Provider((ref) {
  final serviceProvicer = ref.watch(authServiceProvider);
  return AuthManager(authService: serviceProvicer, ref: ref);
});

class AuthManager extends IAuthManager {
  final AuthService authService;
  final Ref ref;
  AuthManager({
    required this.authService,
    required this.ref,
  });

  @override
  Future createAccount(LoginRequest loginRequest) async {
    final result = await authService.createAccount(loginRequest);
    return result;
  }
}
