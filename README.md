# Business Terminal

Hamster Systems Business Terminal

---

## Getting Started 🚀

Clone the repo

``` bash
git clone ssh/http_source
```

Get pub dependencies

``` bash
flutter pub get
```

Generate .g and .freezed generated files

``` bash
flutter packages pub run build_runner build --delete-conflicting-outputs
```

Generate localization files

``` bash
flutter/dart pub add intl_utils
flutter/dart pub global activate intl_utils 2.6.1
flutter/dart pub global run intl_utils:generate
```

> Attention:
> Localization files will autogenerate on .arb file saves

This project contains 3 flavors:

- development
- staging
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the
following commands:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart
```

_\*Business Terminal works on iOS, Android, Web, and Windows._

---

## Running Tests 🧪

To run all unit and widget tests use the following command:

```sh
flutter test --coverage --test-randomize-ordering-seed random
```

To view the generated coverage report you can use [lcov](https://github.com/linux-test-project/lcov)
.

```sh
# Generate Coverage Report
$ genhtml coverage/lcov.info -o coverage/

# Open Coverage Report
$ open coverage/index.html
```

---

## Working with Translations 🌐

This project relies on [flutter_localizations][flutter_localizations_link] and follows
the [official internationalization guide for Flutter][internationalization_link].

### Adding Strings

1. For example to add a new localizable string, open the `intl_en.arb` file
   at `assets/l10n/intl_en.arb`.

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    }
}
```

2. Then add a new key/value and description

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    },
    "helloWorld": "Hello World",
    "@helloWorld": {
        "description": "Hello World Text"
    }
}
```

3. Use the new string

```dart
import 'package:business_terminal/app/utils/l10n/l10n_service.dart';

@override
Widget build(BuildContext context) {
  return Text(AppLocale.of(context).helloWorld);
}
```

### Adding Supported Locales

Update the `CFBundleLocalizations` array in the `Info.plist` at `ios/Runner/Info.plist` to include
the new locale.

```xml
    ...

<key>CFBundleLocalizations</key>    <array>
<string>en</string>
<string>de</string>
</array>

    ...
```

### Adding Translations

1. For each supported locale, add a new ARB file in `assets/l10n/`.

```
├── assets
│   ├── l10n
│   │   ├── intl_en.arb
│   │   └── intl_de.arb
```

2. Add the translated strings to each `.arb` file:

`intl_en.arb`

```arb
{
    "@@locale": "en",
    "registrationAppBarTitle": "Registration"
}
```

`intl_de.arb`

```arb
{
    "@@locale": "ru",
    "registrationAppBarTitle": "Anmeldung"
}
```

[flutter_localizations_link]: https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html

[internationalization_link]: https://flutter.dev/docs/development/accessibility-and-localization/internationalization

### Translations code gen

To generate new localization keys:

``` bash
flutter/dart pub add intl_utils
flutter/dart pub global activate intl_utils 2.6.1
flutter/dart pub global run intl_utils:generate
```

Code generation already configured in CI/CD.
