part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginRequested extends AuthEvent {
  final String email;
  final String password;

  const LoginRequested(this.email, this.password);
}

class RegisterRequested extends AuthEvent {
  final String email;
  final String password;

  const RegisterRequested(this.email, this.password);
}

class LogoutRequested extends AuthEvent {}