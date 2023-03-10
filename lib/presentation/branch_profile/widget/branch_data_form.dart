import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/domain/model/company/rep_company.dart';
import 'package:business_terminal/presentation/branch_profile/create_branch_profile_checkboxes_page/cubit/create_branch_profile_checkboxes_cubit.dart';
import 'package:business_terminal/presentation/branch_profile/form_validation/branch_profile_form_validation.dart';
import 'package:business_terminal/presentation/branch_profile/widget/drop_down_select_entrances_count.dart';
import 'package:business_terminal/presentation/common/widgets/country_selector/country_selector.dart';
import 'package:business_terminal/presentation/common/widgets/country_selector/widget/cubit/country_selector_cubit.dart';
import 'package:business_terminal/presentation/common/widgets/form_text_field/form_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

class BranchDataForm extends StatelessWidget {
  BranchDataForm({
    Key? key,
    required this.formGroup,
    required this.paddingBetweenTextInputs,
    required this.branchSelectedFieldsMap,
    required this.company,
  }) : super(key: key);

  final CreateBranchProfileCheckboxesData branchSelectedFieldsMap;
  final FormGroup formGroup;
  final RepCompany company;

  final formSettings = BranchProfileFormValidation();

  final SizedBox paddingBetweenTextInputs;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ReactiveFormBuilder(
          form: () => formGroup,
          builder: (context, form, child) {
            fillUpPredefinedData(form, context);

            return Column(
              children: [
                FormTextField(
                  name: formSettings.kFieldBranchName,
                  label: AppLocale.of(context).branch_name,
                  validationMessages: (control) =>
                      formSettings.validationMessagesGeneric,
                ),
                paddingBetweenTextInputs,
                FormTextField(
                  name: formSettings.kFieldStreet,
                  label: AppLocale.of(context).street_house_number,
                  validationMessages: (control) =>
                      formSettings.validationMessagesGeneric,
                ),
                paddingBetweenTextInputs,
                FormTextField(
                  name: formSettings.kFieldStreetNumber,
                  label: AppLocale.of(context).house_number,
                  validationMessages: (control) =>
                      formSettings.validationMessagesGeneric,
                ),
                paddingBetweenTextInputs,
                FormTextField(
                  name: formSettings.kFieldCity,
                  label: AppLocale.of(context).zip_code_and_location,
                  validationMessages: (control) =>
                      formSettings.validationMessagesGeneric,
                ),
                paddingBetweenTextInputs,
                FormTextField(
                  name: formSettings.kFieldPostalCode,
                  label: AppLocale.of(context).zip_code_and_location,
                  validationMessages: (control) =>
                      formSettings.validationMessagesGeneric,
                ),
                paddingBetweenTextInputs,
                CountrySelector(cubit: context.read<CountrySelectorCubit>()),
                paddingBetweenTextInputs,
                FormTextField(
                  name: BranchProfileFormValidation.kFieldWebsite,
                  label: AppLocale.of(context).website_if_available,
                  validationMessages: (control) =>
                      formSettings.validationMessagesGeneric,
                ),
                paddingBetweenTextInputs,
                FormTextField(
                  name: BranchProfileFormValidation.kFieldPhone,
                  label: AppLocale.of(context).telephone_number_if_available,
                  validationMessages: (control) =>
                      formSettings.phoneNumValidationMessage,
                ),
                paddingBetweenTextInputs,
                DropDown(
                  formControlName: formSettings.kFieldEntrancesCount,
                  itemsList: EntrancesCountGenerator.getEntrancesCountList(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void fillUpPredefinedData(FormGroup form, BuildContext context) {
    // Company Name
    final companyNameSelected = branchSelectedFieldsMap[
            CompanyDataCommonFieldsWithBranchData.companyName] ??
        false;

    if (companyNameSelected) {
      final value = company.company?.companyName;
      form.control(formSettings.kFieldBranchName).value = value;
    }

    // Street
    final streetNameSelected = branchSelectedFieldsMap[
            CompanyDataCommonFieldsWithBranchData.streetName] ??
        false;

    if (streetNameSelected) {
      final value = company.company?.streetName;

      form.control(formSettings.kFieldStreet).value = '$value';
    }

    // Street number
    final streetNumberSelected = branchSelectedFieldsMap[
            CompanyDataCommonFieldsWithBranchData.streetNumber] ??
        false;

    if (streetNumberSelected) {
      final value = company.company?.streetNumber;

      // TODO:
      form.control(formSettings.kFieldStreetNumber).value = '$value';
    }

    // City
    final citySelected =
        branchSelectedFieldsMap[CompanyDataCommonFieldsWithBranchData.city] ??
            false;

    if (citySelected) {
      final value = company.company?.city;

      form.control(formSettings.kFieldCity).value = value;
    }

    // Postal code
    final postalCodeSelected = branchSelectedFieldsMap[
            CompanyDataCommonFieldsWithBranchData.postalCode] ??
        false;

    if (postalCodeSelected) {
      final value = company.company?.postalCode;

      form.control(formSettings.kFieldPostalCode).value = value;
    }

    // Country
    final countrySelected = branchSelectedFieldsMap[
            CompanyDataCommonFieldsWithBranchData.country] ??
        false;

    if (countrySelected) {
      final value = company.company?.country ?? '';

      logger.d('\n\n\n\nCountry = $value');

      context
          .read<CountrySelectorCubit>()
          .selectInitialCountry(countryName: value);
    }
  }
}
