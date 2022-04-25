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
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

///Country selector with drop down menu
class CountryCodeSelector extends StatefulWidget {
  final Function(String) onChange;

  const CountryCodeSelector({
    Key? key,
    required this.onChange,
  }) : super(key: key);

  @override
  State<CountryCodeSelector> createState() => _CountryCodeSelectorState();
}

class _CountryCodeSelectorState extends State<CountryCodeSelector> {
  late final OverlayEntry overlayEntry;

  final layerLink = LayerLink();

  late final CountryCodeSelectorCubit cubit;
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    cubit = CountryCodeSelectorCubit(
      onChange: widget.onChange,
    );
  }

  OverlayEntry _createOverlayEntry() {
    final renderBox = context.findRenderObject()! as RenderBox;
    final size = renderBox.size;

    return OverlayEntry(
      builder: (context) {
        return CountryCodeSelectorList(
          cubit: cubit,
          overlayEntry: overlayEntry,
          layerLink: layerLink,
          size: size,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: cubit,
      builder: (BuildContext context, CountryCodeSelectorState state) {
        return CompositedTransformTarget(
          link: layerLink,
          child: ReactiveForm(
            formGroup: cubit.numberForm,
            child: FormTextField(
              name: CountryCodeSelectorCubit.numberTextfield,
              prefixIcon: state.selectedCountry != null
                  ? NumberPrefix(
                      country: state.selectedCountry!,
                      onTap: () {
                        showOverlay(selectedCountry: state.selectedCountry);
                      },
                    )
                  : null,
              customSuffix: state.selectedCountry == null
                  ? Icon(
                      state.runtimeType == CountryCodeSelectorState
                          ? Icons.keyboard_arrow_down_rounded
                          : Icons.keyboard_arrow_up_rounded,
                      size: 16,
                      color: lynch,
                    )
                  : null,
              hint: context.l10n.select_country_code,
              readOnly: state.selectedCountry == null,
              onTap: () {
                if (state.selectedCountry == null) {
                  showOverlay();
                }
              },
            ),
          ),
        );
      },
    );
  }

  void showOverlay({Country? selectedCountry}) {
    cubit.showCountryList(selectedCountry: selectedCountry);
    overlayEntry = _createOverlayEntry();
    Overlay.of(context)!.insert(overlayEntry);
  }
}
