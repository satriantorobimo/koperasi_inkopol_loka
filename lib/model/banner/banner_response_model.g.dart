// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerResponseModel _$BannerResponseModelFromJson(Map<String, dynamic> json) {
  return BannerResponseModel(
    code: json['code'] as String,
    status: json['status'] as bool,
    message: json['message'] as String,
    data: (json['data'] as List)
        ?.map(
            (e) => e == null ? null : Data.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$BannerResponseModelToJson(
        BannerResponseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    id: json['id'] as int,
    image: json['image'] as String,
    url: json['url'] as String,
    title: json['title'] as String,
    status: json['status'] as int,
    created_at: json['created_at'] as String,
    updated_at: json['updated_at'] as String,
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'url': instance.url,
      'title': instance.title,
      'status': instance.status,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };
