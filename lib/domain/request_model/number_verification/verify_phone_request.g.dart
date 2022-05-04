// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_phone_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyPhoneRequest _$VerifyPhoneRequestFromJson(Map<String, dynamic> json) =>
    VerifyPhoneRequest(
      verifyMethod: json['verificationMethod'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$VerifyPhoneRequestToJson(VerifyPhoneRequest instance) =>
    <String, dynamic>{
      'verificationMethod': instance.verifyMethod,
      'email': instance.email,
    };
