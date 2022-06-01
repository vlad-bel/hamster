import 'package:business_terminal/presentation/branch_profile/cubit/branch_profile_cubit.dart';
import 'package:business_terminal/presentation/branch_profile_avatar_picture/branch_profile_avatar_picture_form.dart';
import 'package:business_terminal/presentation/branch_profile_avatar_picture/cubit/branch_profile_avatar_picture_cubit.dart';
import 'package:business_terminal/presentation/branch_profile_avatar_picture/cubit/branch_profile_avatar_picture_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BranchProfileAvatarPicturePage extends StatelessWidget {
  const BranchProfileAvatarPicturePage({
    Key? key,
    required this.showAddButton,
    required this.showEditButton,
  }) : super(key: key);

  static const path = '/branch_profile_avatar_picture_page';

  final bool showAddButton;
  final bool showEditButton;

  @override
  Widget build(BuildContext context) {

    return BranchProfileAvatarPictureForm(
      showAddButton: showAddButton,
      showEditButton: showEditButton,
    );
  }
}
