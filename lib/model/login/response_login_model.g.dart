// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseLoginModel _$ResponseLoginModelFromJson(Map<String, dynamic> json) {
  return ResponseLoginModel(
    code: json['code'] as String,
    status: json['status'] as bool,
    message: json['message'] as String,
    data: json['data'] == null
        ? null
        : Data.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ResponseLoginModelToJson(ResponseLoginModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    user_id: json['user_id'] as int,
    token: json['token'] as String,
    expired_in: json['expired_in'] as String,
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'user_id': instance.user_id,
      'token': instance.token,
      'expired_in': instance.expired_in,
    };
