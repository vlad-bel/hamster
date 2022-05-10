part of 'app_state_cubit.dart';

@immutable
abstract class AppState extends Equatable {
  final RouteFactory onGenerateRoute;
  final String initialRoute;

  const AppState({
    required this.onGenerateRoute,
    required this.initialRoute,
  });

  @override
  List<Object?> get props => [];
}

class UnauthorizedState extends AppState {
  UnauthorizedState({
    required String initialRoute,
  }) : super(
          onGenerateRoute: (routeSettings) {
            late Widget page;
            final params = routeSettings.arguments as Map<String, dynamic>?;
            switch (routeSettings.name) {
              case LoginPage.path:
                page = const LoginPage();
                break;
              case RegistrationPage.path:
                page = const RegistrationPage();
                break;
              case EmailVerificationPage.path:
                final email = params!['email']! as String;
                page = EmailVerificationPage(
                  userEmail: email,
                );
                break;
              case CountriesCodePage.path:
                final email = params!['email']! as String;
                page = CountriesCodePage(
                  email: email,
                );
                break;
              case CallMethodSelectorPage.path:
                final email = params!['email']! as String;
                final phoneNumber = params['phone_number']! as String;
                page = CallMethodSelectorPage(
                  phoneNumber: phoneNumber,
                  email: email,
                );
                break;
              case NumberCodeConfirmationPage.path:
                final phoneNumber = params!['phone']! as String;
                final email = params['email']! as String;
                final method = VerifyMethodExtension.fromString(
                  params['verify_method']! as String,
                );

                page = NumberCodeConfirmationPage(
                  phone: phoneNumber,
                  email: email,
                  verificationMethod: method,
                );
                break;
              case PhoneVerificationResultPage.path:
                page = const PhoneVerificationResultPage();
                break;
              case CompanyCreationPage.path:
                page = const CompanyCreationPage();
                break;
              case '/dashboard':
                page = const DashboardPage();
                break;
            }

            return PageRouteBuilder<void>(
              transitionDuration: Duration.zero,
              reverseTransitionDuration: Duration.zero,
              pageBuilder: (context, anim1, anim2) {
                return page;
              },
              settings: routeSettings,
            );
          },
          initialRoute: initialRoute,
        );
}
