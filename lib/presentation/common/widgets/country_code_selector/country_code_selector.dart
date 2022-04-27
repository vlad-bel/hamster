import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/data/model/country/country.dart';
import 'package:business_terminal/l10n/l10n.dart';
import 'package:business_terminal/presentation/common/widgets/country_code_selector/cubit/country_code_selector_cubit.dart';
import 'package:business_terminal/presentation/common/widgets/country_code_selector/cubit/country_code_selector_state.dart';
import 'package:business_terminal/presentation/common/widgets/country_code_selector/widget/country_code_selector_list.dart';
import 'package:business_terminal/presentation/common/widgets/country_code_selector/widget/number_prefix.dart';
import 'package:business_terminal/presentation/registration/widgets/form_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

///Country selector with drop down menu
class CountryCodeSelector extends StatefulWidget {
  const CountryCodeSelector({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  final CountryCodeSelectorCubit cubit;

  @override
  State<CountryCodeSelector> createState() => _CountryCodeSelectorState();
}

class _CountryCodeSelectorState extends State<CountryCodeSelector> {
  OverlayEntry? overlayEntry;

  final layerLink = LayerLink();

  OverlayEntry _createOverlayEntry() {
    final renderBox = context.findRenderObject()! as RenderBox;
    final size = renderBox.size;

    return OverlayEntry(
      builder: (context) {
        return CountryCodeSelectorList(
          cubit: widget.cubit,
          overlayEntry: overlayEntry!,
          layerLink: layerLink,
          size: size,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: widget.cubit,
      builder: (BuildContext context, CountryCodeSelectorState state) {
        return state.when(
          loading: () {
            return FormTextField(
              name: CountryCodeSelectorCubit.numberTextfield,
              hint: context.l10n.select_country_code,
              readOnly: true,
            );
          },
          success: (selectedCountry, countries) {
            return CompositedTransformTarget(
              link: layerLink,
              child: FormTextField(
                name: CountryCodeSelectorCubit.numberTextfield,
                prefixIcon: selectedCountry != null
                    ? NumberPrefix(
                        country: selectedCountry,
                        onTap: () {
                          showOverlay(selectedCountry: selectedCountry);
                        },
                      )
                    : null,
                customSuffix: selectedCountry == null
                    ? Icon(
                        state.runtimeType == CountryCodeSelectorState
                            ? Icons.keyboard_arrow_down_rounded
                            : Icons.keyboard_arrow_up_rounded,
                        size: 16,
                        color: lynch,
                      )
                    : null,
                // label:  context.l10n.select_country_code,
                hint: context.l10n.select_country_code,
                readOnly: selectedCountry == null,
                maxLength: 15,
                keyboardType: TextInputType.phone,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                ],
                validationMessages: (control) => {
                  ValidationMessage.required: context.l10n.required_field,
                },
                onTap: () {
                  if (selectedCountry == null) {
                    showOverlay();
                  }
                },
              ),
            );
          },
          error: (e) {
            return FormTextField(
              name: CountryCodeSelectorCubit.numberTextfield,
              hint: context.l10n.select_country_code,
              readOnly: true,
            );
          },
        );
      },
    );
  }

  void showOverlay({Country? selectedCountry}) {
    widget.cubit.showCountryList(selectedCountry: selectedCountry);
    overlayEntry ??= _createOverlayEntry();
    Overlay.of(context)!.insert(overlayEntry!);
  }
}
