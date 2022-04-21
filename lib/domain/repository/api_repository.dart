// ignore_for_file: one_member_abstracts

import 'package:business_terminal/data/model/registration/user_info_request.dart';

abstract class ApiRepository {
  Future<String> initUserInfoCreation(
    UserInfoRequest request,
  );
}
