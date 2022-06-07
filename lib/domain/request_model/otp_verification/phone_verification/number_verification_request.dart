import 'package:business_terminal/domain/request_model/otp_verification/otp_verification_request.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'number_verification_request.g.dart';

@JsonSerializable()
class NumberVerificationRequest implements OtpVerificationRequest {
  NumberVerificationRequest({
    required this.credential,
    required this.code,
  });

  @override
  @JsonKey(name: 'email')
  final String credential;

  @override
  @JsonKey(name: 'code')
  final String code;

  @override
  factory NumberVerificationRequest.fromJson(Map<String, dynamic> json) =>
      _$NumberVerificationRequestFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$NumberVerificationRequestToJson(this);
}
