import 'package:freezed_annotation/freezed_annotation.dart';

part 'company_creation_state.freezed.dart';

@freezed
class CompanyCreationState with _$CompanyCreationState {
  const factory CompanyCreationState.loading() = LoadingCompanyCreationState;

  const factory CompanyCreationState.success() = SuccessCompanyCreationState;

  const factory CompanyCreationState.error() = ErrorCompanyCreationState;
}
