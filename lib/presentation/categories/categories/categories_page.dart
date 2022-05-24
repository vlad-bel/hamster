import 'package:business_terminal/presentation/categories/categories/categories_form.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  static const path = '/categories';

  @override
  Widget build(BuildContext context) {
    return CategoriesForm();
  }
}
