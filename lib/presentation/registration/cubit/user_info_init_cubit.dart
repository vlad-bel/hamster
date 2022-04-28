import 'package:bloc/bloc.dart';
import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/domain/request_model/registration/user_info_request.dart';
import 'package:business_terminal/use_cases/registration/user_info_init/user_info_init.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'user_info_init_cubit.freezed.dart';

@injectable
class UserInfoInitCubit extends Cubit<UserInfoInitState> {
  UserInfoInitCubit(this._useCase) : super(const UserInfoInitState.initial());

  final UserInfoInitUseCase _useCase;

  Future<void> iniUserInfoCreation(
    String? name,
    String? surname,
    String? email,
    String? password,
  ) async {
    try {
      emit(const UserInfoInitState.loading());

      final request = UserInfoRequest(
        email: email ?? '',
        password: password ?? '',
        name: name ?? '',
        surname: surname ?? '',
      );

      logger.d('Request: ${request.toJson()}');
      final response = await _useCase.initUserInfoCreation(request);

      logger.d(response);

      emit(UserInfoInitState.success(response));
    } on ApiFailure catch (e) {
      logger.e(e);
      emit(
        UserInfoInitState.error(
          ApiFailure(e.response, 'iniUserInfoCreation'),
        ),
      );
    }
  }

  void setVisibilityPasswordValidation({required bool isVisible}) {
    emit(
      UserInfoInitState.initial(shouldShowPasswordValidationWidget: isVisible),
    );
  }
}

@freezed
class UserInfoInitState with _$UserInfoInitState {
  const factory UserInfoInitState.initial({
    @Default(false) bool shouldShowPasswordValidationWidget,
  }) = InitialUserInfoInit;

  const factory UserInfoInitState.loading() = LoadingUserInfoInit;

  const factory UserInfoInitState.success(String response) =
      SuccessUserInfoInit;

  const factory UserInfoInitState.error(Failure failure) = ErrorUserInfoInit;
}
