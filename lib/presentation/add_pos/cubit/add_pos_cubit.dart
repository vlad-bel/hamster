import 'package:bloc/bloc.dart';
import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/domain/model/login/login_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'add_pos_cubit.freezed.dart';

@injectable
class AddPosCubit extends Cubit<AddPosState> {
  AddPosCubit() : super(AddPosState.initial());
}

@freezed
class AddPosState with _$AddPosState {
  const factory AddPosState.initial() = InitialAddPos;

  const factory AddPosState.loading() = LoadingAddPos;

  const factory AddPosState.success(LoginResponse response) = SuccessAddPos;

  const factory AddPosState.error(ApiFailure failure) = ErrorAddPos;
}
