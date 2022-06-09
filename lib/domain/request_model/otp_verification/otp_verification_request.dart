abstract class OtpVerificationRequest {
  OtpVerificationRequest({required this.credential, required this.code});

  final String credential;
  final String code;

  factory OtpVerificationRequest.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError();
  }

  Map<String, dynamic> toJson();
}
