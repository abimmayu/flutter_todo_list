part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthSuccess extends AuthState {
  final LoginSuccess status;
  AuthSuccess(this.status);

  @override
  List<Object> get props => [status];
}

class RegisterComplete extends AuthState {
  final RegisterSuccess status;
  RegisterComplete(this.status);

  @override
  List<Object> get props => [status];
}

class AuthFailure extends AuthState {
  final String message;
  AuthFailure(this.message);

  @override
  List<Object> get props => [message];
}

class AuthLoading extends AuthState {}
