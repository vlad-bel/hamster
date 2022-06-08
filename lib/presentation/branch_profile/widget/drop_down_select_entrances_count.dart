import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
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
  static List<PlaceEntranceCount> getEntrancesCountList({
    int entrancesMaxCount = 20,
    CounterType type = CounterType.entrance,
  }) {
    // Generate from 1 to [entrancesMaxCount]
    final resultList = List.generate(
      entrancesMaxCount,
      (i) {
        final value = i + 1;
        return PlaceEntranceCount(
          value,
          type == CounterType.entrance
              ? AppLocale.current.entrances_count(value)
              : AppLocale.current.tills_count(value),
        );
      },
    );

    return resultList;
  }
}

enum CounterType { entrance, till }

class DropDown extends StatelessWidget {
  const DropDown({
    Key? key,
    required this.itemsList,
    required this.formControlName,
  }) : super(key: key);

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
      labelText: AppLocale.current.number_of_branch_entrances,
      floatingLabelAlignment: FloatingLabelAlignment.start,
      floatingLabelStyle: inter12,
      labelStyle: inter14.copyWith(color: lynch.withOpacity(0.3)),
      alignLabelWithHint: true,
      filled: false,
      hintStyle: inter14.copyWith(color: lynch.withOpacity(0.3)),
    );
    return ReactiveDropdownField<DropDownDataItem>(
      formControlName: formControlName,
      decoration: inputDecoration,
      focusColor: Colors.white,
      items: generateDropDownItems(),
      validationMessages: (control) => {
        ValidationMessage.required: AppLocale.current.required_field,
      },
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
