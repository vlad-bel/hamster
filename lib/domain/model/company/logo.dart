import 'package:freezed_annotation/freezed_annotation.dart';

part 'logo.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class CompanyLogo {
  CompanyLogo({
    required this.fileName,
    required this.backgroundColor,
  });

  @JsonKey(name: 'fileName')
  final String? fileName;
  @JsonKey(name: 'backgroundColor')
  final String? backgroundColor;
  factory CompanyLogo.fromJson(Map<String, dynamic> json) =>
      _$CompanyLogoFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyLogoToJson(this);
}
