import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/domain/request_model/otp_verification/phone_verification/verify_phone_request.dart';
import 'package:business_terminal/presentation/common/snackbar_manager.dart';
import 'package:business_terminal/presentation/number_verification/call_method_selector_page/bloc/call_method_selector_page_state.dart';
import 'package:business_terminal/use_cases/number_verification/number_verification_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class CallMethodSelectorPageCubit extends Cubit<CallMethodSelectorPageState> {
  CallMethodSelectorPageCubit({
    required this.useCase,
  }) : super(
          const CallMethodSelectorPageState(
            smsSelected: false,
          ),
        );

  final NumberVerificationUseCase useCase;

  void switchSelector({
    required bool smsSelected,
  }) {
    emit(CallMethodSelectorPageState(smsSelected: smsSelected));
  }

  Future sendCallMethod({
    required String email,
  }) async {
    try {
      final verificationMethod =
          state.smsSelected ? VerifyMethod.sms : VerifyMethod.phoneCall;

      await useCase.verifyPhoneBy(
        method: verificationMethod,
        email: email,
      );

      emit(
        GoNextState(
          smsSelected: state.smsSelected,
          method: verificationMethod,
        ),
      );
    } on ApiFailure catch (e) {
      SnackBarManager.showError(e.response.message.toString());
    }
  }
}
