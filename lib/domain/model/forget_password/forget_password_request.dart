import 'package:json_annotation/json_annotation.dart';

part 'forget_password_request.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class ForgetPasswordRequest {
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'verificationMethod')
  final String verificationMethod;

  ForgetPasswordRequest(this.email, this.verificationMethod);

  factory ForgetPasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ForgetPasswordRequestToJson(this);
}
