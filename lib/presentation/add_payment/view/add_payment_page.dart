import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/presentation/add_payment/form_validation/add_payment_form_validation.dart';
import 'package:business_terminal/presentation/common/widgets/form_consumer.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_background.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container_header.dart';
import 'package:business_terminal/presentation/common/widgets/payment_info.dart';
import 'package:flutter/material.dart';

class AddPaymentPage extends StatelessWidget {
  AddPaymentPage({Key? key}) : super(key: key);

  static const path = '/add_payment';

  final formSettings = AddPaymentFormSettings();

  @override
  Widget build(BuildContext context) {
    return OnboardingBackground(
      children: OnboardingWhiteContainer(
        header: OnboardingWhiteContainerHeader(
          header: AppLocale.of(context).add_business_account,
          subHeader:
              Text(AppLocale.of(context).for_credits_and_regular_billing),
        ),
        body: PaymentInfo(
          formConsumer: FormConsumer(
            onTap: (form) => Navigator.pop(
              context,
              <String, String>{
                AddPaymentFormSettings.kAccountOwnerField: form
                    .control(AddPaymentFormSettings.kAccountOwnerField)
                    .value as String,
                AddPaymentFormSettings.kIbanField: form
                    .control(AddPaymentFormSettings.kIbanField)
                    .value as String,
              },
            ),
          ),
          onTap: () {},
        ),
      ),
    );
  }
}
