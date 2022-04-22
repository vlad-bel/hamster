import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/data/model/country/country.dart';
import 'package:business_terminal/presentation/countries_list/country_selector/cubit/country_selector_cubit.dart';
import 'package:business_terminal/presentation/registration/widgets/form_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

///Country selector with drop down menu
class CountrySelector extends StatefulWidget {
  const CountrySelector({
    Key? key,
  }) : super(key: key);

  @override
  State<CountrySelector> createState() => _CountrySelectorState();
}

class _CountrySelectorState extends State<CountrySelector> {
  late OverlayEntry overlayEntry;

  final _layerLink = LayerLink();

  final cubit = CountrySelectorCubit();
  final TextEditingController controller = TextEditingController();

  OverlayEntry _createOverlayEntry() {
    final renderBox = context.findRenderObject()! as RenderBox;
    final size = renderBox.size;

    return OverlayEntry(
      builder: (context) {
        return BlocBuilder(
          bloc: cubit,
          builder: (context, state) {
            if (state is CountrySelectorOpenedState) {
              return Positioned(
                width: size.width,
                child: CompositedTransformFollower(
                  showWhenUnlinked: false,
                  link: _layerLink,
                  offset: Offset(0, size.height),
                  child: Material(
                    elevation: 4,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          color: lynch.withOpacity(0.1),
                          child: Container(
                            color: white,
                            child: ReactiveForm(
                              formGroup: cubit.numberForm,
                              child: FormTextField(
                                name: CountrySelectorCubit.filterTextfield,
                                hint: 'country name',
                                customSuffix: CupertinoButton(
                                  child: const Icon(
                                    Icons.close,
                                    size: 16,
                                    color: lynch,
                                  ),
                                  onPressed: () {
                                    cubit.numberForm
                                        .control(
                                          CountrySelectorCubit.filterTextfield,
                                        )
                                        .value = '';
                                  },
                                ),
                                prefixIcon: Icon(
                                  Icons.search_rounded,
                                  size: 26,
                                  color: lynch.withOpacity(0.3),
                                ),
                                customBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: denim,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: state.countryList.length * 50,
                          constraints: const BoxConstraints(maxHeight: 200),
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              final country = state.countryList[index];
                              return ListTile(
                                onTap: () {
                                  cubit.numberForm
                                      .control(
                                        CountrySelectorCubit.numberTextfield,
                                      )
                                      .value = '';
                                  cubit.selectCountry(country);
                                  overlayEntry.remove();
                                },
                                title: Row(
                                  children: [
                                    Image.asset(
                                      country.countryImage,
                                      width: 20,
                                    ),
                                    SizedBox(width: 16),
                                    Text(
                                      '${country.countryName} (${country.countryCode})',
                                      style: inter12,
                                    ),
                                  ],
                                ),
                              );
                            },
                            itemCount: state.countryList.length,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
            return const SizedBox();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: cubit,
      builder: (BuildContext context, CountrySelectorState state) {
        return CompositedTransformTarget(
          link: _layerLink,
          child: ReactiveForm(
            formGroup: cubit.numberForm,
            child: FormTextField(
              name: CountrySelectorCubit.numberTextfield,
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
                      state.runtimeType == CountrySelectorState
                          ? Icons.keyboard_arrow_down_rounded
                          : Icons.keyboard_arrow_up_rounded,
                      size: 16,
                      color: lynch,
                    )
                  : null,
              hint: AppLocalizations.of(context).select_country_code,
              // label: AppLocalizations.of(context).select_country_code,
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

class NumberPrefix extends StatelessWidget {
  const NumberPrefix({
    Key? key,
    required this.country,
    required this.onTap,
  }) : super(key: key);

  final Country country;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(width: 16),
          Image.asset(
            country.countryImage,
            width: 20,
          ),
          SizedBox(width: 8),
          const Icon(
            Icons.keyboard_arrow_down_rounded,
            size: 16,
            color: lynch,
          ),
          SizedBox(width: 8),
          Container(
            width: 1,
            height: 22,
            color: lynch.withOpacity(0.3),
          ),
          SizedBox(width: 8),
          Text(
            country.countryCode,
            style: inter14,
          ),
          SizedBox(width: 8),
        ],
      ),
    );
  }
}
