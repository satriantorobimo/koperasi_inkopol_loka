import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class GetProfile extends ProfileEvent {
  final String token;

  GetProfile(this.token);
  @override
  List<Object> get props => [];
}
