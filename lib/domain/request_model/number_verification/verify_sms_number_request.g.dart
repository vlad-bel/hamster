// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_sms_number_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifySmsNumberRequest _$VerifySmsNumberRequestFromJson(
        Map<String, dynamic> json) =>
    VerifySmsNumberRequest(
      email: json['email'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$VerifySmsNumberRequestToJson(
        VerifySmsNumberRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'code': instance.code,
    };
