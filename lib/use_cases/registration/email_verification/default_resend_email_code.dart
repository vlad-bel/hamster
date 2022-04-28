import 'package:business_terminal/domain/repository/api_repository.dart';
import 'package:business_terminal/domain/request_model/registration/email_verification/resend_email_code_request.dart';
import 'package:business_terminal/use_cases/registration/email_verification/resend_email_code.dart';

class DefaultResendEmailCodeUseCase implements ResendEmailCodeUseCase {
  DefaultResendEmailCodeUseCase(this.apiService);

  final ApiRepository apiService;

  @override
  Future<String> resendEmailCode(ResendEmailCodeRequest request) async {
    final response = await apiService.resendEmailCode(request);

    return response;
  }
}
