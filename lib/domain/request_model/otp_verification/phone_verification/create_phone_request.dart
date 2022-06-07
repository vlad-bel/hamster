import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_phone_request.g.dart';

@JsonSerializable()
class CreatePhoneRequest {
  CreatePhoneRequest({
    required this.phone,
    required this.email,
  });

  @JsonKey(name: 'phone')
  final String phone;
  @JsonKey(name: 'email')
  final String email;

  factory CreatePhoneRequest.fromJson(Map<String, dynamic> json) =>
      _$CreatePhoneRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreatePhoneRequestToJson(this);
}
