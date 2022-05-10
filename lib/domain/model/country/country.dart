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
    this.code,
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

  final String? code;

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);

  Map<String, dynamic> toJson() => _$CountryToJson(this);

  Country copyWith({
    String? name,
    String? native,
    String? phone,
    String? continent,
    String? capital,
    String? currency,
    List<String>? languages,
    String? emoji,
    String? emojiU,
    String? code,
  }) =>
      Country(
        name: name ?? this.name,
        native: native ?? this.native,
        phone: phone ?? this.phone,
        continent: continent ?? this.continent,
        capital: capital ?? this.capital,
        currency: currency ?? this.currency,
        languages: languages ?? this.languages,
        emoji: emoji ?? this.emoji,
        emojiU: emojiU ?? this.emojiU,
        code: code ?? this.code,
      );
}
