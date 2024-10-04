import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/core/utils/secure_storage.dart';
import 'package:todo_list/feature/login/data/models/login_success.dart';
import 'package:todo_list/feature/login/data/models/register_success.dart';
import 'package:todo_list/feature/login/data/repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc(this._authRepository) : super(AuthInitial()) {
    on<AuthButtonPressed>(_onLoginButtonPressed);
    on<AuthRegister>(_onRegisterButtonPressed);
    on<AuthLogout>(_onLogoutButtonPressed);
  }

  void _onLoginButtonPressed(
    AuthButtonPressed event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      final user = await _authRepository.login(event.username, event.password);
      SecureStorage().writeData(
        key: 'token',
        value: user.data.token,
      );
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  void _onRegisterButtonPressed(
    AuthRegister event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    log("$event");
    try {
      final status = await _authRepository.register(
        event.email,
        event.password,
        event.username,
      );
      emit(
        RegisterComplete(
          status,
        ),
      );
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  void _onLogoutButtonPressed(
    AuthLogout event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthInitial());
  }
}
