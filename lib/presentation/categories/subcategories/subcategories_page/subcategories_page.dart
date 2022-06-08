import 'package:business_terminal/presentation/categories/subcategories/select_subcategories_page/select_subcategories_page.dart';
import 'package:business_terminal/presentation/categories/subcategories/subcategories_page/subcategories_form.dart';
import 'package:flutter/material.dart';

class SubcategoriesPage extends StatelessWidget {
  const SubcategoriesPage({Key? key}) : super(key: key);

  static const path = '${SelectSubCategoriesPage.path}/subcategories';

  @override
  Widget build(BuildContext context) {
    return const SubcategoriesForm();
  }
}
