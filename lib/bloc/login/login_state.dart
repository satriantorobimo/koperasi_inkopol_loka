import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:loka_apps/model/login/response_login_model.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginLoaded extends LoginState {
  final ResponseLoginModel ressponseLoginModel;

  const LoginLoaded({@required this.ressponseLoginModel})
      : assert(ressponseLoginModel != null);

  @override
  List<Object> get props => [ressponseLoginModel];
}

class LoginError extends LoginState {
  final String error;

  const LoginError({@required this.error}) : assert(error != null);

  @override
  List<Object> get props => [error];
}
