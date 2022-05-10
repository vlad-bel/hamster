import 'package:business_terminal/domain/model/country/country.dart';
import 'package:business_terminal/presentation/common/widgets/country_selector/widget/country_selector_list.dart';
import 'package:business_terminal/presentation/common/widgets/country_selector/widget/cubit/country_selector_cubit.dart';
import 'package:business_terminal/presentation/common/widgets/country_selector/widget/cubit/country_selector_state.dart';
import 'package:business_terminal/presentation/registration/widgets/form_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
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

  final focusNode = FocusNode();
  final filterFocusNode = FocusNode();

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
          filterFocusNode: filterFocusNode,
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    final cubit = BlocProvider.of<CountrySelectorCubit>(context);
    focusNode.addListener(() {
      if (focusNode.hasFocus || filterFocusNode.hasFocus) {
        cubit.state.whenOrNull(
          close: (_, __) {
            showOverlay();
          },
        );
      } else {
        cubit.state.whenOrNull(
          close: (country, __) {
            cubit.selectCountry(country);
          },
          open: (country, __) {
            cubit.selectCountry(country);
          },
        );

        overlayEntry!.remove();
      }
    });
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
              return  FormTextField(
                name: CountrySelectorCubit.countryField,
                hint: tr('country_hint'),
                readOnly: true,
              );
            },
            open: (selectedCountry, countries) {
              return CompositedTransformTarget(
                link: layerLink,
                child: FormTextField(
                  focusListener: focusNode,
                  name: CountrySelectorCubit.countryField,
                  label: tr('country_hint'),
                  hint: tr('country_hint'),
                  readOnly: true,
                ),
              );
            },
            close: (selectedCountry, countries) {
              return CompositedTransformTarget(
                link: layerLink,
                child: FormTextField(
                  focusListener: focusNode,
                  name: CountrySelectorCubit.countryField,
                  label: tr('country_hint'),
                  hint: tr('country_hint'),
                  readOnly: true,
                  onTap: showOverlay,
                ),
              );
            },
            error: (e) {
              return FormTextField(
                focusListener: focusNode,
                name: CountrySelectorCubit.countryField,
                hint: tr('country_hint'),
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
