import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  const UserEntity({
    required this.id,
    required this.name,
    required this.username,
    required this.password,
    this.isLoggedIn = false,
  });

  final int id;
  final String name;
  final String username;
  final String password;
  final bool isLoggedIn;

  @override
  List<Object?> get props => [id, name, username, password, isLoggedIn];
}
