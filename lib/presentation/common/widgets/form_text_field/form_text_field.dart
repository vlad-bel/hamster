import 'package:business_terminal/config/colors.dart';
import 'package:business_terminal/config/styles.dart';
import 'package:business_terminal/presentation/common/widgets/hint/hint_overlay_provider_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FormTextField extends StatefulWidget {
  const FormTextField(
      {Key? key,
      required this.name,
      this.hint,
      this.label,
      this.validationMessages,
      this.keyboardType,
      this.obscureText = false,
      this.readOnly = false,
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
      this.hintOverlayBuilder})
      : super(key: key);

  final String name;
  final String? hint;
  final String? label;
  final ValidationMessagesFunction? validationMessages;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool readOnly;
  final TextInputAction textInputAction;
  final TextEditingController? controller;
  final FocusNode? focusListener;
  final VoidCallback? onTap;
  final Widget? customSuffix;
  final Widget? customPrefix;
  final Widget? prefixIcon;
  final InputBorder? customBorder;
  final int? maxLength;
  final Widget? counter;
  final List<TextInputFormatter>? inputFormatters;
  final HintOverlayWidgetBuilder? hintOverlayBuilder;

  @override
  State<FormTextField> createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField>
    with HintOverlayProviderMixin<FormTextField> {
  late bool _obscureText;
  late FocusNode _focusListener;

  @override
  void initState() {
    _obscureText = widget.obscureText;
    _focusListener = widget.focusListener ?? FocusNode();

    _initFocusListener();

    overlayWidgetBuilder = widget.hintOverlayBuilder;

    super.initState();
  }

  @override
  void didUpdateWidget(FormTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    overlayWidgetBuilder = widget.hintOverlayBuilder;
    if (widget.hintOverlayBuilder == null) {
      hideOverlay();
    }
  }

  OutlineInputBorder get outlineInputBorder => const OutlineInputBorder(
        borderSide: BorderSide(
          color: Color(0x4d676f86),
        ),
      );

  void _initFocusListener() {
    _focusListener.addListener(_onFocusChanged);
  }

  void _onFocusChanged() {
    if (_focusListener.hasFocus) {
      _onFocused();
    } else {
      _onUnfocused();
    }
  }

  void _onFocused() {
    if (widget.hintOverlayBuilder != null) {
      showOverlay();
    }
  }

  void _onUnfocused() {
    hideOverlay();
  }

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
      hintText: widget.hint,
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
      counter: widget.counter,
    );

    return CompositedTransformTarget(
      link: hintLayerLink,
      child: ReactiveTextField<String>(
        formControlName: widget.name,
        validationMessages: widget.validationMessages,
        textInputAction: widget.textInputAction,
        keyboardType: widget.keyboardType,
        obscureText: _obscureText,
        decoration: inputDecoration,
        controller: widget.controller,
        focusNode: _focusListener,
        onTap: widget.onTap,
        readOnly: widget.readOnly,
        maxLength: widget.maxLength,
        inputFormatters: widget.inputFormatters,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _focusListener.removeListener(_onFocusChanged);
  }
}
