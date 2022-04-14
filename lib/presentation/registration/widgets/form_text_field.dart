import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ReactiveFormTextField extends StatelessWidget {
  const ReactiveFormTextField({
    Key? key,
    required this.name,
    required this.hint,
    required this.validationMessages,
    required this.keyboardType,
    this.obscureText = false,
    this.textInputAction = TextInputAction.next,
    this.controller,
    this.focusListener,
  }) : super(key: key);


  final String name;
  final String hint;
  final ValidationMessagesFunction validationMessages;
  final TextInputType keyboardType;
  final bool obscureText;
  final TextInputAction textInputAction;
  final TextEditingController? controller;
  final FocusNode? focusListener;

  OutlineInputBorder get outlineInputBorder => const OutlineInputBorder(
        borderSide: BorderSide(
          color: Color(0x4d676f86),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final inputDecoration = InputDecoration(
      border: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      enabledBorder: outlineInputBorder,
      hintText: hint,
      hintStyle: const TextStyle(color: Color(0x73676f86)),
    );

    return ReactiveTextField<String>(
      formControlName: name,
      validationMessages: validationMessages,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: inputDecoration,
      controller: controller,
      focusNode: focusListener,
    );
  }
}
