import 'package:business_terminal/presentation/common/widgets/onboarding_background.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container_header.dart';
import 'package:business_terminal/presentation/countries_list/country_selector/country_selector.dart';
import 'package:business_terminal/presentation/countries_list/country_selector/cubit/country_selector_cubit.dart';
import 'package:business_terminal/presentation/registration/widgets/action_button_blue.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

///form for [CountriesListPage]
class ContryListForm extends StatelessWidget {
  const ContryListForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OnboardingBackground(
      children: OnboardingWhiteContainer(
        header: OnboardingWhiteContainerHeader(
          header: AppLocalizations.of(context).confirm_number_title,
          subHeader: Text(
            AppLocalizations.of(context).select_number_title,
          ),
        ),
        body: Column(
          children: [
            SizedBox(height: 28),
            CountrySelector(),
            SizedBox(height: 150),
            ActionButtonBlue(
              width: double.infinity,
              onPressed: () {},
              isEnabled: true,
            ),
          ],
        ),
      ),
    );
  }
}
