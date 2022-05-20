import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/domain/request_model/number_verification/verify_phone_request.dart';
import 'package:business_terminal/presentation/number_verification/number_code_confirmation/cubit/number_code_confirmation_state.dart';
import 'package:business_terminal/use_cases/number_verification/number_verification_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class NumberCodeConfirmationCubit extends Cubit<NumberCodeConfirmationState> {
  NumberCodeConfirmationCubit({
    required this.useCase,
  }) : super(const NumberCodeConfirmationState.init());

  final NumberVerificationUseCase useCase;

  Future sendConfirmationCode({
    required String email,
    required String code,
  }) async {
    try {
      emit(const NumberCodeConfirmationState.loading());
      await useCase.verifyNumber(
        email: email,
        code: code,
      );
      emit(
        const NumberCodeConfirmationState.success(),
      );
    } on ApiFailure catch (e) {
      emit(NumberCodeConfirmationState.codeError(e: e));
    }
  }

  Future resendVerificationCode({
    required String email,
    required VerifyMethod method,
  }) async {
    try {
      emit(const NumberCodeConfirmationState.loading());
      await useCase.resendSMSCode(
        email: email,
        method: method,
      );
      emit(
        const NumberCodeConfirmationState.resend(),
      );
    } on ApiFailure catch (e) {
      emit(NumberCodeConfirmationState.resendError(e: e));
    }
  }
}
