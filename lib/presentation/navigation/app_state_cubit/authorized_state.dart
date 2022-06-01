import 'dart:html';
import 'dart:typed_data';

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
import 'package:business_terminal/presentation/common/widgets/dashboard/dashboard_page.dart';
import 'package:business_terminal/presentation/company_creation/company_creation_page.dart';
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

                window.sessionStorage[CropperPage.pImageForCrop] =
                    String.fromCharCodes(imageForCrop);

                window.sessionStorage[CropperPage.pHeader] = header;
                window.sessionStorage[CropperPage.pSubheader] = subheader;
                window.sessionStorage[CropperPage.pCircleCrop] =
                    circleCrop.toString();

                final imageBytes =
                    window.sessionStorage[CropperPage.pImageForCrop]!.codeUnits;

                final bytes = Uint8List.fromList(imageBytes);

                page = buildPage(
                  requiredParams: [
                    CropperPage.pImageForCrop,
                    CropperPage.pHeader,
                    CropperPage.pSubheader,
                  ],
                  child: CropperPage(
                    imageForCrop: bytes,
                    header: window.sessionStorage[CropperPage.pHeader]!,
                    subheader: window.sessionStorage[CropperPage.pSubheader]!,
                    circleCrop:
                        window.sessionStorage[CropperPage.pCircleCrop] == 'true'
                            ? true
                            : false,
                  ),
                );

                return _buildHamsterPage<Uint8List>(page, settings);
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
