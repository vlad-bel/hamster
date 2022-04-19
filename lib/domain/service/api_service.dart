// ignore_for_file: one_member_abstracts

import 'package:business_terminal/data/model/registration/user_info_request.dart';

abstract class ApiService {
  Future<String> initUserInfoCreation(
    UserInfoRequest request,
  );
}
