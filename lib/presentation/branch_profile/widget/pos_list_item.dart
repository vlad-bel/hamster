import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/presentation/common/widgets/form_text_field/form_text_field.dart';
import 'package:flutter/widgets.dart';

class PosListItem extends StatelessWidget {
  const PosListItem({Key? key, required this.index}) : super(key: key);

  final int index;

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
              // TODO(dvakhnin): integrate with BE
              initialText: 'Manufacturer',
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
              // TODO(dvakhnin): integrate with BE
              initialText: 'Model',
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
              // TODO(dvakhnin): integrate with BE
              initialText: 'Kassa $index',
              readOnly: true,
              reactive: false,
            ),
          ),
        ],
      ),
    );
  }
}
