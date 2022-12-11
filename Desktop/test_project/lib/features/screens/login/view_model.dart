import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_project/data/controller/generic_state_notifier.dart';
import 'package:test_project/models/login_request.dart';

import '../../../data/repositories/AccountRepo/auth_implementation.dart';

final createAccountProvider =
    StateNotifierProvider.autoDispose<CreateAccountVM, RequestState>(
  (ref) => CreateAccountVM(ref),
);

class CreateAccountVM extends RequestStateNotifier {
  final AuthManager _authManager;

  CreateAccountVM(Ref ref) : _authManager = ref.read(authManagerProvider);

  void createAccount(LoginRequest loginRequest) => makeRequest(() {
        return _authManager.createAccount(loginRequest);
      });
}
