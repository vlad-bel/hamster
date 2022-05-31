import 'package:business_terminal/app/utils/l10n/l10n_service.dart';
import 'package:business_terminal/presentation/common/snackbar_manager.dart';
import 'package:business_terminal/presentation/common/widgets/form_text_field/form_text_field.dart';
import 'package:business_terminal/presentation/common/widgets/hint/hint_overlay_provider_mixin.dart';
import 'package:business_terminal/presentation/common/widgets/hint/password_hint_view.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_background.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container_header.dart';
import 'package:business_terminal/presentation/forget_password/cubit/forget_password_cubit.dart';
import 'package:business_terminal/presentation/forget_password/form_validation/confirm_password_form_validation.dart';
import 'package:business_terminal/presentation/forget_password/view/new_password_installed_page.dart';
import 'package:business_terminal/presentation/registration/widgets/action_button_blue.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ConfirmNewPasswordPage extends StatefulWidget {
  static const path = 'confirm_new_password';

  const ConfirmNewPasswordPage({Key? key}) : super(key: key);

  @override
  State<ConfirmNewPasswordPage> createState() => _ConfirmNewPasswordPageState();
}

class _ConfirmNewPasswordPageState extends State<ConfirmNewPasswordPage> {
  final _formSettings = FormSettingsConfirmPassword();

  final _newPasswordFocusNode = FocusNode();
  final _newPasswordConfirmationFocusNode = FocusNode();

  final _newPasswordController = TextEditingController();
  final _newPasswordConfirmationController = TextEditingController();

  var _shouldShowPasswordHint = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.instance.get<ForgetPasswordCubit>(),
      child: BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (_, state) {
          state
            ..whenOrNull(
                newPasswordInstalled: () => Navigator.of(context)
                    .pushNamed(NewPasswordInstalledPage.path),
                error: SnackBarManager.showError)
            ..maybeWhen(
              loading: () => context.loaderOverlay.show(),
              orElse: () => context.loaderOverlay.hide(),
            );
        },
        child: OnboardingBackground(
          children: OnboardingWhiteContainer(
            header: OnboardingWhiteContainerHeader(
              header: AppLocale.of(context).confirmNewPasswordTitle,
              subHeader: Text(AppLocale.of(context).confirmNewPasswordSubtitle),
            ),
            body: ReactiveFormBuilder(
              form: _formSettings.buildForm,
              builder: (context, form, _) => Column(
                children: [
                  const SizedBox(height: 18),
                  FormTextField(
                    name: _formSettings.kFieldNewPassword,
                    label: AppLocale.of(context).currentPassword,
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
                    label: AppLocale.of(context).currentPassword,
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
                  ReactiveFormConsumer(builder: (_, formGroup, __) {
                    return SizedBox(
                      width: double.infinity,
                      child: ActionButtonBlue(
                        isEnabled: formGroup.valid,
                        onPressed: () {
                          context.read<ForgetPasswordCubit>().changePassword(
                                _newPasswordController.text,
                              );
                        },
                      ),
                    );
                  })
                ],
              ),
            ),
          ),
        ),
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
