import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
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
  const BranchDataForm({
    Key? key,
    required this.formSettings,
    required this.paddingBetweenTextInputs,
    required this.branchSelectedFieldsMap,
    required this.company,
  }) : super(key: key);

  final CreateBranchProfileCheckboxesData branchSelectedFieldsMap;
  final RepCompany company;

  final BranchProfileFormValidation formSettings;
  final SizedBox paddingBetweenTextInputs;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: ReactiveFormBuilder(
          form: formSettings.buildForm,
          builder: (context, form, child) {
            fillUpPredefinedData(form);

            return Column(
              children: [
                FormTextField(
                  name: formSettings.kFieldBranchName,
                  label: AppLocale.current.branch_name,
                  validationMessages: (control) =>
                      formSettings.validationMessagesGeneric,
                ),
                paddingBetweenTextInputs,
                FormTextField(
                  name: formSettings.kFieldStreet,
                  label: AppLocale.current.street_house_number,
                  validationMessages: (control) =>
                      formSettings.validationMessagesGeneric,
                ),
                paddingBetweenTextInputs,
                FormTextField(
                  name: formSettings.kFieldCity,
                  label: AppLocale.current.zip_code_and_location,
                  validationMessages: (control) =>
                      formSettings.validationMessagesGeneric,
                ),
                paddingBetweenTextInputs,
                CountrySelector(cubit: context.read<CountrySelectorCubit>()),
                paddingBetweenTextInputs,
                FormTextField(
                  name: formSettings.kFieldWebsite,
                  label: AppLocale.current.website_if_available,
                  validationMessages: (control) =>
                      formSettings.validationMessagesGeneric,
                ),
                paddingBetweenTextInputs,
                FormTextField(
                  name: formSettings.kFieldPhone,
                  label: AppLocale.current.telephone_number_if_available,
                  validationMessages: (control) =>
                      formSettings.validationMessagesGeneric,
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

  void fillUpPredefinedData(FormGroup form) {
    // Company Name
    final companyNameSelected = branchSelectedFieldsMap[
            CompanyDataCommonFieldsWithBranchData.companyName] ??
        false;

    if (companyNameSelected) {
      final value = company.company?.companyName;
      form.control(formSettings.kFieldBranchName).value = value;
    }

    // Street
    final streetNameAndNumberSelected = branchSelectedFieldsMap[
            CompanyDataCommonFieldsWithBranchData.streetNameAndNumber] ??
        false;

    if (streetNameAndNumberSelected) {
      final value = company.company?.streetName;
      final streetNumber = company.company?.streetNumber;

      form.control(formSettings.kFieldStreet).value = '$value $streetNumber';
    }

    // City
    final citySelected =
        branchSelectedFieldsMap[CompanyDataCommonFieldsWithBranchData.city] ??
            false;

    if (citySelected) {
      final value = company.company?.city;

      form.control(formSettings.kFieldCity).value = value;
    }
  }
}
