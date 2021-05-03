import 'package:equatable/equatable.dart';

abstract class BannerEvent extends Equatable {
  const BannerEvent();

  @override
  List<Object> get props => [];
}

class GetBanner extends BannerEvent {
  @override
  List<Object> get props => [];
}
