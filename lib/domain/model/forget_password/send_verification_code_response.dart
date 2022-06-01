import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_verification_code_response.g.dart';

@JsonSerializable()
class SendVerificationCodeResponse {
  @JsonKey(name: 'phone')
  final String? maskedPhone;

  SendVerificationCodeResponse([this.maskedPhone]);

  factory SendVerificationCodeResponse.fromJson(Map<String, dynamic> json) =>
      _$SendVerificationCodeResponseFromJson(json);
}
