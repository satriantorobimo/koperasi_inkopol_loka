import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:loka_apps/model/profile/response_profile_model.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final ResponseProfileModel responseProfileModel;

  const ProfileLoaded({@required this.responseProfileModel})
      : assert(responseProfileModel != null);

  @override
  List<Object> get props => [responseProfileModel];
}

class ProfileError extends ProfileState {
  final String error;

  const ProfileError({@required this.error}) : assert(error != null);

  @override
  List<Object> get props => [error];
}
