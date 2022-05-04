// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_number_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyNumberResponse _$VerifyNumberResponseFromJson(
        Map<String, dynamic> json) =>
    VerifyNumberResponse(
      id: json['_id'] as String,
      email: json['email'] as String,
      passwordHash: json['passwordHash'] as String,
      name: json['name'] as String,
      surname: json['surname'] as String,
      phone: json['phone'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$VerifyNumberResponseToJson(
        VerifyNumberResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'email': instance.email,
      'passwordHash': instance.passwordHash,
      'name': instance.name,
      'surname': instance.surname,
      'phone': instance.phone,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
