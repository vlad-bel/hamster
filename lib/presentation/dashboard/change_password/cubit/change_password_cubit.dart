import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/presentation/dashboard/change_password/cubit/change_password_state.dart';
import 'package:business_terminal/use_cases/change_password/change_password_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  final ChangePasswordUseCase _changePasswordUseCase;

  ChangePasswordCubit(this._changePasswordUseCase)
      : super(ChangePasswordState.initial());

  Future<void> changePassword(String oldPassword, String newPassword) async {
    try {
      await _changePasswordUseCase.changePassword(oldPassword, newPassword);
      emit(ChangePasswordState.success());
    } on ApiFailure catch (e) {
      if (e.response.statusCode == 404) {
        emit(ChangePasswordState.currentPasswordIncorrect());
        return;
      }

      emit(ChangePasswordState.error(e.response.message.toString()));
    }
  }
}
