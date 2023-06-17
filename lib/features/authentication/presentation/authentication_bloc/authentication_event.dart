part of 'authentication_bloc.dart';

abstract class AuthenticationEvent {}

class RegisterEvent extends AuthenticationEvent {
  final RegisterRequestModel data;

  RegisterEvent({required this.data});
}

class LoginEvent extends AuthenticationEvent {
  final LoginRequestModel data;

  LoginEvent({required this.data});
}
