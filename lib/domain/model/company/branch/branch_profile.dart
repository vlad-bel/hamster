import 'package:json_annotation/json_annotation.dart';

part 'branch_profile.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class BranchProfile {
  @JsonKey(name: '_id')
  final String id;
  @JsonKey(name: 'branchName')
  final String branchName;
  @JsonKey(name: 'city')
  final String city;
  @JsonKey(name: 'country')
  final String country;
  @JsonKey(name: 'postalCode')
  final String postalCode;
  @JsonKey(name: 'streetName')
  final String streetName;
  @JsonKey(name: 'streetNumber')
  final String streetNumber;
  @JsonKey(name: 'entrances')
  final int entrances;
  @JsonKey(name: 'website')
  final String website;
  @JsonKey(name: 'phoneNumber')
  final String phoneNumber;
  @JsonKey(name: 'companyId')
  final String companyId;
  @JsonKey(name: 'branchNumber')
  final String branchNumber;
  @JsonKey(name: 'fillingProgress')
  final int fillingProgress;
  @JsonKey(name: 'posesData')
  final List<PosesData> posesData;
  @JsonKey(name: 'category')
  final String category;
  @JsonKey(name: 'subcategories')
  final List<String> subcategories;
  @JsonKey(name: 'openingHours')
  final OpeningHours openingHours;
  @JsonKey(name: 'createdAt')
  final String createdAt;
  @JsonKey(name: 'updatedAt')
  final String updatedAt;
  @JsonKey(name: 'isVerificationRequestDeclined')
  final bool isVerificationRequestDeclined;
  @JsonKey(name: 'isVerified')
  final bool isVerified;

  BranchProfile({
    required this.id,
    required this.branchName,
    required this.city,
    required this.country,
    required this.postalCode,
    required this.streetName,
    required this.streetNumber,
    required this.entrances,
    required this.website,
    required this.phoneNumber,
    required this.companyId,
    required this.branchNumber,
    required this.fillingProgress,
    required this.posesData,
    required this.category,
    required this.subcategories,
    required this.openingHours,
    required this.createdAt,
    required this.updatedAt,
    required this.isVerificationRequestDeclined,
    required this.isVerified,
  });

  factory BranchProfile.fromJson(Map<String, dynamic> json) =>
      _$BranchProfileFromJson(json);

  Map<String, dynamic> toJson() => _$BranchProfileToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class PosesData {
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'manufacturer')
  final String manufacturer;
  @JsonKey(name: 'model')
  final String model;
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'isActive')
  final bool isActive;

  PosesData(
      {required this.name,
      required this.manufacturer,
      required this.model,
      required this.id,
      required this.isActive});

  factory PosesData.fromJson(Map<String, dynamic> json) =>
      _$PosesDataFromJson(json);

  Map<String, dynamic> toJson() => _$PosesDataToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class OpeningHours {
  @JsonKey(name: 'monday')
  final List<OpeningHourItem> monday;

  OpeningHours({required this.monday});

  factory OpeningHours.fromJson(Map<String, dynamic> json) =>
      _$OpeningHoursFromJson(json);

  Map<String, dynamic> toJson() => _$OpeningHoursToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class OpeningHourItem {
  @JsonKey(name: 'from')
  final String from;
  @JsonKey(name: 'to')
  final String to;

  OpeningHourItem({required this.from, required this.to});

  factory OpeningHourItem.fromJson(Map<String, dynamic> json) =>
      _$OpeningHourItemFromJson(json);

  Map<String, dynamic> toJson() => _$OpeningHourItemToJson(this);
}
