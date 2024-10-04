part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {}

class AuthButtonPressed extends AuthEvent {
  final String username;
  final String password;

  AuthButtonPressed({
    required this.username,
    required this.password,
  });

  @override
  List<Object> get props => [username, password];
}

class AuthRegister extends AuthEvent {
  final String email;
  final String password;
  final String username;

  AuthRegister({
    required this.email,
    required this.password,
    required this.username,
  });

  @override
  List<Object> get props => [email, password, username];
}

class AuthLogout extends AuthEvent {
  @override
  List<Object> get props => [];
}
