import 'package:bloc/bloc.dart';
import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/domain/model/login/login_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'add_payment_cubit.freezed.dart';

@injectable
class AddPaymentCubit extends Cubit<AddPaymentState> {
  AddPaymentCubit() : super(const AddPaymentState.initial());
}

@freezed
class AddPaymentState with _$AddPaymentState {
  const factory AddPaymentState.error(ApiFailure failure) = ErrorAddPayment;

  const factory AddPaymentState.initial() = InitialAddPayment;

  const factory AddPaymentState.loading() = LoadingAddPayment;

  const factory AddPaymentState.success(LoginResponse response) =
      SuccessAddPayment;

  const factory AddPaymentState.wrongAccountOwner() =
      WrongAccountOwnerAddPayment;

  const factory AddPaymentState.wrongIbanNumber() = WrongIbanNumberAddPayment;
}
