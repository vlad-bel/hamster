import 'package:freezed_annotation/freezed_annotation.dart';

part 'company_request_body.g.dart';

@JsonSerializable()
class CompanyRequestBody {
  CompanyRequestBody({
    required this.companyName,
    required this.city,
    required this.streetName,
    required this.streetNumber,
    required this.postalCode,
    required this.country,
    required this.countryCode,
  });

  @JsonKey(name: 'companyName')
  final String companyName;
  @JsonKey(name: 'city')
  final String city;
  @JsonKey(name: 'streetName')
  final String streetName;
  @JsonKey(name: 'streetNumber')
  final String streetNumber;
  @JsonKey(name: 'postalCode')
  final String postalCode;
  @JsonKey(name: 'country')
  final String country;
  @JsonKey(name: 'countryCode')
  final String countryCode;

  factory CompanyRequestBody.fromJson(Map<String, dynamic> json) =>
      _$CompanyRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyRequestBodyToJson(this);
}
