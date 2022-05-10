// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_phone_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatePhoneRequest _$CreatePhoneRequestFromJson(Map<String, dynamic> json) =>
    CreatePhoneRequest(
      phone: json['phone'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$CreatePhoneRequestToJson(CreatePhoneRequest instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'email': instance.email,
    };
