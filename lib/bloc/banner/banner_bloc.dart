import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:loka_apps/model/banner/banner_response_model.dart';
import 'package:loka_apps/repo/banner/banner_repo.dart';
import 'bloc.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  BannerBloc({@required this.bannerRepository})
      : assert(bannerRepository != null),
        super(BannerInitial());

  BannerRepository bannerRepository;
  BannerResponseModel bannerResponseModel;

  @override
  Stream<BannerState> mapEventToState(
    BannerEvent event,
  ) async* {
    if (event is GetBanner) {
      yield BannerLoading();
      try {
        bannerResponseModel = await bannerRepository.getBanner();
        if (bannerResponseModel.data != null) {
          yield BannerLoaded(bannerResponseModel: bannerResponseModel);
        } else
          yield BannerError(error: 'no-data');
      } catch (e) {
        yield BannerError(error: 'error');
      }
    }
  }
}
