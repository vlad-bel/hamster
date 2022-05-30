import 'package:business_terminal/presentation/common/widgets/onboarding_appbar/model/app_language_model.dart';
import 'package:business_terminal/use_cases/settings/language/language_controller.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class LanguageDropdown extends StatefulWidget {
  const LanguageDropdown({Key? key}) : super(key: key);

  @override
  LanguageDropdownState createState() => LanguageDropdownState();
}

class LanguageDropdownState extends State<LanguageDropdown> {
  final languages = GetIt.I<LocaleSettingsController>().getLanguages();
  AppLanguageModel? selectedValue;

  @override
  void initState() {
    super.initState();

    selectedValue = languages.firstWhere(
      (element) =>
          element.languageCode ==
          GetIt.I<LocaleSettingsController>().locale.languageCode,
      orElse: () => languages.first,
    );
    print('selectedValue is $selectedValue');
  }

  Widget buildDropDownListItem(
    AppLanguageModel item, {
    Color color = Colors.white,
  }) =>
      Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Image.asset(item.iconPath, width: 20, height: 20),
          const SizedBox(width: 14),
          Text(
            item.title,
            style: TextStyle(
              fontSize: 14,
              color: color,
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        items: languages
            .map(
              (item) => DropdownMenuItem<AppLanguageModel>(
                value: item,
                child: buildDropDownListItem(
                  item,
                  color: const Color(
                    0xff146dd9,
                  ),
                ),
              ),
            )
            .toList(),
        selectedItemBuilder: (_) => [buildDropDownListItem(selectedValue!)],
        value: selectedValue,
        onChanged: (AppLanguageModel? value) {
          GetIt.I<LocaleSettingsController>().updateLocale(
            value,
          );
          // TODO: replace setState with Bloc in the future
          selectedValue = value;
        },
        icon: const Icon(
          Icons.keyboard_arrow_down_outlined,
          color: Colors.white70,
        ),
        iconOnClick: const Icon(
          Icons.keyboard_arrow_up_outlined,
          color: Colors.white70,
        ),
        buttonHeight: 20,
        buttonWidth: 122,
        itemHeight: 30,
        offset: const Offset(-35, -10),
      ),
    );
  }
}
