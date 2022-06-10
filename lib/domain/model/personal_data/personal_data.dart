import 'package:business_terminal/domain/model/file/app_file.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'personal_data.freezed.dart';

@freezed
class PersonalData with _$PersonalData {
  const factory PersonalData({
    required String email,
    required String firstName,
    required String lastName,
    required String phone,
    required AppFile? avatar,
  }) = _PersonalData;
}
