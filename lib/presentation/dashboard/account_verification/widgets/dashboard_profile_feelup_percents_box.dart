import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/presentation/registration/widgets/simple_button_light_blue.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DashboardProfileFeelUpPercentsBox extends StatelessWidget {
  const DashboardProfileFeelUpPercentsBox({
    Key? key,
    required this.percentsProgress,
    required this.imagePath,
    required this.title,
    required this.subTitle,
    required this.onPressed,
  }) : super(key: key);

  final int? percentsProgress;
  final String imagePath;
  final String title;
  final String subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      decoration: const BoxDecoration(
        color: white,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 35, top: 35),
            child: Row(
              children: [
                const Spacer(),
                Chip(
                  backgroundColor: darkGreen,
                  label: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: Text(
                      '${percentsProgress?.toString() ?? ""} ${percentsProgress == null ? " " : "%"}',
                      style: inter10.copyWith(
                        color: fruitSalad,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50, bottom: 50),
            child: Column(
              children: [
                SvgPicture.asset(
                  imagePath,
                  width: 50,
                  height: 50,
                ),
                const SizedBox(height: 24),
                Text(title),
                const SizedBox(height: 16),
                Text(
                  subTitle,
                  style: inter12,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                SimpleButtonLightBlue(
                  text: 'BEARBEITEN',
                  onPressed: onPressed,
                  isEnabled: true,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
