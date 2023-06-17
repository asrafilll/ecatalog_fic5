part of 'authentication_bloc.dart';

abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class RegisterLoading extends AuthenticationState {}

class RegisterSuccess extends AuthenticationState {
  final RegisterResponseModel data;

  RegisterSuccess({required this.data});
}

class RegisterFailed extends AuthenticationState {
  final String errorMessage;

  RegisterFailed({required this.errorMessage});
}
