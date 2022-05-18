import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/presentation/common/snackbar_manager.dart';
import 'package:business_terminal/presentation/common/widgets/dashboard/cubit/dashboard_cubit.dart';
import 'package:business_terminal/presentation/dashboard/account_verification/cubit/account_verification_cubit.dart';
import 'package:business_terminal/presentation/navigation/app_state_cubit/app_state.dart';
import 'package:business_terminal/presentation/navigation/app_state_cubit/app_state_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loader_overlay/loader_overlay.dart';

// class App extends StatefulWidget {
//   const App({Key? key}) : super(key: key);
//
//   @override
//   State<App> createState() => _AppState();
// }

final mainNavigatorKey = GlobalKey<NavigatorState>();

class App extends StatelessWidget{

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
        child: BlocBuilder<AppStateCubit, AppState>(
          builder: (BuildContext context, state) {
            print("current route map:${state.initialRoute}");
            return MaterialApp(
              // navigatorKey: navigatorKey,
              debugShowCheckedModeBanner: false,
              scaffoldMessengerKey: snackbarKey,
              onGenerateRoute: state.onGenerateRoute,
              initialRoute: state.initialRoute,
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
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
            );
          },
        ),
      ),
    );
  }
}
