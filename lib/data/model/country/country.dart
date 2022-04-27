import 'package:freezed_annotation/freezed_annotation.dart';

part 'country.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class Country {
  Country({
    required this.name,
    required this.native,
    required this.phone,
    required this.continent,
    required this.capital,
    required this.currency,
    required this.languages,
    required this.emoji,
    required this.emojiU,
  });

  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'native')
  final String native;
  @JsonKey(name: 'phone')
  final String phone;
  @JsonKey(name: 'continent')
  final String continent;
  @JsonKey(name: 'capital')
  final String capital;
  @JsonKey(name: 'currency')
  final String currency;
  @JsonKey(name: 'languages')
  final List<String> languages;
  @JsonKey(name: 'emoji')
  final String emoji;
  @JsonKey(name: 'emojiU')
  final String emojiU;

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);

  Map<String, dynamic> toJson() => _$CountryToJson(this);
}
