import 'package:business_terminal/presentation/branch_profile/cubit/branch_profile_cubit.dart';
import 'package:business_terminal/presentation/branch_profile_picture/branch_profile_picture_form.dart';
import 'package:business_terminal/presentation/branch_profile_picture/cubit/branch_profile_picture_cubit.dart';
import 'package:business_terminal/presentation/branch_profile_picture/cubit/branch_profile_picture_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BranchProfilePicturePage extends StatelessWidget {
  const BranchProfilePicturePage({Key? key}) : super(key: key);

  static const path = '/branch_profile_picture_page';

  @override
  Widget build(BuildContext context) {
    final branchProfileCubit = context.read<BranchProfileCubit>();

    context.read<BranchProfilePictureCubit>()
      ..emit(BranchProfilePictureState.init(
        selectedImage: branchProfileCubit.state.branchImages?[0],
        images: branchProfileCubit.state.branchImages,
      ));

    return BranchProfilePictureForm();
  }
}
