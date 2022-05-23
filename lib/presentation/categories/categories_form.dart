import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/presentation/common/widgets/categories_list/categories_list.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_background.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container_header.dart';
import 'package:flutter/material.dart';

class CategoriesForm extends StatelessWidget {
  const CategoriesForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OnboardingBackground(
      children: OnboardingWhiteContainer(
        header: OnboardingWhiteContainerHeader(
          header: AppLocale.current.choose_main_category,
          subHeader: Text(
            AppLocale.current.choose_main_category_descr,
            style: inter14,
          ),
        ),
        body: Column(
          children: [
            CategoriesList(
              data: [
                ///todo remove mock data
                "Test",
                "Abc",
                "Qqwerty",
                "1234",
                "Test",
                "Abc",
                "Qqwerty",
                "1234",
                "Test",
                "Abc",
                "Qqwerty",
                "1234",
              ],
              onSelect: (selectedItem) {},
            ),
          ],
        ),
      ),
    );
  }
}
