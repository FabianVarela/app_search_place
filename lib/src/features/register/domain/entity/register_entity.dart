import 'package:equatable/equatable.dart';

class RegisterEntity extends Equatable {
  const RegisterEntity({
    required this.name,
    required this.username,
    required this.password,
  });

  final String name;
  final String username;
  final String password;

  @override
  List<Object?> get props => [name, username, password];
}
