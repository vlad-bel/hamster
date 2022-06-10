import 'package:business_terminal/domain/model/company/branch/branch_profile.dart';

class DaysHours {
  DaysHours(OpeningHours? hours) {
    monday = concatenateStrings(hours?.monday);
    tuesday = concatenateStrings(hours?.tuesday);
    wednesday = concatenateStrings(hours?.wednesday);
    thursday = concatenateStrings(hours?.thursday);
    friday = concatenateStrings(hours?.friday);
    saturday = concatenateStrings(hours?.saturday);
    sunday = concatenateStrings(hours?.sunday);
  }

  DaysHours.empty();

  String monday = '';
  String tuesday = '';
  String wednesday = '';
  String thursday = '';
  String friday = '';
  String saturday = '';
  String sunday = '';

  List<String> get hours => [
        monday,
        tuesday,
        wednesday,
        thursday,
        friday,
        saturday,
        sunday,
      ];

  OpeningHours originalObject() {
    final monday = splitStrings(this.monday);
    final tuesday = splitStrings(this.tuesday);
    final wednesday = splitStrings(this.wednesday);
    final thursday = splitStrings(this.thursday);
    final friday = splitStrings(this.friday);
    final saturday = splitStrings(this.saturday);
    final sunday = splitStrings(this.sunday);

    return OpeningHours(
      monday,
      tuesday,
      wednesday,
      thursday,
      friday,
      saturday,
      sunday,
    );
  }

  String concatenateStrings(List<OpeningHourItem>? str) {
    if (str == null || str.isEmpty) {
      return '';
    }

    final buffer = StringBuffer();

    for (var i = 0; i < str.length; i++) {
      buffer.write('${str[i].from} - ${str[i].to}');

      if (i != str.length - 1) {
        buffer.write(', ');
      }
    }

    return buffer.toString();
  }

  List<OpeningHourItem> splitStrings(String str) {
    if (str.isEmpty) return [];

    final hours = str.split(', ');

    final list = <OpeningHourItem>[];

    for (final element in hours) {
      final time = element.split(' - ');
      list.add(OpeningHourItem(from: time.first, to: time.last));
    }

    return list;
  }

  @override
  int get hashCode =>
      monday.hashCode +
      tuesday.hashCode +
      wednesday.hashCode +
      thursday.hashCode +
      friday.hashCode +
      saturday.hashCode +
      sunday.hashCode;

  @override
  bool operator ==(Object other) {
    return super.hashCode == other.hashCode;
  }
}
