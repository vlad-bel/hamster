import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/presentation/number_verification/number_code_confirmation/cubit/number_code_confirmation_state.dart';
import 'package:business_terminal/use_cases/number_verification/number_verification_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NumberCodeConfirmationCubit extends Cubit<NumberCodeConfirmationState> {
  NumberCodeConfirmationCubit({
    required this.useCase,
  }) : super(const NumberCodeConfirmationState.success());

  final NumberVerificationUseCase useCase;

  Future sendConfirmationCode({
    required String email,
    required String code,
  }) async {
    try {
      emit(const NumberCodeConfirmationState.loading());
      final response = await useCase.verifyNumber(
        email: email,
        code: code,
      );
    } on ApiFailure catch (e) {
      emit(NumberCodeConfirmationState.error(e: e));
    }
  }

  void resendVerificationCode() {}
}
