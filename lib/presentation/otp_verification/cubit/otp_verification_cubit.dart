import 'package:bloc/bloc.dart';
import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/domain/request_model/otp_verification/email_verification/email_verification_request.dart';
import 'package:business_terminal/domain/request_model/otp_verification/email_verification/resend_email_code_request.dart';
import 'package:business_terminal/presentation/common/snackbar_manager.dart';
import 'package:business_terminal/use_cases/otp_verification/email_verification/email_verification.dart';
import 'package:business_terminal/use_cases/otp_verification/number_verification/number_verification_use_case.dart';
import 'package:business_terminal/use_cases/otp_verification/otp_verification_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'otp_verification_cubit.freezed.dart';

@injectable
class EmailVerificationCubit extends OtpVerificationCubit {
  EmailVerificationCubit({required this.useCase}) : super(useCase);

  @override
  final EmailVerificationUseCase useCase;

  @override
  Future resendOtpCode(String email) async {
    emit(const OtpVerificationState.loading());
    final request = ResendEmailCodeRequest(
      credential: email,
    );

    try {
      await useCase.resendCode(request);
      emit(const OtpVerificationState.mailSent());
    } on ApiFailure catch (e) {
      displayErrorSnackbar(e);
    }
  }

  @override
  Future<void> verifyByOTPCode(String email, String otpCode) async {
    emit(const OtpVerificationState.loading());

    try {
      final request = EmailVerificationRequest(
        credential: email,
        code: otpCode,
      );
      final response = await useCase.verifyEmail(request);

      logger.d('response: $response');

      if (response == 'OK') {
        emit(OtpVerificationState.success('response', email));
      }
    } on ApiFailure catch (e) {
      onErrorVerifyMail(e);
    }
  }
}

@injectable
class NumberVerificationCubit extends OtpVerificationCubit {
  NumberVerificationCubit({required this.useCase}) : super(useCase);

  @override
  final NumberVerificationUseCase useCase;

  @override
  Future resendOtpCode(String email) async {
    emit(const OtpVerificationState.loading());
    final request = ResendEmailCodeRequest(
      credential: email,
    );

    try {
      await useCase.resendCode(request);
      emit(const OtpVerificationState.mailSent());
    } on ApiFailure catch (e) {
      displayErrorSnackbar(e);
    }
  }

  @override
  Future<void> verifyByOTPCode(String email, String otpCode) async {
    emit(const OtpVerificationState.loading());

    try {
      final request = EmailVerificationRequest(
        credential: email,
        code: otpCode,
      );
      final response = await useCase.verifyEmail(request);

      logger.d('response: $response');

      if (response == 'OK') {
        emit(OtpVerificationState.success('response', email));
      }
    } on ApiFailure catch (e) {
      onErrorVerifyMail(e);
    }
  }
}

@factoryMethod
abstract class OtpVerificationCubit extends Cubit<OtpVerificationState> {
  OtpVerificationCubit(this.useCase)
      : super(
          const OtpVerificationState.initial(),
        );

  final OtpVerificationUseCase useCase;

  Future resendOtpCode(String email);

  void wrongOTPCode() {
    emit(const OtpVerificationState.wrongOTPCode());
  }

  void errorOccurred(Failure e) {
    emit(OtpVerificationState.error(e));
  }

  Future<void> verifyByOTPCode(String email, String otpCode);

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
    emit(const OtpVerificationState.initial());
  }
}

@freezed
class OtpVerificationState with _$OtpVerificationState {
  const factory OtpVerificationState.initial() = InitialOtpVerification;

  const factory OtpVerificationState.loading() = LoadingOtpVerification;

  const factory OtpVerificationState.wrongOTPCode() = WrongOtpVerification;

  const factory OtpVerificationState.mailSent() = MailSentOtpVerification;

  const factory OtpVerificationState.success(
    String response,
    String email,
  ) = SuccessOtpVerification;

  const factory OtpVerificationState.error(Failure failure) =
      ErrorOtpVerification;
}
