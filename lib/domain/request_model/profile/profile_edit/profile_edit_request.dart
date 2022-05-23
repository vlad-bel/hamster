import 'package:json_annotation/json_annotation.dart';

part 'profile_edit_request.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class ProfileEditRequest {
  ProfileEditRequest({
    required this.companyName,
    required this.city,
    required this.streetName,
    required this.streetNumber,
    required this.postalCode,
    required this.country,
    required this.countryCode,
    required this.commercialRegisterNumber,
    required this.taxNumber,
    required this.vatId,
  });

  factory ProfileEditRequest.fromJson(Map<String, dynamic> json) =>
      _$ProfileEditRequestFromJson(json);

  @JsonKey(name: '')
  final String city;

  @JsonKey(name: 'commercialRegisterNumber')
  final String commercialRegisterNumber;

  final String companyName;
  @JsonKey(name: 'country')
  final String country;

  @JsonKey(name: 'countryCode')
  final String countryCode;

  @JsonKey(name: 'postalCode')
  final String postalCode;

  final String streetName;
  @JsonKey(name: 'streetNumber')
  final String streetNumber;

  @JsonKey(name: 'taxNumber')
  final String taxNumber;

  @JsonKey(name: 'vatId')
  final String vatId;

  Map<String, dynamic> toJson() => _$ProfileEditRequestToJson(this);
}
