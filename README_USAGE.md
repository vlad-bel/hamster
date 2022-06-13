
## Hamster Terminal Usage Guide

Here will be collected information about common widgets, utils, and  flows
that could face around the project which need to know developers for fast understanding of codebase and fast navigation into the project

- [Navigation](#navigation)
  - [App Navigation State Management](#app-navigation-state-management)
  - [Route Generation](#route-generation)
  - [Route Params](#route-params)
  - [Missing Params case](#missing-params-case)
  - [Using navigation](#using-navigation)
- [Common Widgets](#common-widgets)
  -	[OnboardingBackground](#onboardingbackground)
- [Upload Multipart files](#upload-multipart-files)
- [Navigation into DashboardPage](#navigation-into-dashboardpage)
- [Common widgets repository](#common-widgets-repository)
- [Token refreshing](#token-refreshing)
- [Usecases](#usecases)
- [Uploading multipart files](#uploading_multipart_files)
- ...
- PROFIT

## `Navigation`

Navigation works on Navigator 1.0.
Because now it's the only one solution that works correct on web platform. I've tried to use some popular lib's for navigation based on Navigator 2.0(Routemaster, Beamer, go_router) and all of them faced with some issue.

> Execution of the route after the completion of the asynchronous
> operation into the Bloc/Cubit. In the web version, navigator 2.0 may
> not always make the correct route. After completing a route, it is not
> possible to go back through the back button. Sometimes the route did
> not work correctly, because the router could not determine the desired
> context. This problem is tied to some kind of url string parsing bug
> inside the Navigator 2.0 framework, because this was only seen on the
> web. On Navigator 1.0, this was not a problem.

That's why  navigation into the project have next view:

### `App Navigation State Management`

[AppStateCubit] - Navigation cubit that manage global states of the app. Have
```dart
///updates global state of app during reload and launch
Future checkAuthorization()
```
and
```dart
///determine next steps after sucessful login
Future checkCompanyCreatedGoNext()
```
methods for updating global app states and navigation after authorization.

Have next state for storing application route maps
- - [SplashState] for loading during reload.
- - [UnauthorizeState] for login, registration, reset password flows
- - [AuthorizedState] for dashboard, profile view/edit, create branch flows

### `Route Generation`
Every state contains `RouteFactory? onGenerateRoute` that stores route builder for selected state. Also it contains initialRoute for determine of the first route.

```dart
class UnauthorizedState extends AppState {
  UnauthorizedState({
    required super.initialRoute,
  }) : super(
          onGenerateRoute: (routeSettings) {
            Widget page;
            final params = routeSettings.arguments as Map<String, dynamic>?;
            switch (routeSettings.name) {
              case CountriesCodePage.path:
                page = buildPage(
                  requiredParams: [emailParam],
                  child: CountriesCodePage(
                    email: appStorageService.getString(key: emailParam)!,
                  ),
                );
                break;
              case CallMethodSelectorPage.path:
                if (params?[phoneNumberParam] != null) {
                  final phone = params![phoneNumberParam]! as String;
                  appStorageService.setString(
                    key: phoneNumberParam,
                    value: phone,
                  );
                }

                page = buildPage(
                  requiredParams: [
                    phoneNumberParam,
                    emailParam,
                  ],
                  child: CallMethodSelectorPage(
                    phoneNumber:
                        appStorageService.getString(key: phoneNumberParam)!,
                    email: appStorageService.getString(key: emailParam)!,
                  ),
                );
                break;

              default:
                page = UnknownPage(
                  path: routeSettings.name ?? 'unknown path',
                );
            }

            return PageRouteBuilder<void>(
              transitionDuration: Duration.zero,
              reverseTransitionDuration: Duration.zero,
              pageBuilder: (context, anim1, anim2) {
                return page;
              },
              settings: routeSettings,
            );
          },
        );

  static final appStorageService = getIt.get<AppStorageService>();
}
```
### `Route params`

> For web version of Flutter we faced that during of reloading web page,
> application have dispose all data ram and restores own state from
> scratch. It's led to disposing current objects thats needs for opening
> page. For solving that case was accepted solution for storing route
> parameters into shared_prefences. It's provides safely reloading page
> and restoring input parameters and also launching  project on mobile
> devices

That's why, when you make route, don't forget save incoming params in storage like in example:

```dart
   final phone = params![phoneNumberParam]! as String;
                  appStorageService.setString(
                    key: phoneNumberParam,
                    value: phone,
                  );
                }
```

Passing params  must be map<String, dynamic>:
```dart
void onPressedGoToNextPage(  
  BuildContext context,  
  RepCompany company,  
  CreateBranchProfileCheckboxesData data,  
) {  
  context.read<BranchProfileCubit>().clearData();  
  Navigator.of(context).pushNamed(  
    BranchProfilePage.path,  
    arguments: {  
      BranchProfilePage.paramCompany: company,  
      BranchProfilePage.paramData: data,  
    },  
  );  
}
```


### `Missing params case`

For preventing situation when page opens manually from url path and misses some required params for page, was created next function


```dart
Widget buildPage(List<String>params, Widget child);
```
That checks required params for page, and if one of them is missing it's builds error page with message

```dart
Widget buildPage({  
  required List<String> requiredParams,  
  required Widget child,  
}) {  
  if (checkRequiredParams(requiredParams: requiredParams)) {  
    return child;  
  }  
  return ErrorPage(  
    missingParams: requiredParams,  
  );  
}  
  
bool checkRequiredParams({  
  required List<String> requiredParams,  
}) {  
  final appStorageService = getIt.get<AppStorageService>();  
  
  for (var i = 0; i < requiredParams.length; i++) {  
    if (!appStorageService.containsKey(key: requiredParams[i])) {  
      return false;  
    }  
  }  
  
  return true;  
}
```

#### Using navigation
App states listens on app.dart

```dart
final authNavigatorKey = GlobalKey<NavigatorState>();  
final unauthNavigatorKey = GlobalKey<NavigatorState>();
...
BlocBuilder<AppStateCubit, AppState>(  
  builder: (context, state) {  
    if (state is UnauthorizedState) {  
      return HamsterApp(  
        navKey: unauthNavigatorKey,  
        initialRoute: state.initialRoute,  
        onGenerateRoute: state.onGenerateRoute,  
      );  
    }  
  
    if (state is AuthorizedState) {  
      return HamsterApp(  
        navKey: authNavigatorKey,  
        initialRoute: state.initialRoute,  
        onGenerateRoute: state.onGenerateRoute,  
      );  
    }  
  
    return const HamsterApp(  
      home: SlashPage(),  
    );  
  },  
),
```

HamsterApp class contains MaterialApp that stores Navigator and routes for every app state.

```dart
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
    return Material(  
      child: AnimatedBuilder(  
        animation: GetIt.I<LocaleSettingsController>(),  
        builder: (BuildContext context, Widget? child) {  
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
            supportedLocales: AppLocale.delegate.supportedLocales,  
            locale: GetIt.I<LocaleSettingsController>().locale,  
            home: home,  
          );  
        },  
      ),  
    );  
  }  
}
```

> I used the navigator built into the app material because only the app
> material updates the ```onGenerateRoute``` after refreshing the BlocBuilder
> If this is make using a separate ```Navigator``` class, then the
> ```onGenerateRoute``` will not be updated. It's a Flutter bug...

When happens navigation between states, for example Login -> CompanyCreation, need to make route by navigation keys, that stores in app.dart.
```dart
final authNavigatorKey = GlobalKey<NavigatorState>();  
final unauthNavigatorKey = GlobalKey<NavigatorState>();
```

These keys stores navigation states for AppStates. When need to change state of the app, need to make route using the corresponding key:

```dart
void onSuccess(  
  BuildContext context,  
  String path,  
) {  
  context.loaderOverlay.hide();  
  context.read<AppStateCubit>().goToAuthZone(path);  
  authNavigatorKey.currentState!.pushNamedAndRemoveUntil(  
    path,  
    (predicate) => false,  
  );  
}
```

For routing inside the state, you can use either the standard Navigator.of (context).pushNamed(route_name, params) or use the key:

Default navigation

```dart
Navigator.of(context).pushNamed(  
  BranchProfilePage.path,  
  arguments: {  
    BranchProfilePage.paramCompany: company,  
    BranchProfilePage.paramData: data,  
  },  
);
```

Navigation with key

```dart
final result = await authNavigatorKey  
  .currentState  
  ?.pushNamed<List<AppColoredFile>>(  
  ProfileAddLogoPage.path,  
  arguments: ProfileAddLogoArguments(  
    files: images,  
  ),  
);
```
Both of them approaches makes route inside AuthorizedState

## `Common Widgets`
### `OnboardingBackground`

## `Upload Multipart files`
## `Navigation into DashboardPage`
## `Common widgets repository`
## `Token refreshing`
## `Usecases`
## `Uploading multipart files`