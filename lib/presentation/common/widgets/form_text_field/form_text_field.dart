import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FormTextField extends StatefulWidget {
  const FormTextField({
    Key? key,
    this.name,
    this.hint,
    this.label,
    this.validationMessages,
    this.keyboardType,
    this.obscureText = false,
    this.readOnly = false,
    this.reactive = true,
    this.textInputAction = TextInputAction.next,
    this.controller,
    this.focusListener,
    this.onTap,
    this.customSuffix,
    this.customPrefix,
    this.prefixIcon,
    this.customBorder,
    this.maxLength,
    this.counter,
    this.inputFormatters,
    this.suffix,
    this.focusColor,
    this.fillColor,
    this.initialText,
  }) : super(key: key);

  final String? name;
  final String? hint;
  final String? label;
  final String? initialText;
  final ValidationMessagesFunction? validationMessages;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool readOnly;
  final bool reactive;
  final TextInputAction textInputAction;
  final TextEditingController? controller;
  final FocusNode? focusListener;
  final VoidCallback? onTap;
  final Widget? customSuffix;
  final Widget? customPrefix;
  final Widget? prefixIcon;
  final Widget? suffix;
  final InputBorder? customBorder;
  final int? maxLength;
  final Widget? counter;
  final List<TextInputFormatter>? inputFormatters;
  final Color? focusColor;
  final Color? fillColor;

  @override
  State<FormTextField> createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {
  late bool _obscureText;

  @override
  void initState() {
    _obscureText = widget.obscureText;

    super.initState();
  }

  OutlineInputBorder get outlineInputBorder => const OutlineInputBorder(
        borderSide: BorderSide(
          color: Color(0x4d676f86),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final showHidePasswordIcon = IconButton(
      icon: Icon(
        _obscureText
            ? Icons.visibility_outlined
            : Icons.visibility_off_outlined,
        color: const Color(0x8c676f86),
      ),
      onPressed: () {
        setState(() {
          _obscureText = !_obscureText;
        });
      },
    );

    final inputDecoration = InputDecoration(
      border: widget.customBorder ?? outlineInputBorder,
      enabledBorder: widget.customBorder ?? outlineInputBorder,
      hintText: widget.hint,
      focusColor: widget.focusColor,
      fillColor: widget.fillColor,
      labelText: widget.label,
      floatingLabelAlignment: FloatingLabelAlignment.start,
      floatingLabelStyle: inter12,
      labelStyle: inter14.copyWith(color: lynch.withOpacity(0.3)),
      alignLabelWithHint: true,
      hintStyle: inter14.copyWith(color: lynch.withOpacity(0.3)),
      suffixIcon:
          !widget.obscureText ? widget.customSuffix : showHidePasswordIcon,
      prefix: widget.customPrefix,
      prefixIcon: widget.prefixIcon,
      suffix: widget.suffix,
      counter: widget.counter,
    );

    if (widget.reactive) {
      return ReactiveTextField<String>(
        formControlName: widget.name,
        validationMessages: widget.validationMessages,
        textInputAction: widget.textInputAction,
        keyboardType: widget.keyboardType,
        obscureText: _obscureText,
        decoration: inputDecoration,
        controller: widget.controller ?? TextEditingController()
          ..text = widget.initialText ?? '',
        focusNode: widget.focusListener,
        onTap: widget.onTap,
        readOnly: widget.readOnly,
        maxLength: widget.maxLength,
        inputFormatters: widget.inputFormatters,
      );
    } else {
      return TextField(
        textInputAction: widget.textInputAction,
        keyboardType: widget.keyboardType,
        obscureText: _obscureText,
        decoration: inputDecoration,
        controller: widget.controller ?? TextEditingController()
          ..text = widget.initialText ?? '',
        focusNode: widget.focusListener,
        onTap: widget.onTap,
        readOnly: widget.readOnly,
        maxLength: widget.maxLength,
        inputFormatters: widget.inputFormatters,
      );
    }
  }
}
