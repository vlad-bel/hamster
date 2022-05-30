import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/presentation/common/widgets/categories_list/cubit/categories_list_cubit.dart';
import 'package:business_terminal/presentation/common/widgets/form_text_field/form_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesListSearch extends StatefulWidget {
  const CategoriesListSearch({
    Key? key,
    required this.hasFocus,
  }) : super(key: key);

  final bool hasFocus;

  @override
  State<CategoriesListSearch> createState() => _CategoriesListSearchState();
}

class _CategoriesListSearchState extends State<CategoriesListSearch> {
  final focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    final cubit = context.read<CategoriesListCubit>();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        cubit.setFocus();
      } else {
        cubit.unfocus();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(4),
          topRight: Radius.circular(4),
        ),
        color: widget.hasFocus ? white : lynch.withOpacity(0.1),
      ),
      child: FormTextField(
        focusListener: focusNode,
        name: CategoriesListCubit.searchFormField,
        hint: AppLocale.current.search,
        keyboardType: TextInputType.text,
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Icon(
            Icons.search,
            color: lynch.withOpacity(0.3),
          ),
        ),
        suffix: focusNode.hasFocus
            ? Transform.translate(
                offset: Offset(0, 4),
                child: MaterialButton(
                  onPressed: _clearFilter,
                  padding: EdgeInsets.zero,
                  minWidth: 32,
                  height: 16,
                  child: Icon(
                    Icons.close_rounded,
                    color: lynch,
                    size: 16,
                  ),
                ),
              )
            : null,
        customBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: lynch.withOpacity(0.3),
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4),
            topRight: Radius.circular(4),
          ),
        ),
      ),
    );
  }

  void _clearFilter() {
    context.read<CategoriesListCubit>().clearSearchForm();
  }
}
