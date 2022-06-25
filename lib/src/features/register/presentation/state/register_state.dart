import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_state.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState.initial() = _RegisterStateInitial;

  const factory RegisterState.loading() = _RegisterStateLoading;

  const factory RegisterState.success() = _RegisterStateSuccess;

  const factory RegisterState.error([String? error]) = _RegisterStateError;
}

extension RegisterStateX on RegisterState {
  bool get isLoading => this is _RegisterStateLoading;

  bool get isSuccess => this is _RegisterStateSuccess;

  bool get isError => this is _RegisterStateError;
}
