import 'dart:typed_data';

import 'package:business_terminal/app/utils/storage/storage_service.dart';
import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/domain/model/company/rep_company.dart';
import 'package:business_terminal/presentation/add_payment/view/add_payment_page.dart';
import 'package:business_terminal/presentation/branch_profile/create_branch_profile_checkboxes_page/cubit/create_branch_profile_checkboxes_cubit.dart';
import 'package:business_terminal/presentation/branch_profile/create_branch_profile_checkboxes_page/view/create_branch_profile_checkboxes_page.dart';
import 'package:business_terminal/presentation/branch_profile/view/branch_profile_page.dart';
import 'package:business_terminal/presentation/branch_profile_avatar_picture/branch_profile_avatar_picture_page.dart';
import 'package:business_terminal/presentation/branch_profile_picture/branch_profile_picture_page.dart';
import 'package:business_terminal/presentation/categories/categories/categories_page.dart';
import 'package:business_terminal/presentation/categories/subcategories/select_subcategories_page/select_subcategories_page.dart';
import 'package:business_terminal/presentation/categories/subcategories/subcategories_page/subcategories_page.dart';
import 'package:business_terminal/presentation/common/cropper_page/cropper_page.dart';
import 'package:business_terminal/presentation/common/widgets/add_logo_cropper/add_logo_cropper_page.dart';
import 'package:business_terminal/presentation/common/widgets/add_logo_cropper/widget/add_logo_cropper_form.dart';
import 'package:business_terminal/presentation/common/widgets/dashboard/dashboard_page.dart';
import 'package:business_terminal/presentation/company_creation/company_creation_page.dart';
import 'package:business_terminal/presentation/dashboard/change_password/view/change_password_page.dart';
import 'package:business_terminal/presentation/dashboard/profile/profile_add_logo/view/profile_add_logo.dart';
import 'package:business_terminal/presentation/dashboard/profile/profile_edit/view/profile_edit.dart';
import 'package:business_terminal/presentation/navigation/app_state_cubit/app_state.dart';
import 'package:business_terminal/presentation/navigation/nav_utils.dart';
import 'package:business_terminal/presentation/navigation/unknown_page.dart';
import 'package:flutter/material.dart';

class AuthorizedState extends AppState {
  AuthorizedState({
    required super.initialRoute,
  }) : super(
          onGenerateRoute: (RouteSettings settings) {
            Widget? page;
            final params = settings.arguments as Map<String, dynamic>?;

            switch (settings.name) {
              case CompanyCreationPage.path:
                page = const CompanyCreationPage();
                break;
              case DashboardPage.path:
                page = const DashboardPage(
                  initialPagePath: accountVerificationPath,
                  initialPageIndex: 1,
                );
                break;
              case ProfileEditPage.path:
                page = const ProfileEditPage();
                break;
              case ProfileAddLogoPage.path:
                page = const ProfileAddLogoPage();
                return _buildHamsterPage<List<AddedProfileLogoModel>>(
                  page,
                  settings,
                );
              case ChangePasswordPage.path:
                page = const ChangePasswordPage();
                break;
              case AddPaymentPage.path:
                page = AddPaymentPage();
                break;
              case CreateBranchProfileCheckboxesPage.path:
                final company =
                    params?[CreateBranchProfileCheckboxesPage.paramRepCompany]
                        as RepCompany?;

                if (company != null) {
                  page = CreateBranchProfileCheckboxesPage(
                    repCompany: company,
                  );
                } else {
// TODO: add ErroPage later and display error
                  throw Exception(
                    'CreateBranchProfileCheckboxesPage company '
                    'parameter is NULL',
                  );
                }
                break;
              case BranchProfilePage.path:
                final data = params?[BranchProfilePage.paramData]
                    as CreateBranchProfileCheckboxesData?;
                final company =
                    params?[BranchProfilePage.paramCompany] as RepCompany?;

                if (data != null && company != null) {
                  page = BranchProfilePage(
                    branchSelectedFieldsMap: data,
                    company: company,
                  );
                } else {
// TODO: add ErroPage later and display error
                  throw Exception(
                    'BranchProfilePage data or company parameter is NULL',
                  );
                }

                break;
              case CategoriesPage.path:
                page = CategoriesPage();
                break;
              case SelectSubCategoriesPage.path:
                page = SelectSubCategoriesPage();
                break;
              case SubcategoriesPage.path:
                page = SubcategoriesPage();
                break;
              case BranchProfilePicturePage.path:
                page = BranchProfilePicturePage();
                break;
              case BranchProfileAvatarPicturePage.path:
                page = BranchProfileAvatarPicturePage(
                  showEditButton: false,
                  showAddButton: true,
                );
                break;
              case CropperPage.path:
                final imageForCrop =
                    params?[CropperPage.pImageForCrop] as Uint8List;
                final header = params?[CropperPage.pHeader] as String;
                final subheader = params?[CropperPage.pSubheader] as String;
                final circleCrop = params?[CropperPage.pCircleCrop] as bool;

                final appStorageService = getIt.get<AppStorageService>();

                appStorageService.setString(
                  key: CropperPage.pImageForCrop,
                  value: String.fromCharCodes(imageForCrop),
                );

                appStorageService.setString(
                  key: CropperPage.pHeader,
                  value: header,
                );

                appStorageService.setString(
                  key: CropperPage.pSubheader,
                  value: subheader,
                );
                appStorageService.setString(
                  key: CropperPage.pCircleCrop,
                  value: circleCrop.toString(),
                );

                final imageBytes = appStorageService
                    .getString(key: CropperPage.pImageForCrop)!
                    .codeUnits;

                final bytes = Uint8List.fromList(imageBytes);

                page = buildPage(
                  requiredParams: [
                    CropperPage.pImageForCrop,
                    CropperPage.pHeader,
                    CropperPage.pSubheader,
                  ],
                  child: CropperPage(
                    imageForCrop: bytes,
                    header: appStorageService.getString(
                      key: CropperPage.pHeader,
                    )!,
                    subheader: appStorageService.getString(
                      key: CropperPage.pSubheader,
                    )!,
                    circleCrop: appStorageService.getString(
                              key: CropperPage.pCircleCrop,
                            )! ==
                            'true'
                        ? true
                        : false,
                  ),
                );

                return _buildHamsterPage<Uint8List>(page, settings);
              case AddLogoCropperPage.path:
                final imageForCrop =
                    params?[AddLogoCropperPage.pImageForCrop] as Uint8List;
                final header = params?[AddLogoCropperPage.pHeader] as String;
                final subheader =
                    params?[AddLogoCropperPage.pSubheader] as String;
                final circleCrop =
                    params?[AddLogoCropperPage.pCircleCrop] as bool;

                final appStorageService = getIt.get<AppStorageService>();

                appStorageService.setString(
                  key: AddLogoCropperPage.pImageForCrop,
                  value: String.fromCharCodes(imageForCrop),
                );

                appStorageService.setString(
                  key: AddLogoCropperPage.pHeader,
                  value: header,
                );

                appStorageService.setString(
                  key: AddLogoCropperPage.pSubheader,
                  value: subheader,
                );
                appStorageService.setString(
                  key: AddLogoCropperPage.pCircleCrop,
                  value: circleCrop.toString(),
                );

                final imageBytes = appStorageService
                    .getString(key: AddLogoCropperPage.pImageForCrop)!
                    .codeUnits;

                final bytes = Uint8List.fromList(imageBytes);

                page = buildPage(
                  requiredParams: [
                    AddLogoCropperPage.pImageForCrop,
                    AddLogoCropperPage.pHeader,
                    AddLogoCropperPage.pSubheader,
                  ],
                  child: AddLogoCropperPage(
                    imageForCrop: bytes,
                    header: appStorageService.getString(
                      key: AddLogoCropperPage.pHeader,
                    )!,
                    subheader: appStorageService.getString(
                      key: AddLogoCropperPage.pSubheader,
                    )!,
                    circleCrop: appStorageService.getString(
                          key: AddLogoCropperPage.pCircleCrop,
                        )! ==
                        'true',
                  ),
                );

                return _buildHamsterPage<AddedProfileLogoModel>(page, settings);
            }

            return _buildHamsterPage<void>(page, settings);
          },
        );

  static PageRouteBuilder<T> _buildHamsterPage<T>(
    Widget? page,
    RouteSettings settings,
  ) {
    return PageRouteBuilder<T>(
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
      pageBuilder: (context, anim1, anim2) {
        return page ??
            UnknownPage(
              path: settings.name ?? '',
            );
      },
      settings: settings,
    );
  }
}
