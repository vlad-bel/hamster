import 'package:business_terminal/presentation/dashboard/edit_personal_data/cubit/edit_personal_data_cubit.dart';
import 'package:business_terminal/presentation/dashboard/edit_personal_data/cubit/edit_personal_data_state.dart';
import 'package:business_terminal/presentation/dashboard/edit_personal_data/view/add_personal_avatar_page.dart';
import 'package:business_terminal/presentation/dashboard/edit_personal_data/view/edit_personal_avatar_page.dart';
import 'package:business_terminal/presentation/dashboard/edit_personal_data/view/edit_personal_data_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Container for personal avatar
/// Shows [AddPersonalAvatarPage] if avatar does not exist
/// Shows [EditPersonalAvatarPage] if exists
class PersonalAvatarPage extends StatelessWidget {
  static const path = '${EditPersonalDataPage.path}/avatar';

  const PersonalAvatarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditPersonalDataCubit, EditPersonalDataState>(
      builder: (context, state) {
        if (state.avatar == null) {
          return const AddPersonalAvatarPage();
        } else {
          return const EditPersonalAvatarPage();
        }
      },
    );
  }
}
