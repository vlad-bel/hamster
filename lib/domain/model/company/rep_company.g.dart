// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rep_company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepCompany _$RepCompanyFromJson(Map<String, dynamic> json) => RepCompany(
      rep: Rep.fromJson(json['rep'] as Map<String, dynamic>),
      company: Company.fromJson(json['company'] as Map<String, dynamic>),
      branch: Branch.fromJson(json['branch'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RepCompanyToJson(RepCompany instance) =>
    <String, dynamic>{
      'rep': instance.rep,
      'company': instance.company,
      'branch': instance.branch,
    };

Rep _$RepFromJson(Map<String, dynamic> json) => Rep(
      fillingProgress: json['fillingProgress'] as int,
      name: json['name'] as String,
      surname: json['surname'] as String,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$RepToJson(Rep instance) => <String, dynamic>{
      'fillingProgress': instance.fillingProgress,
      'name': instance.name,
      'surname': instance.surname,
      'avatar': instance.avatar,
    };

Branch _$BranchFromJson(Map<String, dynamic> json) => Branch(
      fillingProgress: json['fillingProgress'] as int,
    );

Map<String, dynamic> _$BranchToJson(Branch instance) => <String, dynamic>{
      'fillingProgress': instance.fillingProgress,
    };
