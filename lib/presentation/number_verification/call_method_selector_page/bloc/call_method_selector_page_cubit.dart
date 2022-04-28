import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/domain/request_model/number_verification/verify_phone_request.dart';
import 'package:business_terminal/presentation/common/snackbar_manager.dart';
import 'package:business_terminal/presentation/number_verification/call_method_selector_page/bloc/call_method_selector_page_state.dart';
import 'package:business_terminal/use_cases/number_verification/number_verification_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CallMethodSelectorPageCubit extends Cubit<CallMethodSelectorPageState> {
  CallMethodSelectorPageCubit({
    required this.useCase,
  }) : super(
          const CallMethodSelectorPageState(
            smsSelected: false,
          ),
        );

  final NumberVerificationUseCase useCase;

  void switchSelector(bool smsSelected) {
    emit(CallMethodSelectorPageState(smsSelected: smsSelected));
  }

  Future sendCallMethod({
    required String email,
    required VoidCallback goNext,
  }) async {
    try {
      final verifyMethod =
          state.smsSelected ? VerifyMethod.sms : VerifyMethod.phoneCall;
      await useCase.verifyPhoneBy(
        method: verifyMethod,
        email: email,
      );
      goNext.call();
    } on ApiFailure catch (e) {
      SnackBarManager.showError(e.response.message);
    }
  }
}
