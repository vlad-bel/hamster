import 'package:json_annotation/json_annotation.dart';

part 'email_verification_request.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class EmailVerificationRequest {
  EmailVerificationRequest({required this.email, required this.code});

  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'code')
  final String code;

  factory EmailVerificationRequest.fromJson(Map<String, dynamic> json) =>
      _$EmailVerificationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$EmailVerificationRequestToJson(this);
}
