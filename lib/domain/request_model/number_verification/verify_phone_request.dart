import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_phone_request.g.dart';

enum VerifyMethod {
  phoneCall,
  sms,
}

extension Ext on VerifyMethod {
  String get string {
    switch (this) {
      case VerifyMethod.phoneCall:
        return 'PHONE_CALL';
      case VerifyMethod.sms:
        return 'SMS';
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
