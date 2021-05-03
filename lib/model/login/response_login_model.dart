import 'package:json_annotation/json_annotation.dart';
part 'response_login_model.g.dart';

@JsonSerializable()
class ResponseLoginModel {
  String code;
  bool status;
  String message;
  Data data;

  ResponseLoginModel({this.code, this.status, this.message, this.data});

  factory ResponseLoginModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseLoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseLoginModelToJson(this);
}

@JsonSerializable()
class Data {
  int user_id;
  String token;
  String expired_in;

  Data({this.user_id, this.token, this.expired_in});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
