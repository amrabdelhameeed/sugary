part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthLoginSuccess extends AuthState {}

class UpdateDisplayName extends AuthState {}

class AuthLoginError extends AuthState {
  final String error;

  AuthLoginError({required this.error});
}
