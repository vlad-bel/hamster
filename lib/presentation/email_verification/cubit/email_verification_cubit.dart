import 'package:bloc/bloc.dart';
import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/domain/request_model/registration/email_verification/email_verification_request.dart';
import 'package:business_terminal/domain/request_model/registration/email_verification/resend_email_code_request.dart';
import 'package:business_terminal/presentation/common/snackbar_manager.dart';
import 'package:business_terminal/use_cases/registration/email_verification/email_verification.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'email_verification_cubit.freezed.dart';

@injectable
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
      await _useCase.resendCode(request);
      emit(const EmailVerificationState.mailSent());
    } on ApiFailure catch (e) {
      displayErrorSnackbar(e);
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
        emit(EmailVerificationState.success('response', email));
      }
    } on ApiFailure catch (e) {
      onErrorVerifyMail(e);
    }
  }

  void onErrorVerifyMail(ApiFailure e) {
    if (e.response.statusCode == 400) {
      if (e.response.message is String) {
        final messageString = e.response.message as String;

        // TODO: ask backend to return different statusCodes
        // - so we don't have to parse messages

        // Check too many attempts error:
        if (messageString.contains('attempts')) {
          // React to too many attempts error:
          displayErrorSnackbar(e);
          wrongOTPCode();
        }
        // Check wrong OTP code
        else if (messageString.contains('verification code is invalid')) {
          // React to wrong OTP Code:
          wrongOTPCode();
        } else {
          displayErrorSnackbar(e);
        }
      }
    } else {
      displayErrorSnackbar(e);
    }
  }

  void displayErrorSnackbar(ApiFailure e) {
    logger.e(e);
    SnackBarManager.showError(e.response.message.toString());
    emit(const EmailVerificationState.initial());
  }
}

@freezed
class EmailVerificationState with _$EmailVerificationState {
  const factory EmailVerificationState.initial() = InitialEmailVerification;

  const factory EmailVerificationState.loading() = LoadingEmailVerification;

  const factory EmailVerificationState.wrongOTPcode() =
      WrongOTPEmailVerification;

  const factory EmailVerificationState.mailSent() = MailSent_EmailVerification;

  const factory EmailVerificationState.success(
    String response,
    String email,
  ) = SuccessEmailVerification;

  const factory EmailVerificationState.error(Failure failure) =
      ErrorEmailVerification;
}
