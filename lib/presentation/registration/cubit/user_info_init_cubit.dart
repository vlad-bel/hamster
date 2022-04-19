import 'package:bloc/bloc.dart';
import 'package:business_terminal/data/model/registration/user_info_request.dart';
import 'package:business_terminal/domain/core/errors/failures.dart';
import 'package:business_terminal/domain/service/api_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info_init_cubit.freezed.dart';

class UserInfoInitCubit extends Cubit<UserInfoInitState> {
  UserInfoInitCubit(this.apiService) : super(const UserInfoInitState.initial());

  final ApiService apiService;

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
    final response = await apiService.initUserInfoCreation(request);

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
