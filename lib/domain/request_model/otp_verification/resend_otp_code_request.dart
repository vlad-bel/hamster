abstract class ResendOtpCodeRequest {
  ResendOtpCodeRequest({required this.credential});

  final String credential;

  factory ResendOtpCodeRequest.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError();
  }

  Map<String, dynamic> toJson();
}
