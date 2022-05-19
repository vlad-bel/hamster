import 'package:business_terminal/domain/model/company/company.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rep_company.g.dart';

@JsonSerializable()
class RepCompany {
  RepCompany({
    required this.rep,
    required this.company,
    required this.branch,
  });

  @JsonKey(name: 'rep')
  final Rep? rep;
  @JsonKey(name: 'company')
  final Company? company;
  @JsonKey(name: 'branch')
  final Branch? branch;

  factory RepCompany.fromJson(Map<String, dynamic> json) =>
      _$RepCompanyFromJson(json);

  Map<String, dynamic> toJson() => _$RepCompanyToJson(this);

  String getFullAddress() {
    return '${company.streetName}'
        ' ${company.streetNumber},'
        ' ${company.postalCode}'
        ' ${company.city}';
  }
}

@JsonSerializable()
class Rep {
  Rep({
    required this.fillingProgress,
    required this.name,
    required this.surname,
    required this.avatar,
  });

  @JsonKey(name: 'fillingProgress')
  final int fillingProgress;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'surname')
  final String surname;
  @JsonKey(name: 'avatar')
  final String? avatar;

  factory Rep.fromJson(Map<String, dynamic> json) => _$RepFromJson(json);

  Map<String, dynamic> toJson() => _$RepToJson(this);
}

@JsonSerializable()
class Branch {
  @JsonKey(name: 'fillingProgress')
  final int fillingProgress;

  Branch({
    required this.fillingProgress,
  });

  factory Branch.fromJson(Map<String, dynamic> json) => _$BranchFromJson(json);

  Map<String, dynamic> toJson() => _$BranchToJson(this);
}
