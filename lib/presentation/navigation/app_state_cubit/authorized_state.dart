import 'dart:typed_data';

import 'package:business_terminal/presentation/add_payment/view/add_payment_page.dart';
import 'package:business_terminal/presentation/branch_profile/view/branch_profile_page.dart';
import 'package:business_terminal/presentation/branch_profile_picture/branch_profile_picture_page.dart';
import 'package:business_terminal/presentation/categories/categories/categories_page.dart';
import 'package:business_terminal/presentation/categories/subcategories/select_subcategories_page/select_subcategories_page.dart';
import 'package:business_terminal/presentation/categories/subcategories/subcategories_page/subcategories_page.dart';
import 'package:business_terminal/presentation/common/cropper_page/cropper_page.dart';
import 'package:business_terminal/presentation/common/widgets/dashboard/dashboard_page.dart';
import 'package:business_terminal/presentation/company_creation/company_creation_page.dart';
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
              case AddPaymentPage.path:
                page = AddPaymentPage();
                break;
              case BranchProfilePage.path:
                page = BranchProfilePage();
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
              case CropperPage.path:
                final imageForCrop =
                    params![CropperPage.pImageForCrop] as Uint8List;
                final header = params[CropperPage.pHeader] as String;
                final subheader = params[CropperPage.pSubheader] as String;

                page = buildPage(
                  requiredParams: [
                    CropperPage.pImageForCrop,
                    CropperPage.pHeader,
                    CropperPage.pSubheader,
                  ],
                  child: CropperPage(
                    imageForCrop: imageForCrop,
                    header: header,
                    subheader: subheader,
                  ),
                );

                return buildHamsterPage<Uint8List>(page, settings);
            }

            return buildHamsterPage<void>(page, settings);
          },
        );

  static PageRouteBuilder<T> buildHamsterPage<T>(
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
