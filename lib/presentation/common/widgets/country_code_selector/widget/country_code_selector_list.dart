import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/presentation/common/widgets/country_code_selector/cubit/country_code_selector_cubit.dart';
import 'package:business_terminal/presentation/common/widgets/country_code_selector/cubit/country_code_selector_state.dart';
import 'package:business_terminal/presentation/registration/widgets/form_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CountryCodeSelectorList extends StatelessWidget {
  const CountryCodeSelectorList({
    Key? key,
    required this.layerLink,
    required this.cubit,
    required this.overlayEntry,
    required this.size,
  }) : super(key: key);

  final LayerLink layerLink;
  final CountryCodeSelectorCubit cubit;
  final OverlayEntry overlayEntry;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: cubit,
      builder: (context, state) {
        if (state is CountryCodeSelectorOpenedState) {
          return Positioned(
            width: size.width,
            child: CompositedTransformFollower(
              showWhenUnlinked: false,
              link: layerLink,
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
                            name: CountryCodeSelectorCubit.filterTextfield,
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
                                      CountryCodeSelectorCubit.filterTextfield,
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
                                    CountryCodeSelectorCubit.numberTextfield,
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
                                const SizedBox(width: 16),
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
  }
}
