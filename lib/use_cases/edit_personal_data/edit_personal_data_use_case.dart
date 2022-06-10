// ignore_for_file: one_member_abstracts

import 'package:business_terminal/domain/model/personal_data/personal_data.dart';

abstract class EditPersonalDataUseCase {
  Future<PersonalData> getPersonalData();
}
