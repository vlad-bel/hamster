import 'package:business_terminal/presentation/registration/view/password_checkboxes_view.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

class HotreloadWidgetbook extends StatefulWidget {
  const HotreloadWidgetbook({Key? key}) : super(key: key);

  @override
  State<HotreloadWidgetbook> createState() => _HotreloadWidgetbookState();
}

class _HotreloadWidgetbookState extends State<HotreloadWidgetbook> {
  TextEditingController controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final passwordValidationWindow = Padding(
      padding: const EdgeInsets.all(8),
      child: SizedBox(
        width: 400,
        child: Stack(
          children: [
            Center(
              child: PasswordValidationView(
                onPressed: () => print("pressedClose"),
                controllerPassword: controllerPassword,
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Icon(
                Icons.arrow_left_sharp,
                color: Colors.red,
                size: 80,
              ),
            ),
          ],
        ),
      ),
    );

    return Widgetbook.material(
      categories: [
        WidgetbookCategory(
          name: 'widgets',
          widgets: [
            WidgetbookComponent(
              name: 'Registration',
              useCases: [
                WidgetbookUseCase(
                  name: 'password validation window',
                  builder: (context) {
                    return passwordValidationWindow;
                  },
                ),
              ],
            ),
          ],
        )
      ],
      themes: [
        WidgetbookTheme(
          name: 'Light',
          data: ThemeData.light(),
        ),
        WidgetbookTheme(
          name: 'Dark',
          data: ThemeData.dark(),
        ),
      ],
      appInfo: AppInfo(name: 'Example'),
    );
  }
}
