import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_app/src/features/register/domain/entity/register_entity.dart';
import 'package:my_app/src/features/register/domain/repository/register_repository.dart';
import 'package:my_app/src/features/register/presentation/state/register_state.dart';

class RegisterViewModel extends StateNotifier<RegisterState> {
  RegisterViewModel(
    this._registerRepo, [
    super.state = const RegisterState.initial(),
  ]);

  late final RegisterRepository _registerRepo;

  Future<void> register(String name, String username, String password) async {
    try {
      state = const RegisterState.loading();
      await _registerRepo.registerUser(
        RegisterEntity(name: name, username: username, password: password),
      );
      state = const RegisterState.success();
    } on Exception catch (_) {
      state = const RegisterState.error();
    }
  }
}
