import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'account_verification_cubit.freezed.dart';

@injectable
class AccountVerificationCubit extends Cubit<VerifyAccountState> {
  AccountVerificationCubit()
      : super(
          const VerifyAccountState.initial(
            isAcceptedDataIsCorrect: false,
            progressUserAccount: 100,
            progressCompanyProfile: 100,
            progressBranchProfile: 100,
          ),
        );

  void changeCheckBoxDataIsCorrect({required bool isAcceptedDataIsCorrect}) {
    emit(
      VerifyAccountState.initial(
        isAcceptedDataIsCorrect: isAcceptedDataIsCorrect,
        progressUserAccount: 100,
        progressCompanyProfile: 100,
        progressBranchProfile: 100,
      ),
    );
  }
}

@freezed
class VerifyAccountState with _$VerifyAccountState {
  const factory VerifyAccountState.initial({
    required bool isAcceptedDataIsCorrect,
    required int progressUserAccount,
    required int progressCompanyProfile,
    required int progressBranchProfile,
  }) = InitialAccountVerificationState;
}
