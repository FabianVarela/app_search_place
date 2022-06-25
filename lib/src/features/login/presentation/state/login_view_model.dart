import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_app/src/features/login/domain/entity/login_entity.dart';
import 'package:my_app/src/features/login/domain/repository/login_repository.dart';
import 'package:my_app/src/features/login/presentation/state/login_state.dart';

class LoginViewModel extends StateNotifier<LoginState> {
  LoginViewModel(this._loginRepo, [super.state = const LoginState.initial()]);

  late final LoginRepository _loginRepo;

  Future<void> loginUser(String username, String password) async {
    try {
      state = const LoginState.loading();
      final result = await _loginRepo.loginUser(
        LoginEntity(username: username, password: password),
      );
      
      state = result != null
          ? const LoginState.success()
          : const LoginState.error();
    } on Exception catch (_) {
      state = const LoginState.error();
    }
  }
}
