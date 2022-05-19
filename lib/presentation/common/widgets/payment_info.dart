import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/generated/locale_keys.g.dart';
import 'package:business_terminal/presentation/add_payment/form_validation/add_payment_form_validation.dart';
import 'package:business_terminal/presentation/common/widgets/checkbox/other/position.dart';
import 'package:business_terminal/presentation/common/widgets/checkbox/ui_checkbox.dart';
import 'package:business_terminal/presentation/common/widgets/dashed_button.dart';
import 'package:business_terminal/presentation/common/widgets/form_text_field/form_text_field.dart';
import 'package:business_terminal/presentation/common/widgets/form_text_field/other/iban_input_formatter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

/// Payment info - account owner and IBAN with possibility to edit this info
/// and submit via [formConsumer]
class PaymentInfo extends StatelessWidget {
  PaymentInfo({
    Key? key,
    this.accountOwner = '',
    this.iban = '',
    this.formConsumer,
  }) : super(key: key);

  final String accountOwner;
  final String iban;
  final Widget? formConsumer;

  final formSettings = AddPaymentFormSettings();

  @override
  Widget build(BuildContext context) {
    return ReactiveFormBuilder(
      form: () => formSettings.buildForm(accountOwner, iban),
      builder: (
        BuildContext context,
        FormGroup formGroup,
        Widget? child,
      ) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (formConsumer == null)
              Text(
                tr(LocaleKeys.payment_information),
                style: inter16SemiBold,
              ),
            const SizedBox(height: 24),
            if ((accountOwner.isEmpty || iban.isEmpty) && formConsumer == null)
              SizedBox(
                height: 125,
                child: DashedButton(
                  onTap: () {},
                  label: tr(LocaleKeys.add_bank_details),
                ),
              )
            else
              Column(
                children: [
                  FormTextField(
                    name: AddPaymentFormSettings.accountOwnerField,
                    hint: tr(LocaleKeys.account_owner),
                    label: tr(LocaleKeys.account_owner),
                    validationMessages: (control) =>
                        formSettings.validationMessageAccountOwner,
                  ),
                  const SizedBox(height: 16),
                  FormTextField(
                    name: AddPaymentFormSettings.ibanField,
                    hint: tr(LocaleKeys.iban),
                    label: tr(LocaleKeys.iban),
                    inputFormatters: [
                      IbanInputFormatter(),
                    ],
                    validationMessages: (control) =>
                        formSettings.validationMessageIban,
                  ),
                  if (formConsumer != null)
                    Column(
                      children: [
                        const SizedBox(height: 16),
                        UiCheckbox(
                          value: true,
                          title: Text(
                            tr(LocaleKeys.i_authorize_collect_payment),
                            style: inter12,
                          ),
                          position: Position.left,
                          onChanged: (value) {},
                        ),
                        const SizedBox(height: 24),
                        formConsumer!,
                      ],
                    ),
                ],
              ),
          ],
        );
      },
    );
  }
}