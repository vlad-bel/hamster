import 'package:bloc/bloc.dart';
import 'package:business_terminal/data/model/registration/user_info_request.dart';
import 'package:business_terminal/domain/core/errors/failures.dart';
import 'package:business_terminal/domain/use_cases/user_info_init_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info_init_cubit.freezed.dart';

class UserInfoInitCubit extends Cubit<UserInfoInitState> {
  UserInfoInitCubit(this.useCase) : super(const UserInfoInitState.initial());

  final UserInfoInitUseCase useCase;

  Future<void> iniUserInfoCreation(
    String name,
    String surname,
    String email,
    String password,
  ) async {
    emit(const UserInfoInitState.loading());

    final request = UserInfoRequest(
      email: email,
      password: password,
      name: name,
      surname: surname,
    );
    final response = await useCase.initUserInfoCreation(request);

    emit(UserInfoInitState.success(response));
  }
}

@freezed
class UserInfoInitState with _$UserInfoInitState {
  const factory UserInfoInitState.initial() = InitialUserInfoInit;

  const factory UserInfoInitState.loading() = LoadingUserInfoInit;

  const factory UserInfoInitState.success(String response) =
      SuccessUserInfoInit;

  const factory UserInfoInitState.error(Failure failure) = ErrorUserInfoInit;
}
