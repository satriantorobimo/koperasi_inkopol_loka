// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseProfileModel _$ResponseProfileModelFromJson(Map<String, dynamic> json) {
  return ResponseProfileModel(
    code: json['code'] as String,
    status: json['status'] as bool,
    message: json['message'] as String,
    data: json['data'] == null
        ? null
        : Data.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ResponseProfileModelToJson(
        ResponseProfileModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    id: json['id'] as int,
    batch_code: json['batch_code'] as String,
    nik: json['nik'] as String,
    fullname: json['fullname'] as String,
    company_id: json['company_id'] as int,
    phone: json['phone'] as String,
    email: json['email'] as String,
    bank_account: json['bank_account'] as String,
    bank: json['bank'] as String,
    bank_account_name: json['bank_account_name'] as String,
    sallary: json['sallary'] as int,
    sallary_deduction: json['sallary_deduction'] as int,
    loan_limit: json['loan_limit'] as int,
    status_employee: json['status_employee'] as String,
    date_employee: json['date_employee'] as String,
    status: json['status'] as int,
    created_at: json['created_at'] as String,
    updated_at: json['updated_at'] as String,
    deleted_at: json['deleted_at'] as String,
    photo_profile: json['photo_profile'] as String,
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'batch_code': instance.batch_code,
      'nik': instance.nik,
      'fullname': instance.fullname,
      'company_id': instance.company_id,
      'phone': instance.phone,
      'email': instance.email,
      'bank_account': instance.bank_account,
      'bank': instance.bank,
      'bank_account_name': instance.bank_account_name,
      'sallary': instance.sallary,
      'sallary_deduction': instance.sallary_deduction,
      'loan_limit': instance.loan_limit,
      'status_employee': instance.status_employee,
      'date_employee': instance.date_employee,
      'status': instance.status,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'deleted_at': instance.deleted_at,
      'photo_profile': instance.photo_profile,
    };
