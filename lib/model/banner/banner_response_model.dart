import 'package:json_annotation/json_annotation.dart';
part 'banner_response_model.g.dart';

@JsonSerializable()
class BannerResponseModel {
  String code;
  bool status;
  String message;
  List<Data> data;

  BannerResponseModel({this.code, this.status, this.message, this.data});

  factory BannerResponseModel.fromJson(Map<String, dynamic> json) =>
      _$BannerResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$BannerResponseModelToJson(this);
}

@JsonSerializable()
class Data {
  int id;
  String image;
  String url;
  String title;
  int status;
  String created_at;
  String updated_at;

  Data(
      {this.id,
      this.image,
      this.url,
      this.title,
      this.status,
      this.created_at,
      this.updated_at});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
