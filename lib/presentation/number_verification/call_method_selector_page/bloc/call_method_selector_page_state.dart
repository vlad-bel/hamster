import 'package:business_terminal/domain/request_model/otp_verification/phone_verification/verify_phone_request.dart';
import 'package:equatable/equatable.dart';

class CallMethodSelectorPageState extends Equatable {
  const CallMethodSelectorPageState({
    required this.smsSelected,
  });

  final bool smsSelected;

  @override
  List<Object?> get props => [smsSelected];
}

class GoNextState extends CallMethodSelectorPageState {
  const GoNextState({
    required super.smsSelected,
    required this.method,
  });

  final VerifyMethod method;
}
