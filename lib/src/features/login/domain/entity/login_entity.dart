import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  const LoginEntity({required this.username, required this.password});

  final String username;
  final String password;

  @override
  List<Object?> get props => [username, password];
}
