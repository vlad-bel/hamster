import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/presentation/add_payment/form_validation/add_payment_form_validation.dart';
import 'package:business_terminal/presentation/common/widgets/checkbox/other/position.dart';
import 'package:business_terminal/presentation/common/widgets/checkbox/ui_checkbox.dart';
import 'package:business_terminal/presentation/common/widgets/dash_bordered_container/dash_bordered_container_widget.dart';
import 'package:business_terminal/presentation/common/widgets/form_text_field/form_text_field.dart';
import 'package:business_terminal/presentation/common/widgets/form_text_field/other/iban_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

/// Payment info - account owner and IBAN with possibility to edit this info
/// and submit via [formConsumer]
class PaymentInfo extends StatefulWidget {
  const PaymentInfo({
    Key? key,
    this.accountOwner = '',
    this.iban = '',
    this.formConsumer,
  }) : super(key: key);

  final String accountOwner;
  final String iban;
  final Widget? formConsumer;

  @override
  State<PaymentInfo> createState() => _PaymentInfoState();
}

class _PaymentInfoState extends State<PaymentInfo> {
  final formSettings = AddPaymentFormSettings();

  @override
  Widget build(BuildContext context) {
    return ReactiveFormBuilder(
      form: () => formSettings.buildForm(
        widget.accountOwner,
        widget.iban,
        enableValidators: widget.formConsumer != null,
      ),
      builder: (
        BuildContext context,
        FormGroup formGroup,
        Widget? child,
      ) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.formConsumer == null)
              Text(
                AppLocale.current.payment_information,
                style: inter16SemiBold,
              ),
            const SizedBox(height: 24),
            if ((widget.accountOwner.isEmpty || widget.iban.isEmpty) &&
                widget.formConsumer == null)
              AppDashBorderedContainer(
                borderType: BorderType.rect,
                child: Container(
                  height: 125,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(color: white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.add_circle,
                        color: denim1,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        // TODO add l18n key
                        AppLocale.of(context).add_bank_details,
                        style: inter14.copyWith(
                          color: denim1,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            else
              Column(
                children: [
                  FormTextField(
                    name: AddPaymentFormSettings.kAccountOwnerField,
                    hint: AppLocale.current.account_owner,
                    label: AppLocale.current.account_owner,
                    validationMessages: (control) =>
                        formSettings.validationMessageAccountOwner,
                  ),
                  const SizedBox(height: 16),
                  FormTextField(
                    name: AddPaymentFormSettings.kIbanField,
                    hint: AppLocale.current.iban,
                    label: AppLocale.current.iban,
                    inputFormatters: [
                      IbanInputFormatter(),
                    ],
                    validationMessages: (control) =>
                        formSettings.validationMessageIban,
                  ),
                  if (widget.formConsumer != null)
                    Column(
                      children: [
                        const SizedBox(height: 16),
                        UiCheckbox(
                          name: AddPaymentFormSettings.kAcceptCheckBox,
                          title: Text(
                            AppLocale.current.i_authorize_collect_payment,
                            style: inter12,
                          ),
                          position: Position.left,
                        ),
                        const SizedBox(height: 24),
                        widget.formConsumer!,
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
