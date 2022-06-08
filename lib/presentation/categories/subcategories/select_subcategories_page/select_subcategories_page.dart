import 'package:business_terminal/presentation/categories/categories/categories_page.dart';
import 'package:business_terminal/presentation/categories/subcategories/select_subcategories_page/select_subcategories_form.dart';
import 'package:flutter/material.dart';

class SelectSubCategoriesPage extends StatelessWidget {
  const SelectSubCategoriesPage({Key? key}) : super(key: key);

  static const path = '${CategoriesPage.path}/select_subcategories';

  @override
  Widget build(BuildContext context) {
    return const SelectSubCategoriesForm();
  }
}
