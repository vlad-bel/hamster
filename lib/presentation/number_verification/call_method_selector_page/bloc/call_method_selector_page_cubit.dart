import 'package:business_terminal/presentation/number_verification/call_method_selector_page/bloc/call_method_selector_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CallMethodSelectorPageCubit extends Cubit<CallMethodSelectorPageState> {
  CallMethodSelectorPageCubit()
      : super(
          CallMethodSelectorPageState(
            smsSelected: false,
          ),
        );

  void switchSelector(bool smsSelected) {
    emit(CallMethodSelectorPageState(smsSelected: smsSelected));
  }
}
