import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'number_code_confirmation_state.freezed.dart';

@freezed
class NumberCodeConfirmationState {
  const factory NumberCodeConfirmationState.loading() =
      LoadingNumberCodeConfirmationState;

  const factory NumberCodeConfirmationState.success() =
      SucessNumberCodeConfirmationState;

  const factory NumberCodeConfirmationState.error({required ApiFailure e}) =
      ErrorNumberCodeConfirmationState;
}
