import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/domain/model/company/branch/branch_profile.dart';

class DaysHours {
  late final String monday;
  late final String tuesday;
  late final String wednesday;
  late final String thursday;
  late final String friday;
  late final String saturday;
  late final String sunday;

  DaysHours(OpeningHours? hours) {
    monday = concatenateStrings(hours?.monday);
    tuesday = concatenateStrings(hours?.tuesday);
    wednesday = concatenateStrings(hours?.wednesday);
    thursday = concatenateStrings(hours?.thursday);
    friday = concatenateStrings(hours?.friday);
    saturday = concatenateStrings(hours?.saturday);
    sunday = concatenateStrings(hours?.sunday);
  }

  String concatenateStrings(List<OpeningHourItem>? str) {
    final buffer = StringBuffer();

    if (str == null || str.isEmpty) {
      return AppLocale.current.closed;
    }

    for (var i = 0; i < str.length; i++) {
      buffer.write('${str[i].from} - ${str[i].to}');

      if (i != str.length - 1) {
        buffer.write(', ');
      }
    }

    return buffer.toString();
  }
}
