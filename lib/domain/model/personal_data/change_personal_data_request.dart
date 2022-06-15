import 'package:json_annotation/json_annotation.dart';

part 'change_personal_data_request.g.dart';

@JsonSerializable()
class ChangePersonalDataRequest {
  @JsonKey(name: 'name', includeIfNull: false)
  final String? firstName;

  @JsonKey(name: 'surname', includeIfNull: false)
  final String? lastName;

  ChangePersonalDataRequest({this.firstName, this.lastName});

  factory ChangePersonalDataRequest.fromJson(Map<String, dynamic> json) =>
      _$ChangePersonalDataRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePersonalDataRequestToJson(this);
}
