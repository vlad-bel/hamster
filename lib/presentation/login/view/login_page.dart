import 'package:business_terminal/dependency_injection/injectible_init.dart';
import 'package:business_terminal/domain/model/errors/api_failure_response.dart';
import 'package:business_terminal/domain/model/errors/failures.dart';
import 'package:business_terminal/presentation/common/snackbar_manager.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_background.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container.dart';
import 'package:business_terminal/presentation/common/widgets/onboarding_white_container/onboarding_white_container_header.dart';
import 'package:business_terminal/presentation/common/widgets/text_button_link.dart';
import 'package:business_terminal/presentation/login/cubit/login_cubit.dart';
import 'package:business_terminal/presentation/login/form_validation/login_form_validation.dart';
import 'package:business_terminal/presentation/login/view/floating_wrong_credentials_view.dart';
import 'package:business_terminal/presentation/navigation/app_state_cubit/app_state.dart';
import 'package:business_terminal/presentation/registration/view/registration_page.dart';
import 'package:business_terminal/presentation/registration/widgets/action_button_blue.dart';
import 'package:business_terminal/presentation/common/widgets/form_text_field/form_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:reactive_forms/reactive_forms.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const path = '/';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<LoginCubit>(),
      child: const LoginView(),
    );
  }
}

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController? _controllerPassword;
  final formSettings = LoginFormSettings();

  final title = 'Willkommen bei\nHamster!';
  final subtitle =
      'Sollten Sie bereits einen BusinessAccount haben, dann melden Sie sich direkt an. Ansonsten müssten Sie sich zuerst noch registrieren.';
  final forgotPasswordText = 'Passwort vergessen';

  @override
  void initState() {
    _controllerPassword = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OnboardingBackground(
      children: OnboardingWhiteContainer(
        header: OnboardingWhiteContainerHeader(
          header: title,
          subHeader: Text(subtitle),
        ),
        body: Column(
          children: [
            ReactiveFormBuilder(
              form: formSettings.buildForm,
              builder: (context, form, child) {
                // Login, Password:
                return Column(
                  children: [
                    const SizedBox(height: 25),
                    FormTextField(
                      name: formSettings.kFieldEmail,
                      label: 'E-Mail',
                      validationMessages: (control) =>
                          formSettings.validationMessageEmail,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const FloatingWrongCredentialsView(),
                    const SizedBox(height: 18),
                    FormTextField(
                      name: formSettings.kFieldPassword,
                      label: 'Passwort',
                      validationMessages: (control) =>
                          formSettings.validationMessagePassword,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      controller: _controllerPassword,
                    ),
                    // Forgot password, OK button:
                    const SizedBox(height: 12),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButtonBlueLink(
                        text: forgotPasswordText,
                        onPressed: () {},
                      ),
                    ),
                    Container(height: 28),
                    ReactiveFormConsumer(
                      builder: (context, formGroup, child) {
                        return ActionButtonBlue(
                          isEnabled: formGroup.valid,
                          width: double.infinity,
                          onPressed: () => onPressLogin(formGroup),
                        );
                      },
                    ),
                    Container(height: 28),

                    // Registration link:
                    const Text(
                      'Du hast noch keinen Business-Terminal-Account?',
                    ),
                    TextButtonBlueLink(
                      text: 'Jetzt registrieren',
                      onPressed: () => onPressNavigateToRegistration(context),
                    ),
                    const LoginBlocListener(),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void onPressLogin(FormGroup formGroup) {
    final email = formGroup.value[formSettings.kFieldEmail] as String?;
    final password = formGroup.value[formSettings.kFieldPassword] as String?;

    context.read<LoginCubit>().login(email, password);
  }

  void onPressNavigateToRegistration(BuildContext context) {
    Navigator.of(context).pushNamed(RegistrationPage.path);
  }

  @override
  void dispose() {
    _controllerPassword?.dispose();
    super.dispose();
  }
}

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        state.whenOrNull(
          error: onError,
          success: (response) => onSuccess(context),
        );

        if (state is LoadingLogin) {
          context.loaderOverlay.show();
        } else {
          context.loaderOverlay.hide();
        }
      },
      child: const SizedBox(),
    );
  }

  void onSuccess(BuildContext context) {
    RegistrationFlowManager.navigateToNextScreenFromLogin(context);
  }

  void onError(ApiFailure e) {
    final error = e.exception as ApiFailureResponse;
    final dynamic errorMessage = error.message;
    final message = errorMessage.toString();

    SnackBarManager.showError(message);
  }
}
