import 'package:business_terminal/domain/model/company/branch/branch_profile.dart';
import 'package:business_terminal/domain/temp/pos_raw.dart';
import 'package:business_terminal/presentation/common/widgets/add_logo_cropper/widget/add_logo_cropper_form.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'branch_profile_state.freezed.dart';

@freezed
class BranchProfileState with _$BranchProfileState {
  const factory BranchProfileState.branchWasCreatedSuccessfully({
    // TODO: remove below fields here after demo
    String? category,
    List<String>? subcategories,
    List<AppColoredFile>? branchImages,
    List<AppColoredFile>? avatarImages,
    List<PosRaw>? poses,
    OpeningHours? hours,
    bool? isCreateBranchButtonEnabled,
  }) = WasCreatedSuccesfullyBranchProfileState;

  const factory BranchProfileState.error({
    // TODO: remove below fields here after demo
    String? category,
    List<String>? subcategories,
    List<AppColoredFile>? branchImages,
    List<AppColoredFile>? avatarImages,
    List<PosRaw>? poses,
    OpeningHours? hours,
    bool? isCreateBranchButtonEnabled,
  }) = ErrorBranchProfileState;

  const factory BranchProfileState.init({
    String? category,
    List<String>? subcategories,
    List<AppColoredFile>? branchImages,
    List<AppColoredFile>? avatarImages,
    List<PosRaw>? poses,
    OpeningHours? hours,
    bool? isCreateBranchButtonEnabled,
  }) = InitBranchProfileState;
}
