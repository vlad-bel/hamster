import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/presentation/login/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_portal/flutter_portal.dart';

class FloatingWrongCredentialsView extends StatelessWidget {
  const FloatingWrongCredentialsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Portal(
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          if (state is! InitialLogin) {
            return const SizedBox();
          } else {
            return PortalTarget(
              visible: state.isWrongPasswordEmail,
              portalFollower: Transform.translate(
                offset: const Offset(400, 0),
                child: Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Stack(
                    children: [
                      Container(
                        width: 346,
                        height: 365,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x29000000),
                              offset: Offset(0, 3),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(30),
                          child: Column(
                            children: [
                              const Icon(
                                Icons.error_outline_rounded,
                                size: 100,
                                color: razzmatazz,
                              ),
                              const SizedBox(height: 22),
                              Text(
                                'Anmeldung fehlgeschlagen',
                                style: inter16,
                              ),
                              const SizedBox(height: 18),
                              const Text(
                                'Die eingegebene E-Mail-/Passwort-Kombination existiert nicht. Bitte überprüfen Sie Ihre Angaben und versuchen es nochmals.',
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 26),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Hinweis schließen',
                                  style: TextStyle(
                                    color: razzmatazz,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: const Offset(-45, 138),
                        child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Icon(
                            Icons.arrow_left,
                            color: Colors.white,
                            size: 80,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              anchor: Aligned.center,
              child: const SizedBox(height: 0),
            );
          }
        },
      ),
    );
  }
}
