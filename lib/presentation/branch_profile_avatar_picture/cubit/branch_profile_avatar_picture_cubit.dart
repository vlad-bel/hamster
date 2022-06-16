import 'dart:developer';

import 'package:business_terminal/app/utils/images_util.dart';
import 'package:business_terminal/domain/gateway/rest_client.dart';
import 'package:business_terminal/domain/model/company/logo.dart';
import 'package:business_terminal/presentation/branch_profile_avatar_picture/cubit/branch_profile_avatar_picture_state.dart';
import 'package:business_terminal/presentation/common/widgets/add_logo_cropper/widget/add_logo_cropper_form.dart';
import 'package:business_terminal/use_cases/company/company_use_case.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class BranchProfileAvatarPictureCubit
    extends Cubit<BranchProfileAvatarPictureState> {
  BranchProfileAvatarPictureCubit(
    this.companyUsecase,
    this.client,
  ) : super(
          const BranchProfileAvatarPictureState.init(),
        );

  final CompanyUsecase companyUsecase;
  final RestClient client;

  void selectImage(AppColoredFile image) {
    emit(
      BranchProfileAvatarPictureState.init(
        selectedImage: image,
        images: state.images,
      ),
    );
  }

  Future<AppColoredFile?> pickImage(BuildContext context) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'png',
        'jpeg',
      ],
      withData: true,
    );

    if (result != null) {
      final file = AppColoredFile(
        size: result.files.first.size,
        bytes: result.files.first.bytes,
        name: result.files.first.name,
        color: null,
        extension: 'png',
      );

      return file;
    }

    return null;
  }

  Future setImage({required AppColoredFile appFile}) async {
    final images = List.of(state.images ?? <AppColoredFile>[])
      ..insert(
        0,
        appFile,
      );

    return emit(
      BranchProfileAvatarPictureState.init(
        selectedImage: appFile,
        images: images,
      ),
    );
  }

  void loading() {
    emit(
      BranchProfileAvatarPictureState.loading(
        selectedImage: state.selectedImage,
        images: state.images,
      ),
    );
  }

  void init() async {
    emit(
      BranchProfileAvatarPictureState.init(
        selectedImage: state.selectedImage,
        images: state.images,
      ),
    );
  }

  Future loadInitData() async {
    loading();
    final companyId = (await companyUsecase.getRepCompany()).company?.id;
    final company = await companyUsecase.getCompany(
      companyId: '$companyId',
    );

    final addedImages = <AppColoredFile>[];
    for (final logo in company.logos ?? <CompanyLogo>[]) {
      if (logo.fileName != null) {
        try {
          final preloadImage = await loadImage(
            client: client,
            fileName: logo.fileName!,
          );
          if (preloadImage != null) {
            addedImages.add(
              AppColoredFile(
                bytes: preloadImage,
                color: logo.backgroundColor,
                name: null,
                extension: 'png',
              ),
            );
          }
        } catch (e, s) {
          log('Error is $e, StackTrace is $s');
        }
      }
    }

    AppColoredFile? selectedImage;
    if (addedImages.isNotEmpty) {
      selectedImage = addedImages[0];
    }

    emit(
      BranchProfileAvatarPictureState.init(
        selectedImage: selectedImage,
        images: addedImages,
      ),
    );
  }
}
