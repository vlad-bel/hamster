import 'package:json_annotation/json_annotation.dart';

part 'personal_data_response.g.dart';

@JsonSerializable()
class PersonalDataResponse {
  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'name')
  final String firstName;

  @JsonKey(name: 'surname')
  final String lastName;

  @JsonKey(name: 'phone')
  final String phone;

  @JsonKey(name: 'avatar')
  final String? avatarFileName;

  PersonalDataResponse({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.avatarFileName
  });

  factory PersonalDataResponse.fromJson(Map<String, dynamic> json) =>
      _$PersonalDataResponseFromJson(json);
}
