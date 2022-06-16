import 'package:bloc/bloc.dart';
import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/domain/request_model/otp_verification/email_verification/resend_email_code_request.dart';
import 'package:business_terminal/presentation/common/snackbar_manager.dart';
import 'package:business_terminal/use_cases/otp_verification/email_verification/email_verification.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'enter_email_cubit.freezed.dart';

@injectable
class EnterEmailCubit extends Cubit<EnterEmailState> {
  EnterEmailCubit({required this.useCase})
      : super(const EnterEmailState.initial());

  final EmailVerificationUseCase useCase;

  Future resendOtpCode(String email) async {
    emit(const EnterEmailState.loading());
    final request = ResendEmailCodeRequest(
      credential: email,
    );

    try {
      await useCase.resendCode(request);
      emit(const EnterEmailState.success());
    } on ApiFailure catch (e) {
      displayErrorSnackbar(e);
    }
  }

  void displayErrorSnackbar(ApiFailure e) {
    logger.e(e);
    SnackBarManager.showError(e.response.message.toString());
    emit(const EnterEmailState.initial());
  }
}

@freezed
class EnterEmailState with _$EnterEmailState {
  const factory EnterEmailState.error(ApiFailure failure) = ErrorEnterEmail;

  const factory EnterEmailState.initial() = InitialEnterEmail;

  const factory EnterEmailState.loading() = LoadingEnterEmail;

  const factory EnterEmailState.success() = SuccessEnterEmail;
}
