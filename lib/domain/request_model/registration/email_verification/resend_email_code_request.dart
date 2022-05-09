import 'package:json_annotation/json_annotation.dart';

part 'resend_email_code_request.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class ResendEmailCodeRequest {
  ResendEmailCodeRequest({required this.email});

  factory ResendEmailCodeRequest.fromJson(Map<String, dynamic> json) =>
      _$ResendEmailCodeRequestFromJson(json);

  @JsonKey(name: 'email')
  final String email;

  Map<String, dynamic> toJson() => _$ResendEmailCodeRequestToJson(this);
}
