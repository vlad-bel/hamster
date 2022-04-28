import 'package:json_annotation/json_annotation.dart';

part 'user_info_request.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class UserInfoRequest {
  UserInfoRequest({
    required this.email,
    required this.password,
    required this.name,
    required this.surname,
  });

  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'password')
  final String password;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'surname')
  final String surname;

  factory UserInfoRequest.fromJson(Map<String, dynamic> json) =>
      _$UserInfoRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoRequestToJson(this);
}
