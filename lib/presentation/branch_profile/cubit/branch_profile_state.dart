import 'package:business_terminal/domain/model/company/branch/branch_profile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'branch_profile_state.freezed.dart';

@freezed
class BranchProfileState with _$BranchProfileState {
  const factory BranchProfileState.init({
    String? category,
    List<String>? subcategories,
    List<dynamic>? branchImages,
    List<dynamic>? avatarImages,
    OpeningHours? hours,
    bool? isCreateBranchButtonEnabled,
  }) = InitBranchProfileState;

  const factory BranchProfileState.branchWasCreatedSuccessfully({
    // TODO: remove below fields here after demo
    String? category,
    List<String>? subcategories,
    List<dynamic>? branchImages,
    List<dynamic>? avatarImages,
    OpeningHours? hours,
    bool? isCreateBranchButtonEnabled,
  }) = WasCreatedSuccesfullyBranchProfileState;

  const factory BranchProfileState.error({
    // TODO: remove below fields here after demo
    String? category,
    List<String>? subcategories,
    List<dynamic>? branchImages,
    List<dynamic>? avatarImages,
    OpeningHours? hours,
    bool? isCreateBranchButtonEnabled,
  }) = ErrorBranchProfileState;
}
