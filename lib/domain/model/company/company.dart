import 'package:freezed_annotation/freezed_annotation.dart';

part 'company.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class Company {
  Company({
    this.id,
    this.companyName,
    this.companyLogo,
    this.city,
    this.streetName,
    this.streetNumber,
    this.postalCode,
    this.country,
    this.companyNumber,
    this.branchNumber,
    this.user,
    this.connectionsStatistics,
    this.fillingProgress,
    this.taxNumber,
    this.accountOwner,
    this.iban,
    this.createdAt,
    this.updatedAt,
  });

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'companyName')
  final String? companyName;
  @JsonKey(name: 'companyLogo')
  final String? companyLogo;
  @JsonKey(name: 'city')
  final String? city;
  @JsonKey(name: 'streetName')
  final String? streetName;
  @JsonKey(name: 'streetNumber')
  final String? streetNumber;
  @JsonKey(name: 'postalCode')
  final String? postalCode;
  @JsonKey(name: 'country')
  final String? country;
  @JsonKey(name: 'companyNumber')
  final String? companyNumber;
  @JsonKey(name: 'branchNumber')
  final String? branchNumber;
  @JsonKey(name: 'user')
  final dynamic user;
  @JsonKey(name: 'connectionsStatistics')
  final dynamic connectionsStatistics;
  @JsonKey(name: 'fillingProgress')
  final dynamic fillingProgress;
  @JsonKey(name: 'taxNumber')
  final dynamic taxNumber;
  @JsonKey(name: 'accountOwner')
  final dynamic accountOwner;
  @JsonKey(name: 'IBAN')
  final String? iban;
  @JsonKey(name: 'createdAt')
  final DateTime? createdAt;
  @JsonKey(name: 'updatedAt')
  final DateTime? updatedAt;

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}
