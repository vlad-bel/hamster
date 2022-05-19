// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forget_password_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgetPasswordRequest _$ForgetPasswordRequestFromJson(
        Map<String, dynamic> json) =>
    ForgetPasswordRequest(
      json['email'] as String,
      json['verificationMethod'] as String,
    );

Map<String, dynamic> _$ForgetPasswordRequestToJson(
        ForgetPasswordRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'verificationMethod': instance.verificationMethod,
    };
