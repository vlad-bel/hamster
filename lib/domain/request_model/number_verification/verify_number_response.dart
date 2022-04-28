import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_number_response.g.dart';

@JsonSerializable()
class VerifyNumberResponse {
  VerifyNumberResponse({
    required this.id,
    required this.email,
    required this.passwordHash,
    required this.name,
    required this.surname,
    required this.phone,
    required this.createdAt,
    required this.updatedAt,
  });

  @JsonKey(name: '_id')
  final String id;

  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'passwordHash')
  final String passwordHash;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'surname')
  final String surname;

  @JsonKey(name: 'phone')
  final String phone;

  @JsonKey(name: 'createdAt')
  final DateTime createdAt;

  @JsonKey(name: 'updatedAt')
  final DateTime updatedAt;

  factory VerifyNumberResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyNumberResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyNumberResponseToJson(this);
}
