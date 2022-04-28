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
  final String error;

  factory ApiFailureResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiFailureResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ApiFailureResponseToJson(this);
}
