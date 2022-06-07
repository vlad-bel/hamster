import 'package:business_terminal/domain/request_model/otp_verification/otp_verification_request.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_sms_number_request.g.dart';

@JsonSerializable()
class VerifySmsNumberRequest implements OtpVerificationRequest {
  VerifySmsNumberRequest({
    required this.credential,
    required this.code,
  });

  @override
  @JsonKey(name: 'email')
  final String credential;

  @override
  @JsonKey(name: 'code')
  final String code;

  factory VerifySmsNumberRequest.fromJson(Map<String, dynamic> json) =>
      _$VerifySmsNumberRequestFromJson(json);

  Map<String, dynamic> toJson() => _$VerifySmsNumberRequestToJson(this);
}
