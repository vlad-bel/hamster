import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_password_request.g.dart';

@JsonSerializable()
class ChangePasswordRequest {
  @JsonKey(name: 'currentPassword')
  final String currentPassword;

  @JsonKey(name: 'newPassword')
  final String newPassword;

  ChangePasswordRequest({
    required this.currentPassword,
    required this.newPassword,
  });

  Map<String, dynamic> toJson() => _$ChangePasswordRequestToJson(this);
}
