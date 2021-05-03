import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:loka_apps/model/banner/banner_response_model.dart';

abstract class BannerState extends Equatable {
  const BannerState();

  @override
  List<Object> get props => [];
}

class BannerInitial extends BannerState {}

class BannerLoading extends BannerState {}

class BannerLoaded extends BannerState {
  final BannerResponseModel bannerResponseModel;

  const BannerLoaded({@required this.bannerResponseModel})
      : assert(bannerResponseModel != null);

  @override
  List<Object> get props => [bannerResponseModel];
}

class BannerError extends BannerState {
  final String error;

  const BannerError({@required this.error}) : assert(error != null);

  @override
  List<Object> get props => [error];
}
