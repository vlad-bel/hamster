// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_failure_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiFailureResponse _$ApiFailureResponseFromJson(Map<String, dynamic> json) =>
    ApiFailureResponse(
      statusCode: json['statusCode'] as int,
      message: json['message'],
      error: json['error'] as String?,
    );

Map<String, dynamic> _$ApiFailureResponseToJson(ApiFailureResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'error': instance.error,
    };
