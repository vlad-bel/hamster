import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:business_terminal/app/utils/l10n/generated/l10n.dart';
import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:flutter/widgets.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    debugPrint(
      'onChange(${bloc.runtimeType}, $change)',
    );
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  WidgetsFlutterBinding.ensureInitialized();
  for (final element in AppLocale.delegate.supportedLocales) {
    await S.load(element);
  }
  await configureDependencies();

  await runZonedGuarded(
    () async {
      await BlocOverrides.runZoned(
        () async => runApp(
          await builder(),
        ),
        blocObserver: AppBlocObserver(),
      );
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
