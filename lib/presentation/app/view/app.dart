import 'package:business_terminal/l10n/l10n.dart';
import 'package:business_terminal/presentation/registration/email_verification/view/email_verification_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loader_overlay/loader_overlay.dart';

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
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        home: const RegistrationPage(),
      ),
    );
  }
}
