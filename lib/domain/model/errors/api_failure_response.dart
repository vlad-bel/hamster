import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_failure_response.g.dart';

@JsonSerializable()
class ApiFailureResponse {
  ApiFailureResponse({
    required this.statusCode,
    required this.message,
    required this.error,
  });

  @JsonKey(name: 'statusCode')
  final int statusCode;
  @JsonKey(name: 'message')
  final dynamic message;
  @JsonKey(name: 'error')
  final String? error;

  factory ApiFailureResponse.fromJson(DioError error) {
    if (error.response != null) {
      dynamic data = error.response!.data;
      if (data is String) {
        data = jsonDecode(data);
      }

      return _$ApiFailureResponseFromJson(
        data as Map<String, dynamic>,
      );
    }

    return _$ApiFailureResponseFromJson(<String, dynamic>{
      'statusCode': 0,
      'message': error.error,
      'error': 'unexpected error',
    });
  }

  Map<String, dynamic> toJson() => _$ApiFailureResponseToJson(this);
}
