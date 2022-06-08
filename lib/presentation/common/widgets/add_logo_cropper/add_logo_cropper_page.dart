import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/domain/model/file/app_file.dart';
import 'package:business_terminal/presentation/common/widgets/add_logo_cropper/cubit/add_logo_cropper_cubit.dart';
import 'package:business_terminal/presentation/common/widgets/add_logo_cropper/widget/add_logo_cropper_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddLogoCropperArguments {
  final String header;
  final String subheader;
  final AppFile imageForCrop;
  final bool circleCrop;

  AddLogoCropperArguments({
    required this.header,
    required this.subheader,
    required this.imageForCrop,
    required this.circleCrop,
  });
}

class AddLogoCropperPage extends StatelessWidget {
  const AddLogoCropperPage({
    Key? key,
    required this.addLogoCropperArguments,
  }) : super(key: key);

  static const path = '/add-logo-cropper-page';

  final AddLogoCropperArguments addLogoCropperArguments;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddLogoCropperCubit>(
      create: (BuildContext context) {
        return getIt.get<AddLogoCropperCubit>();
      },
      child: AddLogoCropperForm(
        subheader: addLogoCropperArguments.subheader,
        header: addLogoCropperArguments.header,
        imageForCrop: addLogoCropperArguments.imageForCrop,
        circleCrop: addLogoCropperArguments.circleCrop,
      ),
    );
  }
}
