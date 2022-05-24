import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/presentation/categories/subcategories/cubit/subcategories_cubit.dart';
import 'package:business_terminal/presentation/categories/subcategories/cubit/subcategories_state.dart';
import 'package:business_terminal/presentation/categories/subcategories/select_subcategories_page/widget/selected_subcategory_list.dart';
import 'package:business_terminal/presentation/categories/subcategories/subcategories_page/subcategories_page.dart';
import 'package:business_terminal/presentation/common/widgets/bordered_container.dart';
import 'package:business_terminal/presentation/common/widgets/dashed_button/dashed_button.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_background.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container_header.dart';
import 'package:business_terminal/presentation/registration/widgets/action_button_blue.dart';
import 'package:business_terminal/presentation/registration/widgets/white_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectSubCategoriesForm extends StatelessWidget {
  const SelectSubCategoriesForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubcategoriesCubit, SubcategoriesState>(
      builder: (context, state) {
        final cubit = context.read<SubcategoriesCubit>();
        return OnboardingBackground(
          hasScroll: false,
          children: OnboardingWhiteContainer(
            header: OnboardingWhiteContainerHeader(
              header: AppLocale.current.select_subcategories,
              subHeader: Text(
                AppLocale.current.select_subcategories_descr,
                style: inter14,
              ),
            ),
            body: Column(
              children: [
                if (state.selectedSubcategories.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: SizedBox(
                      width: 350,
                      height: 246,
                      child: BorderedContainer(
                        title: AppLocale.current.subcategory,
                        child: SelectedSubcategoryList(),
                      ),
                    ),
                  ),
                SizedBox(height: 24),
                DashedButton(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      SubcategoriesPage.path,
                    );
                  },
                  label: AppLocale.current.add_subcategory,
                ),
                SizedBox(height: 36),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    WhiteButton(
                      width: 162,
                      child: Text(
                        AppLocale.current.return_button,
                        style: inter14.copyWith(
                          color: denim,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    ActionButtonBlue(
                      width: 162,
                      child: Text(
                        AppLocale.current.continue_button,
                        style: inter14.copyWith(
                          color: white,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
