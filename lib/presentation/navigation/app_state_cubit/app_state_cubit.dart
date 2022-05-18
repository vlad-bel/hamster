import 'package:business_terminal/presentation/branch_profile/view/branch_profile_page.dart';
import 'package:business_terminal/presentation/navigation/app_state_cubit/app_state.dart';
import 'package:business_terminal/presentation/navigation/app_state_cubit/unauthorize_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppStateCubit extends Cubit<AppState> {
  AppStateCubit()
      : super(
          UnauthorizedState(
            initialRoute: BranchProfilePage.path,
          ),
        );
}
