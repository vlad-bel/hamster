import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/domain/repository/token/token_repository.dart';
import 'package:business_terminal/presentation/company_creation/company_creation_page.dart';
import 'package:business_terminal/presentation/login/view/login_page.dart';
import 'package:business_terminal/presentation/navigation/app_state_cubit/app_state.dart';
import 'package:business_terminal/presentation/navigation/app_state_cubit/authorized_state.dart';
import 'package:business_terminal/presentation/navigation/app_state_cubit/splash_state.dart';
import 'package:business_terminal/presentation/navigation/app_state_cubit/unauthorize_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class AppStateCubit extends Cubit<AppState> {
  AppStateCubit()
      : super(
          SplashState(),
        ) {
    checkAuthorization();
  }

  final tokenRepository = getIt.get<TokenRepository>();

  Future checkAuthorization() async {
    await Future<void>.delayed(Duration(seconds: 5));
    final authToken = await tokenRepository.getAccessToken();
    if (authToken != null) {
      return emit(AuthorizedState(
        initialRoute: CompanyCreationPage.path,
      ));
    }

    emit(
      UnauthorizedState(
        initialRoute: LoginPage.path,
      ),
    );
  }

  void goToAuthZone(String initialRoute) {
    emit(
      AuthorizedState(
        initialRoute: initialRoute,
      ),
    );
  }
}
