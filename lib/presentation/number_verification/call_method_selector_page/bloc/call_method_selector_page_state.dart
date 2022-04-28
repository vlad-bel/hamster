import 'package:business_terminal/domain/request_model/number_verification/verify_phone_request.dart';
import 'package:equatable/equatable.dart';

class CallMethodSelectorPageState extends Equatable {
  const CallMethodSelectorPageState({
    required this.smsSelected,
  });

  final bool smsSelected;

  @override
  List<Object?> get props => [];
}

class GoNextState extends CallMethodSelectorPageState {
  const GoNextState({
    required bool smsSelected,
    required this.method,
  }) : super(smsSelected: smsSelected);

  final VerifyMethod method;
}
