import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/presentation/common/widgets/form_text_field/form_text_field.dart';
import 'package:flutter/widgets.dart';

class PosListItem extends StatelessWidget {
  const PosListItem({
    Key? key,
    required this.manufacturer,
    required this.model,
    required this.tillCount,
  }) : super(key: key);

  final String manufacturer;
  final String model;
  final int tillCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          Expanded(
            flex: 250,
            child: FormTextField(
              hint: AppLocale.of(context).cash_register_manufacturer,
              label: AppLocale.of(context).cash_register_manufacturer,
              initialText: manufacturer,
              readOnly: true,
              reactive: false,
            ),
          ),
          const SizedBox(width: 32),
          Expanded(
            flex: 250,
            child: FormTextField(
              hint: AppLocale.of(context).model_if_known,
              label: AppLocale.of(context).model_if_known,
              initialText: model,
              readOnly: true,
              reactive: false,
            ),
          ),
          const SizedBox(width: 32),
          Expanded(
            flex: 150,
            child: FormTextField(
              hint: AppLocale.of(context).number_of_registers,
              label: AppLocale.of(context).number_of_registers,
              initialText: AppLocale.current.tills_count(tillCount),
              readOnly: true,
              reactive: false,
            ),
          ),
        ],
      ),
    );
  }
}
