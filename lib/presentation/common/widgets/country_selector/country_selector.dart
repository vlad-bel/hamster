import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/domain/model/country/country.dart';
import 'package:business_terminal/l10n/l10n.dart';
import 'package:business_terminal/presentation/common/widgets/country_selector/widget/country_selector_list.dart';
import 'package:business_terminal/presentation/common/widgets/country_selector/widget/cubit/country_selector_cubit.dart';
import 'package:business_terminal/presentation/common/widgets/country_selector/widget/cubit/country_selector_state.dart';
import 'package:business_terminal/presentation/registration/widgets/form_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

///Country selector with drop down menu
class CountrySelector extends StatefulWidget {
  const CountrySelector({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  final CountrySelectorCubit cubit;

  @override
  State<CountrySelector> createState() => _CountrySelectorState();
}

class _CountrySelectorState extends State<CountrySelector> {
  OverlayEntry? overlayEntry;

  final layerLink = LayerLink();

  OverlayEntry _createOverlayEntry() {
    final renderBox = context.findRenderObject()! as RenderBox;
    final size = renderBox.size;

    return OverlayEntry(
      builder: (context) {
        return CountrySelectorList(
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
    return BlocBuilder<CountrySelectorCubit, CountrySelectorState>(
      bloc: widget.cubit,
      builder: (BuildContext context, CountrySelectorState state) {
        return ReactiveForm(
          formGroup: widget.cubit.countryForm,
          child: state.when(
            loading: () {
              return FormTextField(
                name: CountrySelectorCubit.countryField,
                hint: context.l10n.select_country_code,
                readOnly: true,
              );
            },
            success: (selectedCountry, countries) {
              return CompositedTransformTarget(
                link: layerLink,
                child: FormTextField(
                  name: CountrySelectorCubit.countryField,
                  label: context.l10n.select_country_code,
                  hint: context.l10n.select_country_code,
                  readOnly: true,
                  // validationMessages: (control) => {
                  //   ValidationMessage.required: context.l10n.required_field,
                  // },
                  onTap: showOverlay,
                ),
              );
            },
            error: (e) {
              return FormTextField(
                name: CountrySelectorCubit.countryField,
                hint: context.l10n.select_country_code,
                readOnly: true,
              );
            },
          ),
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
