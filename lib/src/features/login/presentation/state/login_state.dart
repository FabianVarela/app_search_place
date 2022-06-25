import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _LoginStateInitial;

  const factory LoginState.loading() = _LoginStateLoading;

  const factory LoginState.success() = _LoginStateSuccess;

  const factory LoginState.error([String? error]) = _LoginStateError;
}

extension LoginStateX on LoginState {
  bool get isLoading => this is _LoginStateLoading;

  bool get isSuccess => this is _LoginStateSuccess;

  bool get isError => this is _LoginStateError;
}
