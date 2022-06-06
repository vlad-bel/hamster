import 'package:bloc/bloc.dart';
import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/domain/model/login/login_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'enter_email_cubit.freezed.dart';

@injectable
class EnterEmailCubit extends Cubit<EnterEmailState> {
  EnterEmailCubit() : super(const EnterEmailState.initial());
}

@freezed
class EnterEmailState with _$EnterEmailState {
  const factory EnterEmailState.error(ApiFailure failure) = ErrorEnterEmail;

  const factory EnterEmailState.initial() = InitialEnterEmail;

  const factory EnterEmailState.loading() = LoadingEnterEmail;

  const factory EnterEmailState.success(LoginResponse response) =
      SuccessEnterEmail;
}
