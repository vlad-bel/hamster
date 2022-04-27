// TODO: remove when code is finalized
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:black_hole_flutter/black_hole_flutter.dart';
import 'package:business_terminal/domain/dependency_injection/di.dart';
import 'package:business_terminal/domain/use_cases/registration/user_info_init/user_info_init.dart';
import 'package:business_terminal/generated/assets.dart';
import 'package:business_terminal/presentation/common/widgets/horizontal_line_short_grey.dart';
import 'package:business_terminal/presentation/common/widgets/text_title.dart';
import 'package:business_terminal/presentation/registration/cubit/user_info_init_cubit.dart';
import 'package:business_terminal/presentation/registration/email_verification/view/email_verification_page.dart';
import 'package:business_terminal/presentation/registration/form_validation_rules/user_info_form_group.dart';
import 'package:business_terminal/presentation/registration/view/password_checkboxes_view.dart';
import 'package:business_terminal/presentation/registration/widgets/action_button_blue.dart';
import 'package:business_terminal/presentation/registration/widgets/form_text_field.dart';
import 'package:business_terminal/presentation/registration/widgets/white_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:reactive_forms/reactive_forms.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserInfoInitCubit(get<UserInfoInitUseCase>()),
      child: const RegistrationView(),
    );
  }
}

class RegistrationView extends StatelessWidget {
  const RegistrationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: RegistrationBodyView()),
    );
  }
}

class RegistrationBodyView extends StatefulWidget {
  const RegistrationBodyView({Key? key}) : super(key: key);

  @override
  State<RegistrationBodyView> createState() => _RegistrationBodyViewState();
}

class _RegistrationBodyViewState extends State<RegistrationBodyView> {
  TextEditingController? _controllerPassword;
  final FocusNode _focusListenerPassword = FocusNode();

  final formSettings = FormSettingsRegistrationUserInfo();

  @override
  void initState() {
    _controllerPassword = TextEditingController();

    _focusListenerPassword.addListener(() {
      context.read<UserInfoInitCubit>().setVisibilityPasswordValidation(
            isVisible: _focusListenerPassword.hasFocus,
          );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final subtitleText = Text(
      'Registrieren Sie sich jetzt, um Teil des deutschlandweiten Netzwerks zu werden.',
    );

    return Stack(
      children: [
        Image.asset(
          Assets.imagesBackgroundImageSignUp,
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.all(25),
          child: SizedBox(
            width: 120,
            height: 45,
            child: SvgPicture.asset(
              Assets.imagesHamsterLogo,
            ),
          ),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Align(
              child: SizedBox(
                width: 390,
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(35),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextTitle(
                          title: 'Nutzen Sie Hamster für Ihr \nUnternehmen.',
                        ),
                        Container(height: 18),
                        HorizontalLineShortGrey(),
                        Container(height: 18),
                        subtitleText,
                        Container(height: 25),
                        ReactiveFormBuilder(
                          form: formSettings.buildForm,
                          builder: (context, form, child) {
                            return Column(
                              children: [
                                FormTextField(
                                  name: formSettings.kFieldName,
                                  hint: 'Vorname eingeben',
                                  validationMessages: (control) =>
                                      formSettings.validationMessageNameSurname,
                                  keyboardType: TextInputType.name,
                                ),
                                Container(height: 18),
                                FormTextField(
                                  name: formSettings.kFieldSurname,
                                  hint: 'Nachnamen eingeben',
                                  validationMessages: (control) =>
                                      formSettings.validationMessageNameSurname,
                                  keyboardType: TextInputType.name,
                                ),
                                Container(height: 18),
                                FormTextField(
                                  name: formSettings.kFieldEmail,
                                  hint: 'E-Mail',
                                  validationMessages: (control) =>
                                      formSettings.validationMessageEmail,
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                Container(height: 18),
                                FormTextField(
                                  name: formSettings.kFieldPassword,
                                  hint: 'Passwort wählen',
                                  validationMessages: (control) =>
                                      formSettings.validationMessagePassword,
                                  keyboardType: TextInputType.text,
                                  obscureText: true,
                                  controller: _controllerPassword,
                                  focusListener: _focusListenerPassword,
                                ),
                                Container(height: 18),
                                FormTextField(
                                  name: formSettings.kFieldPasswordConfirmation,
                                  hint: 'Passwort wiederholen',
                                  validationMessages: (control) =>
                                      formSettings.validationMessagePassword,
                                  keyboardType: TextInputType.text,
                                  obscureText: true,
                                  textInputAction: TextInputAction.done,
                                ),
                                Container(height: 28),

                                /// Bottom action buttons:
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    WhiteButton(
                                      onPressed: () {},
                                    ),
                                    BlocListener<UserInfoInitCubit,
                                        UserInfoInitState>(
                                      listener:
                                          (context, UserInfoInitState state) {
                                        if (state is LoadingUserInfoInit) {
                                          context.loaderOverlay.show();
                                        } else {
                                          context.loaderOverlay.hide();
                                        }

                                        if (state is ErrorUserInfoInit) {
                                          showErrorSnackbar();
                                        }
                                      },
                                      child: ReactiveFormConsumer(
                                        builder: (context, formGroup, child) {
                                          return ActionButtonBlue(
                                            isEnabled: formGroup.valid,
                                            onPressed: () {
                                              onPressedRegister(
                                                context,
                                                formGroup,
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 800),
              child: Align(
                child: BlocBuilder<UserInfoInitCubit, UserInfoInitState>(
                  builder: (context, state) {
                    if (state is InitialUserInfoInit) {
                      return Visibility(
                        visible: state.shouldShowPasswordValidationWidget,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20, top: 156),
                          child: SizedBox(
                            width: 400,
                            child: Stack(
                              children: [
                                Center(
                                  child: PasswordValidationView(
                                    onPressed: onPressedClosePasswordValidation,
                                    controllerPassword: _controllerPassword,
                                  ),
                                ),
                                const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Icon(
                                    Icons.arrow_left,
                                    color: Colors.white,
                                    size: 80,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void onPressedRegister(BuildContext context, FormGroup form) {
    final name = form.value[formSettings.kFieldName] as String?;
    final surname = form.value[formSettings.kFieldSurname] as String?;
    final email = form.value[formSettings.kFieldEmail] as String?;
    final password = form.value[formSettings.kFieldPassword] as String?;

    context.read<UserInfoInitCubit>().iniUserInfoCreation(
          name,
          surname,
          email,
          password,
        );

    showProcessingDataSnackbar(context);

    // TODO routemaster in next tasks
    Navigator.push(
      context,
      MaterialPageRoute<EmailVerificationPage>(
        builder: (context) => EmailVerificationPage(userEmail: email),
      ),
    );
  }

  void showProcessingDataSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    context.showSnackBar(
      const SnackBar(content: Text('Processing Data...')),
    );
  }

  void onPressedClosePasswordValidation() {
    context
        .read<UserInfoInitCubit>()
        .setVisibilityPasswordValidation(isVisible: false);
  }

  void showErrorSnackbar() {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    context.showSnackBar(
      SnackBar(
        backgroundColor: Colors.red[300],
        content: Row(
          children: [
            Icon(
              Icons.error,
              color: Colors.white,
            ),
            SizedBox(width: 6),
            Text('An error has occurred')
          ],
        ),
      ),
    );
  }
}
