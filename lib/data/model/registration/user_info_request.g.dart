// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfoRequest _$UserInfoRequestFromJson(Map<String, dynamic> json) =>
    UserInfoRequest(
      email: json['email'] as String,
      password: json['password'] as String,
      name: json['name'] as String,
      surname: json['surname'] as String,
    );

Map<String, dynamic> _$UserInfoRequestToJson(UserInfoRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'name': instance.name,
      'surname': instance.surname,
    };
