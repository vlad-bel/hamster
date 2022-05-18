// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Company _$CompanyFromJson(Map<String, dynamic> json) => Company(
      id: json['id'] as String?,
      companyName: json['companyName'] as String?,
      companyLogo: json['companyLogo'] as String?,
      city: json['city'] as String?,
      streetName: json['streetName'] as String?,
      streetNumber: json['streetNumber'] as String?,
      postalCode: json['postalCode'] as String?,
      country: json['country'] as String?,
      companyNumber: json['companyNumber'] as String?,
      branchNumber: json['branchNumber'] as String?,
      user: json['user'],
      connectionsStatistics: json['connectionsStatistics'],
      fillingProgress: json['fillingProgress'] as int?,
      taxNumber: json['taxNumber'],
      accountOwner: json['accountOwner'],
      iban: json['IBAN'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
      'id': instance.id,
      'companyName': instance.companyName,
      'companyLogo': instance.companyLogo,
      'city': instance.city,
      'streetName': instance.streetName,
      'streetNumber': instance.streetNumber,
      'postalCode': instance.postalCode,
      'country': instance.country,
      'companyNumber': instance.companyNumber,
      'branchNumber': instance.branchNumber,
      'user': instance.user,
      'connectionsStatistics': instance.connectionsStatistics,
      'fillingProgress': instance.fillingProgress,
      'taxNumber': instance.taxNumber,
      'accountOwner': instance.accountOwner,
      'IBAN': instance.iban,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
