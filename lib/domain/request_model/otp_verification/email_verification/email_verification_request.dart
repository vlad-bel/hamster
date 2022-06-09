import 'package:business_terminal/domain/request_model/otp_verification/otp_verification_request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'email_verification_request.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class EmailVerificationRequest implements OtpVerificationRequest {
  EmailVerificationRequest({required this.credential, required this.code});

  @override
  @JsonKey(name: 'email')
  final String credential;

  @override
  @JsonKey(name: 'code')
  final String code;

  @override
  factory EmailVerificationRequest.fromJson(Map<String, dynamic> json) =>
      _$EmailVerificationRequestFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$EmailVerificationRequestToJson(this);
}
