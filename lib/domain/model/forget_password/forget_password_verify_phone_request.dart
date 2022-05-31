import 'package:business_terminal/domain/model/forget_password/forget_password_verification_method.dart';
import 'package:json_annotation/json_annotation.dart';

part 'forget_password_verify_phone_request.g.dart';

@JsonSerializable()
class ForgetPasswordVerifyPhoneRequest {
  ForgetPasswordVerifyPhoneRequest({
    required this.method,
    required this.email,
  });

  @JsonKey(name: 'verificationMethod')
  final ForgetPasswordVerificationMethod method;

  @JsonKey(name: 'email')
  final String email;

  factory ForgetPasswordVerifyPhoneRequest.fromJson(
          Map<String, dynamic> json) =>
      _$ForgetPasswordVerifyPhoneRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ForgetPasswordVerifyPhoneRequestToJson(this);
}
