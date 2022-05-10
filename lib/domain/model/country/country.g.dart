// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Country _$CountryFromJson(Map<String, dynamic> json) => Country(
      name: json['name'] as String,
      native: json['native'] as String,
      phone: json['phone'] as String,
      continent: json['continent'] as String,
      capital: json['capital'] as String,
      currency: json['currency'] as String,
      languages:
          (json['languages'] as List<dynamic>).map((e) => e as String).toList(),
      emoji: json['emoji'] as String,
      emojiU: json['emojiU'] as String,
    );

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'name': instance.name,
      'native': instance.native,
      'phone': instance.phone,
      'continent': instance.continent,
      'capital': instance.capital,
      'currency': instance.currency,
      'languages': instance.languages,
      'emoji': instance.emoji,
      'emojiU': instance.emojiU,
    };
