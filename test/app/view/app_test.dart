import 'package:business_terminal/presentation/app/view/app.dart';
import 'package:business_terminal/presentation/registration/view/registration_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('App', () {
    testWidgets('renders RegistrationPage', (tester) async {
      await tester.pumpWidget(App());
      expect(find.byType(RegistrationPage), findsOneWidget);
    });
  });
}
