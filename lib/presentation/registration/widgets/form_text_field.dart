import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FormTextField extends StatefulWidget {
  const FormTextField({
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

  @override
  State<FormTextField> createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {
  bool _passwordInvisible = true;

  OutlineInputBorder get outlineInputBorder => const OutlineInputBorder(
        borderSide: BorderSide(
          color: Color(0x4d676f86),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final showHidePasswordIcon = IconButton(
      icon: Icon(
        _passwordInvisible
            ? Icons.visibility_outlined
            : Icons.visibility_off_outlined,
        color: const Color(0x8c676f86),
      ),
      onPressed: () {
        setState(() {
          _passwordInvisible = !_passwordInvisible;
        });
      },
    );

    final inputDecoration = InputDecoration(
      border: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      enabledBorder: outlineInputBorder,
      hintText: widget.hint,
      hintStyle: const TextStyle(color: Color(0x73676f86)),
      suffixIcon: !widget.obscureText ? null : showHidePasswordIcon,
    );

    return ReactiveTextField<String>(
      formControlName: widget.name,
      validationMessages: widget.validationMessages,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText ? _passwordInvisible : false,
      decoration: inputDecoration,
      controller: widget.controller,
      focusNode: widget.focusListener,
    );
  }
}
