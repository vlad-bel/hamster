import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/generated/locale_keys.g.dart';
import 'package:business_terminal/presentation/common/widgets/country_selector/widget/cubit/country_selector_cubit.dart';
import 'package:business_terminal/presentation/common/widgets/country_selector/widget/cubit/country_selector_state.dart';
import 'package:business_terminal/presentation/registration/widgets/form_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CountrySelectorList extends StatelessWidget {
  const CountrySelectorList({
    Key? key,
    required this.layerLink,
    required this.cubit,
    required this.overlayEntry,
    required this.size,
    required this.filterFocusNode,
  }) : super(key: key);

  final LayerLink layerLink;
  final CountrySelectorCubit cubit;
  final OverlayEntry overlayEntry;
  final Size size;
  final FocusNode filterFocusNode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: cubit,
      builder: (context, CountrySelectorState state) {
        return state.when(
          loading: SizedBox.new,
          close: (selectedCountry, countries) {
            return const SizedBox();
          },
          open: (selectedCountry, countries) {
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
                            formGroup: cubit.countryForm,
                            child: FormTextField(
                              focusListener: filterFocusNode,
                              name: CountrySelectorCubit.filterTextfield,
                              hint: tr(LocaleKeys.country_name),
                              customSuffix: CupertinoButton(
                                child: const Icon(
                                  Icons.close,
                                  size: 16,
                                  color: lynch,
                                ),
                                onPressed: () {
                                  cubit.countryForm
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
                        height: countries!.length * 50,
                        constraints: const BoxConstraints(maxHeight: 200),
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            final country = countries[index];
                            return ListTile(
                              onTap: () {
                                cubit.selectCountry(country);
                                filterFocusNode.unfocus();
                                overlayEntry.remove();
                              },
                              title: SizedBox(
                                width: size.width,
                                child: Row(
                                  children: [
                                    Text(country.emoji),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: Text(
                                        '${country.name}',
                                        style: inter12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount: countries.length,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          error: (e) => const SizedBox(),
        );
      },
    );
  }
}
