import 'dart:convert';
import 'dart:typed_data';

import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/app/utils/storage/storage_service.dart';
import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/domain/model/company/branch/branch_profile.dart';
import 'package:business_terminal/domain/model/company/rep_company.dart';
import 'package:business_terminal/domain/model/file/app_file.dart';
import 'package:business_terminal/domain/temp/days_hours.dart';
import 'package:business_terminal/presentation/add_payment/view/add_payment_page.dart';
import 'package:business_terminal/presentation/add_pos/view/add_pos_page.dart';
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
import 'package:business_terminal/presentation/dashboard/edit_personal_data/view/edit_personal_data_page.dart';
import 'package:business_terminal/presentation/dashboard/edit_personal_data/view/personal_avatar_page.dart';
import 'package:business_terminal/presentation/dashboard/profile/profile_add_logo/view/profile_add_logo.dart';
import 'package:business_terminal/presentation/dashboard/profile/profile_edit/view/profile_edit.dart';
import 'package:business_terminal/presentation/enter_email/view/enter_email_page.dart';
import 'package:business_terminal/presentation/navigation/app_state_cubit/app_state.dart';
import 'package:business_terminal/presentation/navigation/nav_utils.dart';
import 'package:business_terminal/presentation/navigation/unknown_page.dart';
import 'package:business_terminal/presentation/opening_hours/add_opening_hours/view/add_opening_hours_page.dart';
import 'package:business_terminal/presentation/opening_hours/pick_day/view/pick_day_page.dart';
import 'package:business_terminal/presentation/otp_verification/view/otp_verification_page.dart';
import 'package:flutter/material.dart';

String emailParam = 'email';
String phoneNumberParam = 'phone_number';
String verifyMethodParam = 'verify_method';

class AuthorizedState extends AppState {
  AuthorizedState({
    required super.initialRoute,
  }) : super(
          onGenerateRoute: (RouteSettings routeSettings) {
            Widget? page;
            final params = routeSettings.arguments as Map<String, dynamic>?;
            switch (routeSettings.name) {
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
              case EmailVerificationPage.path:
                if (params?[emailParam] != null) {
                  final args =
                      params![emailParam]! as EmailVerificationArguments;
                  appStorageService.setString(
                    key: emailParam,
                    value: args.email,
                  );
                }

                page = buildPage(
                  requiredParams: [emailParam],
                  child: EmailVerificationPage(
                    model: VerificationModel(
                      userCredentials:
                          appStorageService.getString(key: emailParam),
                      title: AppLocale.current.confirm_email_title,
                      wrongOtpText: AppLocale.current.otpCodeIncorrect,
                      otpSentText: AppLocale.current.emailSentDescription,
                      previousEmailText: AppLocale
                          .current.forget_password_email_inside_subtitle,
                      previousEmailSpamText: AppLocale
                          .current.forget_password_email_inside_subtitle2,
                    ),
                  ),
                );
                break;
              case ProfileAddLogoPage.path:
                final args =
                    routeSettings.arguments! as ProfileAddLogoArguments;

                page = ProfileAddLogoPage(
                  arguments: args,
                );
                return _buildHamsterPage<List<AppColoredFile>>(
                  page,
                  routeSettings,
                );
              case ChangePasswordPage.path:
                page = const ChangePasswordPage();
                break;
              case AddPaymentPage.path:
                final args = routeSettings.arguments! as AddPaymentArguments;

                page = AddPaymentPage(
                  addPaymentArguments: args,
                );
                break;
              case EditPersonalDataPage.path:
                page = const EditPersonalDataPage();
                break;
              case CreateBranchProfileCheckboxesPage.path:
                final params = routeSettings.arguments as Map<String, dynamic>?;
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
                final params = routeSettings.arguments as Map<String, dynamic>?;
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
                page = const CategoriesPage();
                break;
              case AddPosPage.path:
                page = const AddPosPage();
                break;
              case SelectSubCategoriesPage.path:
                page = const SelectSubCategoriesPage();
                break;
              case SubcategoriesPage.path:
                page = const SubcategoriesPage();
                break;
              case BranchProfilePicturePage.path:
                page = const BranchProfilePicturePage();
                break;
              case BranchProfileAvatarPicturePage.path:
                page = const BranchProfileAvatarPicturePage(
                  showEditButton: false,
                  showAddButton: false,
                );
                break;
              case CropperPage.path:
                final params = routeSettings.arguments as Map<String, dynamic>?;
                final imageForCrop =
                    params?[CropperPage.pImageForCrop] as Uint8List;
                final header = params?[CropperPage.pHeader] as String;
                final subheader = params?[CropperPage.pSubheader] as String;
                final circleCrop = params?[CropperPage.pCircleCrop] as bool;

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
                        'true',
                  ),
                );

                return _buildHamsterPage<AppFile>(page, routeSettings);
              case AddLogoCropperPage.path:
                final params =
                    routeSettings.arguments! as AddLogoCropperArguments;

                page = AddLogoCropperPage(
                  addLogoCropperArguments: params,
                );

                return _buildHamsterPage<AppColoredFile>(page, routeSettings);
              case PickDayPage.path:
                final params = routeSettings.arguments as Map<String, dynamic>?;
                if (params?[PickDayPage.paramDays] != null) {
                  final hours = json.encode(
                    (params![PickDayPage.paramDays] as DaysHours?)
                        ?.originalObject()
                        .toJson(),
                  );
                  appStorageService.setString(
                    key: PickDayPage.paramDays,
                    value: hours,
                  );
                }

                DaysHours? storageHours;
                if (appStorageService.getString(key: PickDayPage.paramDays) !=
                    null) {
                  final str = appStorageService.getString(
                    key: PickDayPage.paramDays,
                  )!;

                  final decoded = json.decode(str) as Map<String, dynamic>;

                  storageHours = DaysHours(
                    OpeningHours.fromJson(
                      decoded,
                    ),
                  );
                }

                page = buildPage(
                  requiredParams: [
                    PickDayPage.paramDays,
                  ],
                  child: PickDayPage(
                    hours: storageHours,
                  ),
                );
                break;
              case AddOpeningHoursPage.path:
                page = const AddOpeningHoursPage();
                break;
              case PersonalAvatarPage.path:
                page = const PersonalAvatarPage();
            }

            return _buildHamsterPage<void>(page, routeSettings);
          },
        );

  static final appStorageService = getIt.get<AppStorageService>();

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
