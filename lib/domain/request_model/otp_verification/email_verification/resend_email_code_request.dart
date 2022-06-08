import 'package:business_terminal/domain/request_model/otp_verification/resend_otp_code_request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'resend_email_code_request.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class ResendEmailCodeRequest implements ResendOtpCodeRequest {
  ResendEmailCodeRequest({required this.credential});

  @override
  @JsonKey(name: 'email')
  final String credential;

  @override
  factory ResendEmailCodeRequest.fromJson(Map<String, dynamic> json) =>
      _$ResendEmailCodeRequestFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ResendEmailCodeRequestToJson(this);
}
