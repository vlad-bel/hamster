import 'dart:typed_data';

import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/presentation/common/cropper_page/cropper_form.dart';
import 'package:business_terminal/presentation/common/cropper_page/cubit/cropper_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CropperPage extends StatelessWidget {
  const CropperPage({
    Key? key,
    required this.header,
    required this.subheader,
    required this.imageForCrop,
  }) : super(key: key);

  static const path = '/cropper-page';

  ///page parameters keys
  static const pHeader = 'header';
  static const pSubheader = 'subheader';
  static const pImageForCrop = 'image_for_crop';

  final String header;
  final String subheader;
  final Uint8List imageForCrop;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CropperCubit>(
      create: (BuildContext context) {
        return getIt.get<CropperCubit>();
      },
      child: CropperForm(
        subheader: subheader,
        header: header,
        imageForCrop: imageForCrop,
      ),
    );
  }
}
