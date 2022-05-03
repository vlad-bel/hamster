import 'package:business_terminal/presentation/common/snackbar_manager.dart';
import 'package:business_terminal/presentation/company_creation/company_creation_page.dart';
import 'package:business_terminal/presentation/navigation/app_state_cubit/app_state_cubit.dart';
import 'package:business_terminal/presentation/navigation/title_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:routemaster/routemaster.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final appStateCubit = AppStateCubit();

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      child: BlocBuilder<AppStateCubit, AppState>(
        bloc: appStateCubit,
        builder: (BuildContext context, state) {
          // return MaterialApp(
          return MaterialApp.router(
            scaffoldMessengerKey: snackbarKey,
            routeInformationParser: const RoutemasterParser(),
            // routeInformationProvider: PlatformRouteInformationProvider(
            //   initialRouteInformation: const RouteInformation(),
            // ),
            routerDelegate: RoutemasterDelegate(
              observers: [
                TitleObserver(),
              ],
              routesBuilder: (context) => state.routeMap,
            ),
            // home: const CompanyCreationPage(),
            theme: ThemeData(
              appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
              colorScheme: ColorScheme.fromSwatch(
                accentColor: const Color(0xFF13B9FF),
              ),
              textTheme: GoogleFonts.interTextTheme(
                Theme.of(context).textTheme.apply(
                      bodyColor: const Color(0xff676f86),
                      displayColor: const Color(0xff676f86),
                    ),
              ),
            ),
            supportedLocales: const [
              Locale('de'),
            ],
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
          );
        },
      ),
    );
  }
}
