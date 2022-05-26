import 'package:business_terminal/app/utils/l10n/generated/l10n.dart';
import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/presentation/categories/cubit/subcategories_cubit.dart';
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

import '../../branch_profile_picture/branch_profile_picture_page.dart';

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
          BlocProvider<SubcategoriesCubit>(
            create: (BuildContext context) {
              return getIt.get<SubcategoriesCubit>();
            },
          )
        ],
        child: BlocBuilder<AppStateCubit, AppState>(
          builder: (context, state) {
            // if (state is UnauthorizedState) {
            //   return HamsterApp(
            //     navKey: unauthNavigatorKey,
            //     initialRoute: state.initialRoute,
            //     onGenerateRoute: state.onGenerateRoute,
            //   );
            // }
            //
            // if (state is AuthorizedState) {
            //   return HamsterApp(
            //     navKey: authNavigatorKey,
            //     initialRoute: state.initialRoute,
            //     onGenerateRoute: state.onGenerateRoute,
            //   );
            // }

            return HamsterApp(
              // home: SlashPage(),
              home: BranchProfilePicturePage(),
            );
          },
        ),
      ),
    );
  }
}

class HamsterApp extends StatelessWidget {
  const HamsterApp({
    Key? key,
    this.initialRoute,
    this.onGenerateRoute,
    this.home,
    this.navKey,
  }) : super(key: key);

  final String? initialRoute;
  final RouteFactory? onGenerateRoute;
  final Widget? home;
  final GlobalKey<NavigatorState>? navKey;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navKey,
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: snackbarKey,
      initialRoute: initialRoute,
      onGenerateRoute: onGenerateRoute,
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
      locale: Locale('en'),
      home: home,
    );
  }
}
