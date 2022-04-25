import 'package:business_terminal/presentation/number_verification/pages/country_code/country_code_page.dart';
import 'package:business_terminal/presentation/registration/view/registration_page.dart';
import 'package:business_terminal/presentation/number_verification/call_method_selector_page/call_method_selector_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      child: MaterialApp(
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
        // home: const RegistrationPage(),
        // home: const EmailVerificationPage(),
        // home: const NumberVerificationForm(),
        // home: const CountriesCodePage(),
        // home: const NumberCodeConfirmationPage(),
        home: const CallMethodSelectorPage(),
      ),
    );
  }
}
