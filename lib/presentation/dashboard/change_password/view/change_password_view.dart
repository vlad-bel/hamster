import 'package:business_terminal/app/utils/l10n/generated/l10n.dart';
import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/presentation/common/snackbar_manager.dart';
import 'package:business_terminal/presentation/common/widgets/form_text_field/form_text_field.dart';
import 'package:business_terminal/presentation/common/widgets/hint/hint_overlay_provider_mixin.dart';
import 'package:business_terminal/presentation/common/widgets/hint/password_hint_view.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container_header.dart';
import 'package:business_terminal/presentation/dashboard/change_password/cubit/change_password_cubit.dart';
import 'package:business_terminal/presentation/dashboard/change_password/cubit/change_password_state.dart';
import 'package:business_terminal/presentation/dashboard/change_password/form_validation/change_password_form_validation.dart';
import 'package:business_terminal/presentation/dashboard/change_password/view/current_password_incorrect_hint.dart';
import 'package:business_terminal/presentation/registration/widgets/action_button_blue.dart';
import 'package:business_terminal/presentation/registration/widgets/white_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({Key? key}) : super(key: key);

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  final _formSettings = FormSettingsChangePassword();

  final _oldPasswordFocusNode = FocusNode();
  final _newPasswordFocusNode = FocusNode();
  final _newPasswordConfirmationFocusNode = FocusNode();

  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _newPasswordConfirmationController = TextEditingController();

  var _shouldShowPasswordHint = true;
  var _shouldShowIncorrectPasswordHint = true;

  @override
  Widget build(BuildContext context) {
    return OnboardingWhiteContainer(
      header: OnboardingWhiteContainerHeader(
        header: AppLocale.current.changePasswordHeader,
        subHeader: Text(AppLocale.current.changePasswordSubHeader),
      ),
      body: BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
        listener: (_, state) {
          state.whenOrNull(
            currentPasswordIncorrect: () {
              _oldPasswordFocusNode.requestFocus();
            },
            error: (message) {
              SnackBarManager.showError(message);
            },
          );
        },
        builder: (context, state) {
          return ReactiveFormBuilder(
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
                  hintOverlayBuilder: _getOldPasswordHintView(state: state),
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
                  hintOverlayBuilder: _getNewPasswordHintView(
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
                  hintOverlayBuilder: _getNewPasswordHintView(
                    textController: _newPasswordConfirmationController,
                    focusNode: _newPasswordConfirmationFocusNode,
                  ),
                ),
                const SizedBox(height: 32),
                Row(
                  children: [
                    Expanded(
                      child: WhiteButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: ReactiveFormConsumer(builder: (_, formGroup, __) {
                        return ActionButtonBlue(
                          isEnabled: formGroup.valid,
                          onPressed: () {
                            context.read<ChangePasswordCubit>().changePassword(
                                  _oldPasswordController.text,
                                  _newPasswordController.text,
                                );
                          },
                        );
                      }),
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }

  HintOverlayWidgetBuilder? _getOldPasswordHintView({
    required ChangePasswordState state,
  }) {
    if (!_shouldShowIncorrectPasswordHint) return null;
    return state.mapOrNull(
      currentPasswordIncorrect: (_) => (_) => CurrentPasswordIncorrectHint(
            onPressed: () {
              _shouldShowIncorrectPasswordHint = false;
              setState(() {});
            },
          ),
    );
  }

  void _disablePasswordHint() {
    setState(() {
      _shouldShowPasswordHint = false;
    });
  }

  HintOverlayWidgetBuilder? _getNewPasswordHintView({
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
}
