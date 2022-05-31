import 'package:business_terminal/domain/model/forget_password/forget_password_verification_method.dart';
import 'package:json_annotation/json_annotation.dart';

part 'forget_password_request.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class ForgetPasswordRequest {
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'verificationMethod')
  final ForgetPasswordVerificationMethod verificationMethod;
  @JsonKey(name: 'phoneNumber', includeIfNull: false)
  final String? phoneNumber;

  ForgetPasswordRequest({
    required this.email,
    required this.verificationMethod,
    this.phoneNumber,
  });

  factory ForgetPasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ForgetPasswordRequestToJson(this);
}
