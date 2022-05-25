import 'package:business_terminal/app/utils/l10n/generated/l10n.dart';
import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/presentation/common/widgets/form_text_field/form_text_field.dart';
import 'package:business_terminal/presentation/common/widgets/hint/hint_overlay_provider_mixin.dart';
import 'package:business_terminal/presentation/common/widgets/hint/password_hint_view.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_background.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container_header.dart';
import 'package:business_terminal/presentation/dashboard/change_password/cubit/change_password_cubit.dart';
import 'package:business_terminal/presentation/dashboard/change_password/cubit/change_password_state.dart';
import 'package:business_terminal/presentation/dashboard/change_password/form_validation/change_password_form_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ChangePasswordPage extends StatelessWidget {
  static const path = '/change_password';

  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
      bloc: GetIt.instance.get(),
      builder: (context, state) => _ChangePasswordView(state: state),
    );
  }
}

class _ChangePasswordView extends StatefulWidget {
  final ChangePasswordState state;

  const _ChangePasswordView({Key? key, required this.state}) : super(key: key);

  @override
  State<_ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<_ChangePasswordView> {
  final _formSettings = FormSettingsChangePassword();

  final _oldPasswordFocusNode = FocusNode();
  final _newPasswordFocusNode = FocusNode();
  final _newPasswordConfirmationFocusNode = FocusNode();

  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _newPasswordConfirmationController = TextEditingController();

  var _shouldShowPasswordHint = true;

  @override
  Widget build(BuildContext context) {
    return OnboardingBackground(
      showLanguageDropdown: false,
      children: OnboardingWhiteContainer(
        header: OnboardingWhiteContainerHeader(
          header: AppLocale.current.changePasswordHeader,
          subHeader: Text(AppLocale.current.changePasswordSubHeader),
        ),
        body: ReactiveFormBuilder(
          form: _formSettings.buildForm,
          builder: (context, form, child) => Column(
            children: [
              const SizedBox(height: 25),
              FormTextField(
                name: _formSettings.kFieldOldPassword,
                label: S.of(context).currentPassword,
                focusListener: _oldPasswordFocusNode,
                controller: _oldPasswordController,
                validationMessages: (control) =>
                    _formSettings.validationMessagePassword,
                keyboardType: TextInputType.text,
                obscureText: true,
                hintOverlayBuilder: _getPasswordHintView(
                  textController: _oldPasswordController,
                  focusNode: _oldPasswordFocusNode,
                ),
              ),
              const SizedBox(height: 18),
              FormTextField(
                name: _formSettings.kFieldNewPassword,
                label: S.of(context).currentPassword,
                focusListener: _newPasswordFocusNode,
                controller: _newPasswordController,
                validationMessages: (control) =>
                    _formSettings.validationMessagePassword,
                keyboardType: TextInputType.text,
                hintOverlayBuilder: _getPasswordHintView(
                  textController: _newPasswordController,
                  focusNode: _newPasswordFocusNode,
                ),
                obscureText: true,
              ),
              const SizedBox(height: 18),
              FormTextField(
                name: _formSettings.kFieldNewPasswordConfirmation,
                label: S.of(context).currentPassword,
                focusListener: _newPasswordConfirmationFocusNode,
                controller: _newPasswordConfirmationController,
                validationMessages: (control) =>
                    _formSettings.validationMessagePassword,
                keyboardType: TextInputType.text,
                obscureText: true,
                hintOverlayBuilder: _getPasswordHintView(
                  textController: _newPasswordConfirmationController,
                  focusNode: _newPasswordConfirmationFocusNode,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  HintOverlayWidgetBuilder? _getPasswordHintView({
    required TextEditingController textController,
    required FocusNode focusNode,
  }) =>
      _shouldShowPasswordHint
          ? (context) => PasswordHintView(
                onPressed: _disablePasswordHint,
                controllerPassword: textController,
                focusNodePassword: focusNode,
              )
          : null;

  void _disablePasswordHint() {
    setState(() {
      _shouldShowPasswordHint = false;
    });
  }
}
