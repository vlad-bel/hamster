import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

abstract class DropDownDataItem {
  abstract int data;
  abstract String text;
}

class PlaceEntranceCount extends DropDownDataItem {
  PlaceEntranceCount(this.data, this.text);

  @override
  int data;

  @override
  String text;
}

class EntrancesCountGenerator {
  static List<PlaceEntranceCount> getEntrancesCountList() {
    const entrancesMaxCount = 20;

    // Generate from 1 to 20
    final resultList = List.generate(
      entrancesMaxCount,
      (i) {
        final value = i + 1;
        return PlaceEntranceCount(value, 'Eingangstüren $value');
      },
    );

    return resultList;
  }
}

class DropDown extends StatelessWidget {
  const DropDown({
    Key? key,
    required this.itemsList,
    required this.onChanged,
    required this.formControlName,
  }) : super(key: key);

  final Function(DropDownDataItem?) onChanged;
  final List<DropDownDataItem> itemsList;
  final String formControlName;

  OutlineInputBorder get outlineInputBorder => const OutlineInputBorder(
        borderSide: BorderSide(
          color: Color(0x4d676f86),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final inputDecoration = InputDecoration(
      border: outlineInputBorder,
      labelText: LocaleKeys.number_of_branch_entrances.tr(),
      floatingLabelAlignment: FloatingLabelAlignment.start,
      floatingLabelStyle: inter12,
      labelStyle: inter14.copyWith(color: lynch.withOpacity(0.3)),
      alignLabelWithHint: true,
      filled: false,
      hintStyle: inter14.copyWith(color: lynch.withOpacity(0.3)),
    );
    return ReactiveDropdownField<DropDownDataItem>(
      formControlName: formControlName,
      onChanged: onChanged,
      decoration: inputDecoration,
      focusColor: Colors.white,
      items: generateDropDownItems(),
    );
  }

  List<DropdownMenuItem<DropDownDataItem>> generateDropDownItems() {
    return itemsList
        .map(
          (DropDownDataItem item) => DropdownMenuItem<DropDownDataItem>(
            value: item,
            child: Text(item.text),
          ),
        )
        .toList();
  }
}
