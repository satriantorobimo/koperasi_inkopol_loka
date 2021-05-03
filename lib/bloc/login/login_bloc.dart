import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:loka_apps/repo/login/login_repo.dart';
import 'package:loka_apps/model/login/response_login_model.dart';
import 'bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({@required this.loginRepository})
      : assert(loginRepository != null),
        super(LoginInitial());

  LoginRepository loginRepository;
  ResponseLoginModel responseLoginModel;

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginAttempt) {
      yield LoginLoading();
      try {
        responseLoginModel =
            await loginRepository.loginAttempt(event.nik, event.password);
        if (responseLoginModel.data != null)
          yield LoginLoaded(ressponseLoginModel: responseLoginModel);
        else
          yield LoginError(error: 'Email atau Password anda masukkan Salah');
      } catch (e) {
        yield LoginError(error: 'Email atau Password anda masukkan Salah');
      }
    }
  }
}
