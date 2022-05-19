// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forget_password_send_code_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgetPasswordSendCodeRequest _$ForgetPasswordSendCodeRequestFromJson(
        Map<String, dynamic> json) =>
    ForgetPasswordSendCodeRequest(
      json['email'] as String,
      json['code'] as String,
    );

Map<String, dynamic> _$ForgetPasswordSendCodeRequestToJson(
        ForgetPasswordSendCodeRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'code': instance.code,
    };
