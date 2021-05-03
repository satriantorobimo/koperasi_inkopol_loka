import 'package:flutter/rendering.dart';
import 'package:json_annotation/json_annotation.dart';
part 'response_profile_model.g.dart';

@JsonSerializable()
class ResponseProfileModel {
  String code;
  bool status;
  String message;
  Data data;

  ResponseProfileModel({this.code, this.status, this.message, this.data});

  factory ResponseProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseProfileModelToJson(this);
}

@JsonSerializable()
class Data {
  int id;
  String batch_code;
  String nik;
  String fullname;
  int company_id;
  String phone;
  String email;
  String bank_account;
  String bank;
  String bank_account_name;
  int sallary;
  int sallary_deduction;
  int loan_limit;
  String status_employee;
  String date_employee;
  int status;
  String created_at;
  String updated_at;
  String deleted_at;
  String photo_profile;

  Data(
      {this.id,
      this.batch_code,
      this.nik,
      this.fullname,
      this.company_id,
      this.phone,
      this.email,
      this.bank_account,
      this.bank,
      this.bank_account_name,
      this.sallary,
      this.sallary_deduction,
      this.loan_limit,
      this.status_employee,
      this.date_employee,
      this.status,
      this.created_at,
      this.updated_at,
      this.deleted_at,
      this.photo_profile});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}