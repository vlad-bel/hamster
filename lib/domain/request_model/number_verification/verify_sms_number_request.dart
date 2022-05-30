import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_sms_number_request.g.dart';

@JsonSerializable()
class VerifySmsNumberRequest {
  VerifySmsNumberRequest({
    required this.email,
    required this.code,
  });

  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'code')
  final String code;

  factory VerifySmsNumberRequest.fromJson(Map<String, dynamic> json) =>
      _$VerifySmsNumberRequestFromJson(json);

  Map<String, dynamic> toJson() => _$VerifySmsNumberRequestToJson(this);
}
