// ignore_for_file: one_member_abstracts

import 'package:business_terminal/domain/model/file/app_file.dart';
import 'package:business_terminal/domain/model/personal_data/change_personal_data_request.dart';
import 'package:business_terminal/domain/model/personal_data/personal_data.dart';

abstract class EditPersonalDataUseCase {
  Future<PersonalData> getPersonalData();

  Future updatePersonalData(ChangePersonalDataRequest request);

  Future updateAvatar(AppFile file);
}
