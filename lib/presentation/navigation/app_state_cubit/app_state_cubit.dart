import 'package:business_terminal/presentation/navigation/app_state_cubit/app_state.dart';
import 'package:business_terminal/presentation/navigation/app_state_cubit/authorized_state.dart';
import 'package:business_terminal/presentation/navigation/app_state_cubit/splash_state.dart';
import 'package:business_terminal/presentation/navigation/app_state_cubit/unauthorize_state.dart';
import 'package:business_terminal/use_cases/company/company_use_case.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class AppStateCubit extends Cubit<AppState> {
  AppStateCubit()
      : super(
          SplashState(),
        ) {
    checkAuthorization();
  }

  final tokenRepository = getIt.get<TokenRepository>();
  final companyUseCase = getIt.get<CompanyUsecase>();

  Future checkAuthorization() async {
    final authToken = await tokenRepository.getAccessToken();

    if (authToken != null) {
      return checkCompanyCreatedGoNext();
    }

    emit(
      UnauthorizedState(
        initialRoute: LoginPage.path,
      ),
    );
  }

  Future<void> checkCompanyCreatedGoNext() async {
    try {
      final company = await companyUseCase.getRepCompany();

      if (company != null) {
        return emit(AuthorizedState(
          initialRoute: DashboardPage.path,
        ));
      }

      return emit(AuthorizedState(
        initialRoute: CompanyCreationPage.path,
      ));
    } on ApiFailure catch (e) {
      if (e.response.statusCode == 500) {
        return emit(AuthorizedState(
          initialRoute: CompanyCreationPage.path,
        ));
      }
      emit(UnauthorizedState(
        initialRoute: LoginPage.path,
      ));
    }
  }

  void goToAuthZone(String initialRoute) {
    emit(
      AuthorizedState(
        initialRoute: initialRoute,
      ),
    );
  }

  void goToUnauthZone(String initialRoute) {
    emit(
      UnauthorizedState(
        initialRoute: initialRoute,
      ),
    );
  }
}
