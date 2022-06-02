import 'dart:typed_data';

import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/presentation/common/widgets/add_logo_cropper/cubit/add_logo_cropper_cubit.dart';
import 'package:business_terminal/presentation/common/widgets/add_logo_cropper/widget/add_logo_cropper_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddLogoCropperPage extends StatelessWidget {
  const AddLogoCropperPage({
    Key? key,
    required this.header,
    required this.subheader,
    required this.imageForCrop,
    required this.circleCrop,
  }) : super(key: key);

  static const path = '/add-logo-cropper-page';

  ///page parameters keys
  static const pHeader = 'header';
  static const pCircleCrop = 'circle_crop';
  static const pSubheader = 'subheader';
  static const pImageForCrop = 'image_for_crop';

  final String header;
  final String subheader;
  final Uint8List imageForCrop;
  final bool circleCrop;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddLogoCropperCubit>(
      create: (BuildContext context) {
        return getIt.get<AddLogoCropperCubit>();
      },
      child: AddLogoCropperForm(
        subheader: subheader,
        header: header,
        imageForCrop: imageForCrop,
        circleCrop: circleCrop,
      ),
    );
  }
}
