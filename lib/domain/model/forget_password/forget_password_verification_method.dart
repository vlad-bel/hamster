import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum ForgetPasswordVerificationMethod {
  @JsonValue('EMAIL')
  email,
  @JsonValue('SMS')
  sms,
  @JsonValue('PHONE_CALL')
  phoneCall
}
