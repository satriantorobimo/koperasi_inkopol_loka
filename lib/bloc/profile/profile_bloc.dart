import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:loka_apps/model/profile/response_profile_model.dart';
import 'package:loka_apps/repo/profile/profile_repo.dart';
import 'bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({@required this.profileRepository})
      : assert(profileRepository != null),
        super(ProfileInitial());

  ProfileRepository profileRepository;
  ResponseProfileModel responseProfileModel;

  @override
  Stream<ProfileState> mapEventToState(
    ProfileEvent event,
  ) async* {
    if (event is GetProfile) {
      yield ProfileInitial();
      try {
        responseProfileModel = await profileRepository.getProfile(event.token);
        if (responseProfileModel.code == '200') {
          yield ProfileLoaded(responseProfileModel: responseProfileModel);
        } else {
          yield ProfileError(error: 'expired');
        }
      } catch (e) {
        yield ProfileError(error: 'error');
      }
    }
  }
}
