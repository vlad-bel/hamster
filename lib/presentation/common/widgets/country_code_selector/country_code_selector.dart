import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/domain/model/country/country.dart';
import 'package:business_terminal/presentation/common/widgets/country_code_selector/cubit/country_code_selector_cubit.dart';
import 'package:business_terminal/presentation/common/widgets/country_code_selector/cubit/country_code_selector_state.dart';
import 'package:business_terminal/presentation/common/widgets/country_code_selector/widget/country_code_selector_list.dart';
import 'package:business_terminal/presentation/common/widgets/country_code_selector/widget/number_prefix.dart';
import 'package:business_terminal/presentation/common/widgets/form_text_field/form_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

///Country selector with drop down menu
class CountryCodeSelector extends StatefulWidget {
  const CountryCodeSelector({
    super.key,
    required this.cubit,
    required this.loading,
  });

  final CountryCodeSelectorCubit cubit;
  final bool loading;

  @override
  State<CountryCodeSelector> createState() => _CountryCodeSelectorState();
}

class _CountryCodeSelectorState extends State<CountryCodeSelector> {
  final layerLink = LayerLink();
  OverlayEntry? overlayEntry;

  void showOverlay({Country? selectedCountry}) {
    widget.cubit.state.whenOrNull(
      init: (country, countryList) {
        overlayEntry ??= _createOverlayEntry();
        Overlay.of(context)?.insert(overlayEntry!);
        widget.cubit.showCountryList(selectedCountry: selectedCountry);
      },
    );
  }

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
              hint: AppLocale.of(context).select_country_code,
              readOnly: true,
            );
          },
          open: (selectedCountry, countries) {
            return _Selector(
              state: state,
              selectedCountry: selectedCountry,
              layerLink: layerLink,
              overlayEntry: overlayEntry,
              showOverlay: showOverlay,
              loading: widget.loading,
            );
          },
          init: (selectedCountry, countries) {
            return _Selector(
              state: state,
              selectedCountry: selectedCountry,
              layerLink: layerLink,
              overlayEntry: overlayEntry,
              showOverlay: showOverlay,
              loading: widget.loading,
            );
          },
          error: (e) {
            return FormTextField(
              name: CountryCodeSelectorCubit.numberTextfield,
              hint: AppLocale.of(context).select_country_code,
              readOnly: true,
            );
          },
        );
      },
    );
  }
}

class _Selector extends StatelessWidget {
  const _Selector({
    super.key,
    required this.overlayEntry,
    required this.layerLink,
    required this.selectedCountry,
    required this.showOverlay,
    required this.state,
    required this.loading,
  });

  final LayerLink layerLink;
  final bool loading;
  final OverlayEntry? overlayEntry;
  final Country? selectedCountry;
  final Function({Country selectedCountry}) showOverlay;
  final CountryCodeSelectorState state;

  int _getPhoneLenghtString(int numLength) {
    return numLength - (selectedCountry?.phone.length ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: layerLink,
      child: FormTextField(
        name: CountryCodeSelectorCubit.numberTextfield,
        counter: const SizedBox(),
        prefixIcon: selectedCountry != null
            ? NumberPrefix(
                country: selectedCountry!,
                onTap: loading
                    ? null
                    : () {
                        showOverlay(selectedCountry: selectedCountry!);
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
        hint: AppLocale.of(context).select_country_code,
        readOnly: selectedCountry == null,
        keyboardType: TextInputType.phone,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp('[0-9]')),
        ],
        validationMessages: (control) => {
          ValidationMessage.required: AppLocale.of(context).required_field,
          ValidationMessage.minLength: AppLocale.of(context).min_number(
            _getPhoneLenghtString(10),
          ),
          ValidationMessage.maxLength: AppLocale.of(context).max_number(
            _getPhoneLenghtString(15),
          ),
        },
        onTap: loading
            ? null
            : () {
                if (selectedCountry == null) {
                  showOverlay();
                }
              },
      ),
    );
  }
}
