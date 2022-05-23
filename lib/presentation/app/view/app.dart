import 'package:business_terminal/app/utils/l10n/generated/l10n.dart';
import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/presentation/common/snackbar_manager.dart';
import 'package:business_terminal/presentation/common/widgets/dashboard/cubit/dashboard_cubit.dart';
import 'package:business_terminal/presentation/dashboard/account_verification/cubit/account_verification_cubit.dart';
import 'package:business_terminal/presentation/navigation/app_state_cubit/app_state.dart';
import 'package:business_terminal/presentation/navigation/app_state_cubit/app_state_cubit.dart';
import 'package:business_terminal/presentation/navigation/app_state_cubit/authorized_state.dart';
import 'package:business_terminal/presentation/navigation/app_state_cubit/unauthorize_state.dart';
import 'package:business_terminal/presentation/navigation/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loader_overlay/loader_overlay.dart';

final authNavigatorKey = GlobalKey<NavigatorState>();
final unauthNavigatorKey = GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AppStateCubit>(
            create: (_) => AppStateCubit(),
          ),
          BlocProvider<DashboardCubit>(
            create: (_) => getIt.get<DashboardCubit>(),
          ),
          BlocProvider<AccountVerificationCubit>(
            create: (_) => getIt.get<AccountVerificationCubit>(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          scaffoldMessengerKey: snackbarKey,
          theme: ThemeData(
            appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
            colorScheme: ColorScheme.fromSwatch(
              accentColor: const Color(0xFF13B9FF),
            ),
            textTheme: GoogleFonts.interTextTheme(
              Theme.of(context).textTheme.apply(
                    bodyColor: lynch,
                    displayColor: lynch,
                  ),
            ),
            checkboxTheme: CheckboxThemeData(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          locale: Locale('de'),
          home: BlocBuilder<AppStateCubit, AppState>(
            builder: (BuildContext context, state) {
              if (state is UnauthorizedState) {
                return Navigator(
                  key: unauthNavigatorKey,
                  onGenerateRoute: state.onGenerateRoute,
                  initialRoute: state.initialRoute,
                );
              }

              if (state is AuthorizedState) {
                return Navigator(
                  key: authNavigatorKey,
                  onGenerateRoute: state.onGenerateRoute,
                  initialRoute: state.initialRoute,
                );
              }

              return SlashPage();
            },
          ),
        ),
      ),
    );
  }
}
