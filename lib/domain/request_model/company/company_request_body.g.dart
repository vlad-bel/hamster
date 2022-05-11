// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyRequestBody _$CompanyRequestBodyFromJson(Map<String, dynamic> json) =>
    CompanyRequestBody(
      companyName: json['companyName'] as String,
      city: json['city'] as String,
      streetName: json['streetName'] as String,
      streetNumber: json['streetNumber'] as String,
      postalCode: json['postalCode'] as String,
      country: json['country'] as String,
      countryCode: json['countryCode'] as String,
    );

Map<String, dynamic> _$CompanyRequestBodyToJson(CompanyRequestBody instance) =>
    <String, dynamic>{
      'companyName': instance.companyName,
      'city': instance.city,
      'streetName': instance.streetName,
      'streetNumber': instance.streetNumber,
      'postalCode': instance.postalCode,
      'country': instance.country,
      'countryCode': instance.countryCode,
    };
