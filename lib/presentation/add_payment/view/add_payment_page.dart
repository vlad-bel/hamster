import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/generated/locale_keys.g.dart';
import 'package:business_terminal/presentation/add_payment/cubit/add_payment_cubit.dart';
import 'package:business_terminal/presentation/add_payment/form_validation/add_payment_form_validation.dart';
import 'package:business_terminal/presentation/common/widgets/form_consumer.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_background.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container_header.dart';
import 'package:business_terminal/presentation/common/widgets/payment_info.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPaymentPage extends StatelessWidget {
  const AddPaymentPage({Key? key}) : super(key: key);

  static const path = '/add_payment';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<AddPaymentCubit>(),
      child: AddPaymentForm(),
    );
  }
}

class AddPaymentForm extends StatelessWidget {
  AddPaymentForm({Key? key}) : super(key: key);

  final formSettings = AddPaymentFormSettings();

  @override
  Widget build(BuildContext context) {
    return OnboardingBackground(
      children: OnboardingWhiteContainer(
        header: OnboardingWhiteContainerHeader(
          header: tr(LocaleKeys.add_business_account),
          subHeader: Text(tr(LocaleKeys.for_credits_and_regular_billing)),
        ),
        body: PaymentInfo(
          formConsumer: FormConsumer(
            onTap: (form) {},
          ),
        ),
      ),
    );
  }
}
