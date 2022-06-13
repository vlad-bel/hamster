import 'package:business_terminal/domain/model/company/logo.dart';
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
    this.vatId,
    this.commercialRegisterNumber,
    this.logos,
    this.isVerified,
    this.isVerificationRequestDeclined,
  });

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);

  @JsonKey(name: 'accountOwner')
  final dynamic accountOwner;

  @JsonKey(name: 'branchNumber')
  final String? branchNumber;

  @JsonKey(name: 'city')
  final String? city;

  @JsonKey(name: 'commercialRegisterNumber')
  final String? commercialRegisterNumber;

  @JsonKey(name: 'companyLogo')
  final String? companyLogo;

  @JsonKey(name: 'companyName')
  final String? companyName;

  @JsonKey(name: 'companyNumber')
  final String? companyNumber;

  @JsonKey(name: 'connectionsStatistics')
  final Map<String, String>? connectionsStatistics;

  @JsonKey(name: 'country')
  final String? country;

  @JsonKey(name: 'createdAt')
  final DateTime? createdAt;
  @JsonKey(name: 'fillingProgress')
  final fillingProgress;
  @JsonKey(name: 'IBAN')
  final String? iban;

  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'logos')
  final List<CompanyLogo>? logos;

  @JsonKey(name: 'postalCode')
  final String? postalCode;

  @JsonKey(name: 'streetName')
  final String? streetName;

  @JsonKey(name: 'streetNumber')
  final String? streetNumber;

  @JsonKey(name: 'taxNumber')
  final dynamic taxNumber;

  @JsonKey(name: 'updatedAt')
  final DateTime? updatedAt;
  @JsonKey(name: 'isVerified')
  final bool? isVerified;
  @JsonKey(name: 'isVerificationRequestDeclined')
  final bool? isVerificationRequestDeclined;

  @JsonKey(name: 'user')
  final dynamic user;

  @JsonKey(name: 'vatId')
  final String? vatId;

  Map<String, dynamic> toJson() => _$CompanyToJson(this);

  String getFullAddress() {
    return '${streetName ?? ""} '
        '${streetNumber ?? ""}'
        ','
        ' ${postalCode ?? ""} '
        '${city ?? ""}';
  }

  @override
  String toString() {
    return 'Company{branchNumber: $branchNumber, city: $city, companyName: $companyName, companyNumber: $companyNumber, country: $country, postalCode: $postalCode, streetName: $streetName, streetNumber: $streetNumber}';
  }
}
