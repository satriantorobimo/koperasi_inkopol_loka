import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginAttempt extends LoginEvent {
  final String nik;
  final String password;

  LoginAttempt(this.nik, this.password);

  @override
  List<Object> get props => [];
}
