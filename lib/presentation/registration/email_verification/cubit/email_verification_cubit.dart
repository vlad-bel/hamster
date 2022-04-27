import 'package:bloc/bloc.dart';
import 'package:business_terminal/data/model/registration/email_verification/email_verification_request.dart';
import 'package:business_terminal/data/model/registration/email_verification/resend_email_code_request.dart';
import 'package:business_terminal/domain/core/errors/failures.dart';
import 'package:business_terminal/domain/dependency_injection/di.dart';
import 'package:business_terminal/domain/use_cases/registration/email_verification/email_verification.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_verification_cubit.freezed.dart';

class EmailVerificationCubit extends Cubit<EmailVerificationState> {
  EmailVerificationCubit(this._useCase)
      : super(
          const EmailVerificationState.initial(),
        );

  final EmailVerificationUseCase _useCase;

  Future resendEmailCode(String email) async {
    emit(const EmailVerificationState.loading());
    final request = ResendEmailCodeRequest(
      email: email,
    );

    try {
      final response = await _useCase.resendCode(request);
      emit(const EmailVerificationState.mailSent());
    } on DioError catch (e) {
      logger.e(e);
      emit(EmailVerificationState.error(ApiFailure(e, 'resendEmailCode')));
    }
  }

  void wrongOTPCode() {
    emit(const EmailVerificationState.wrongOTPcode());
  }

  void errorOccurred(Failure e) {
    emit(EmailVerificationState.error(e));
  }

  Future<void> verifyEmailByOTPCode(String email, String otpCode) async {
    emit(const EmailVerificationState.loading());

    try {
      final request = EmailVerificationRequest(
        email: email,
        code: otpCode,
      );
      final response = await _useCase.verifyEmail(request);

      logger.d('response: $response');

      if (response == 'OK') {
        emit(const EmailVerificationState.success('response'));
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 400) {
        wrongOTPCode();
      } else {
        logger.e(e);
        emit(EmailVerificationState.error(ApiFailure(e, 'resendEmailCode')));
      }
    }
  }
}

@freezed
class EmailVerificationState with _$EmailVerificationState {
  const factory EmailVerificationState.initial() = InitialEmailVerification;

  const factory EmailVerificationState.loading() = LoadingEmailVerification;

  const factory EmailVerificationState.wrongOTPcode() =
      WrongOTPEmailVerification;

  const factory EmailVerificationState.mailSent() = MailSent_EmailVerification;

  const factory EmailVerificationState.success(String response) =
      SuccessEmailVerification;

  const factory EmailVerificationState.error(Failure failure) =
      ErrorEmailVerification;
}
