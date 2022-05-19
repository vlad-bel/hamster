import 'package:bloc/bloc.dart';
import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/domain/model/login/login_request.dart';
import 'package:business_terminal/domain/model/login/login_response.dart';
import 'package:business_terminal/domain/repository/token/token_repository.dart';
import 'package:business_terminal/presentation/common/snackbar_manager.dart';
import 'package:business_terminal/use_cases/login/login_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'add_payment_cubit.freezed.dart';

@injectable
class AddPaymentCubit extends Cubit<AddPaymentState> {
  AddPaymentCubit() : super(AddPaymentState.initial());

}

@freezed
class AddPaymentState with _$AddPaymentState {
  const factory AddPaymentState.initial() = InitialAddPayment;

  const factory AddPaymentState.loading() = LoadingAddPayment;

  const factory AddPaymentState.success(LoginResponse response) =
      SuccessAddPayment;

  const factory AddPaymentState.wrongAccountOwner() =
      WrongAccountOwnerAddPayment;

  const factory AddPaymentState.wrongIbanNumber() = WrongIbanNumberAddPayment;

  const factory AddPaymentState.error(ApiFailure failure) = ErrorAddPayment;
}
