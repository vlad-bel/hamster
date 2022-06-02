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
  final Map<String, String>? connectionsStatistics;
  @JsonKey(name: 'fillingProgress')
   dynamic fillingProgress;
  @JsonKey(name: 'taxNumber')
  final dynamic taxNumber;
  @JsonKey(name: 'accountOwner')
  final dynamic accountOwner;
  @JsonKey(name: 'IBAN')
  final String? iban;
  @JsonKey(name: 'vatId')
  final String? vatId;
  @JsonKey(name: 'commercialRegisterNumber')
  final String? commercialRegisterNumber;
  @JsonKey(name: 'createdAt')
  final DateTime? createdAt;
  @JsonKey(name: 'updatedAt')
  final DateTime? updatedAt;
  @JsonKey(name: 'logos')
  final List<String>? logos;
  @JsonKey(name: 'isVerified')
  final bool? isVerified;
  @JsonKey(name: 'isVerificationRequestDeclined')
  final bool? isVerificationRequestDeclined;

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyToJson(this);

  String getFullAddress() {
    return '${streetName ?? ""} '
        '${streetNumber ?? ""}'
        ','
        ' ${postalCode ?? ""} '
        '${country ?? ""}';
  }
}
