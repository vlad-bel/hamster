part of 'app_state_cubit.dart';

enum RegistrationNavigationFlow {
  shouldGoFromLoginToDashboard,
  shouldGoFromLoginToCompanyCreation
}

abstract class RegistrationFlowManager {
  static void shouldGoFromLoginToDashboard() {
    AppState.flowType = RegistrationNavigationFlow.shouldGoFromLoginToDashboard;
  }

  static void shouldGoFromLoginToCompanyCreation() {
    AppState.flowType =
        RegistrationNavigationFlow.shouldGoFromLoginToCompanyCreation;
  }

  static void navigateToNextScreenFromLogin(BuildContext context) {
    switch (AppState.flowType) {
      case RegistrationNavigationFlow.shouldGoFromLoginToDashboard:
        _goToDashboard(context);
        break;
      case RegistrationNavigationFlow.shouldGoFromLoginToCompanyCreation:
        _goToCompanyCreation(context);
        break;
    }
  }

  static void _goToDashboard(BuildContext context) {
    Navigator.of(context).pushNamed(DashboardPage.path);
  }

  static void _goToCompanyCreation(BuildContext context) {
    Navigator.of(context).pushNamed(CompanyCreationPage.path);
  }
}

@immutable
abstract class AppState extends Equatable {
  static RegistrationNavigationFlow flowType =
      RegistrationNavigationFlow.shouldGoFromLoginToDashboard;

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
              case DashboardPage.path:
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
