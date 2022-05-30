import 'package:business_terminal/presentation/navigation/app_state_cubit/app_state.dart';
import 'package:flutter/material.dart';

class SplashState extends AppState {
  SplashState()
      : super(
          initialRoute: '/',
          onGenerateRoute: (settings) {
            return PageRouteBuilder<void>(
              transitionDuration: Duration.zero,
              reverseTransitionDuration: Duration.zero,
              pageBuilder: (context, anim1, anim2) {
                return Scaffold(
                  body: Center(
                    child: Text(
                      // TODO add locale
                      'Splash page',
                    ),
                  ),
                );
              },
              settings: settings,
            );
          },
        );
}
