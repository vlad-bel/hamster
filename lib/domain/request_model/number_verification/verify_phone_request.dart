import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_phone_request.g.dart';

enum VerifyMethod {
  phoneCall,
  sms,
}

extension VerifyMethodExtension on VerifyMethod {
  String get string {
    switch (this) {
      case VerifyMethod.phoneCall:
        return 'PHONE_CALL';
      case VerifyMethod.sms:
        return 'SMS';
    }
  }

  static VerifyMethod fromString(String method) {
    switch (method) {
      case 'PHONE_CALL':
        return VerifyMethod.phoneCall;
      default:
        return VerifyMethod.sms;
    }
  }
}

@JsonSerializable()
class VerifyPhoneRequest {
  VerifyPhoneRequest({
    required this.verifyMethod,
    required this.email,
  });

  @JsonKey(name: 'verificationMethod')
  final String verifyMethod;
  @JsonKey(name: 'email')
  final String email;

  factory VerifyPhoneRequest.fromJson(Map<String, dynamic> json) =>
      _$VerifyPhoneRequestFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyPhoneRequestToJson(this);
}
