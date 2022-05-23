import 'package:json_annotation/json_annotation.dart';

part 'forget_password_send_code_request.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class ForgetPasswordSendCodeRequest {
  ForgetPasswordSendCodeRequest(this.email, this.code);

  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'code')
  final String code;

  factory ForgetPasswordSendCodeRequest.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordSendCodeRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ForgetPasswordSendCodeRequestToJson(this);
}
