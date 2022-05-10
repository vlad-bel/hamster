import 'package:business_terminal/generated/assets.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class AppLanguage {
  AppLanguage(this.language, this.iconPath);

  final String language;

  final String iconPath;

  static List<AppLanguage> getLanguages() {
    return [AppLanguage('German', Assets.flagsGer)];
  }
}

class LanguageDropdown extends StatefulWidget {
  const LanguageDropdown({Key? key}) : super(key: key);

  @override
  LanguageDropdownState createState() => LanguageDropdownState();
}

class LanguageDropdownState extends State<LanguageDropdown> {
  final languages = AppLanguage.getLanguages();
  List<DropdownMenuItem<AppLanguage>> dropDownItems = [];

  AppLanguage? selectedValue;

  @override
  void initState() {
    super.initState();

    selectedValue = languages.first;
    initLanguagesList();
  }

  void initLanguagesList() {
    dropDownItems = languages
        .map(
          (item) => DropdownMenuItem<AppLanguage>(
            value: item,
            child: buildDropDownListItem(item, color: const Color(0xff146dd9)),
          ),
        )
        .toList();
  }

  Widget buildDropDownListItem(
    AppLanguage item, {
    Color color = Colors.white,
  }) =>
      Wrap(
        children: [
          Image.asset(item.iconPath, width: 20, height: 20),
          const SizedBox(width: 14),
          Text(
            item.language,
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
        items: dropDownItems,
        selectedItemHighlightColor: const Color(0x1a147bd9),
        selectedItemBuilder: (_) => [buildDropDownListItem(selectedValue!)],
        value: selectedValue,
        onChanged: (value) {
          // TODO: replace setState with Bloc in the future
          setState(() {
            selectedValue = value! as AppLanguage;
          });
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
