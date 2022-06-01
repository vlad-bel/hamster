import 'package:freezed_annotation/freezed_annotation.dart';

part 'branch_profile_state.freezed.dart';

@freezed
class BranchProfileState with _$BranchProfileState {
  const factory BranchProfileState.init({
    String? category,
    List<String>? subcategories,
    List<dynamic>? branchImages,
    List<dynamic>? avatarImages,
  }) = InitBranchProfileState;

  const factory BranchProfileState.branchWasCreatedSuccessfully({
    // TODO: remove below fields here after demo
    String? category,
    List<String>? subcategories,
    List<dynamic>? branchImages,
    List<dynamic>? avatarImages,
  }) = WasCreatedSuccesfullyBranchProfileState;

  const factory BranchProfileState.error({
    // TODO: remove below fields here after demo
    String? category,
    List<String>? subcategories,
    List<dynamic>? branchImages,
    List<dynamic>? avatarImages,
  }) = ErrorBranchProfileState;
}
