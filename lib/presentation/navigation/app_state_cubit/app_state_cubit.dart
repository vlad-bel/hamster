import 'package:business_terminal/domain/request_model/number_verification/verify_phone_request.dart';
import 'package:business_terminal/presentation/common/widgets/dashboard/dashboard_page.dart';
import 'package:business_terminal/presentation/email_verification/view/email_verification_page.dart';
import 'package:business_terminal/presentation/login/view/login_page.dart';
import 'package:business_terminal/presentation/number_verification/call_method_selector_page/call_method_selector_page.dart';
import 'package:business_terminal/presentation/number_verification/country_code/country_code_page.dart';
import 'package:business_terminal/presentation/number_verification/number_code_confirmation/number_code_confirmaion_page.dart';
import 'package:business_terminal/presentation/number_verification/result_page/result_page.dart';
import 'package:business_terminal/presentation/registration/view/registration_page.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../company_creation/company_creation_page.dart';

part '../app_state_cubit/app_state.dart';

class AppStateCubit extends Cubit<AppState> {
  AppStateCubit()
      : super(
          UnauthorizedState(
            initialRoute:'/',
          ),
        );
}
