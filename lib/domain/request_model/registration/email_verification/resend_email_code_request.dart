import 'package:json_annotation/json_annotation.dart'; 

part 'resend_email_code_request.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class ResendEmailCodeRequest {
  @JsonKey(name: 'email')
  final  String email;

  ResendEmailCodeRequest({required this.email});

   factory ResendEmailCodeRequest.fromJson(Map<String, dynamic> json) => _$ResendEmailCodeRequestFromJson(json);

   Map<String, dynamic> toJson() => _$ResendEmailCodeRequestToJson(this);
}

