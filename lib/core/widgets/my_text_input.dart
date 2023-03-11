import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextInput extends StatelessWidget {
  const MyTextInput({
    Key? key,
    this.label,
    this.onChanged,
    this.errorText,
    this.onSubmitted,
    this.inputFormatters,
    this.keyboardType,
    this.prefixIcon,
    this.prefixText,
    this.suffixIcon,
    this.suffixText,
    this.isRequired = false,
    this.obscureText = false,
    this.autofocus = false,
    this.readOnly = false,
    this.enabled = true,
    this.focusNode,
    this.initialValue,
    this.onTap,
    this.controller,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.hintText,
    this.fillColor,
    this.textAlign = TextAlign.start,
    this.textSize,
    this.maxLines = 1,
    this.maxLength,
  }) : super(key: key);

  final String? label;
  final void Function(String value)? onChanged;
  final String? errorText;
  final void Function(String value)? onSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final String? prefixText;
  final Widget? suffixIcon;
  final String? suffixText;
  final bool isRequired;
  final bool obscureText;
  final bool autofocus;
  final bool readOnly;
  final bool enabled;
  final FocusNode? focusNode;
  final String? initialValue;
  final void Function()? onTap;
  final TextEditingController? controller;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final String? hintText;
  final Color? fillColor;
  final TextAlign textAlign;
  final double? textSize;
  final int? maxLines;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    final border = UnderlineInputBorder(
      borderRadius: BorderRadius.circular(14.0),
      borderSide: const BorderSide(style: BorderStyle.none),
    );
    return TextFormField(
      controller: controller,
      onTap: onTap,
      maxLines: maxLines,
      maxLength: maxLength,
      initialValue: initialValue,
      onChanged: onChanged,
      keyboardType: keyboardType,
      obscureText: obscureText,
      autofocus: autofocus,
      readOnly: readOnly,
      enabled: enabled,
      focusNode: focusNode,
      style: enabled ? _enabledTextStyle(context) : _disabledTextStyle(context),
      textCapitalization: textCapitalization,
      textInputAction: textInputAction,
      textAlign: textAlign,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: label != null ? label! + (isRequired ? ' *' : '') : null,
        prefixStyle:
            enabled ? _enabledTextStyle(context) : _disabledTextStyle(context),
        fillColor: fillColor ?? Theme.of(context).dividerColor.withOpacity(.1),
        filled: true,
        border: border,
        enabledBorder: border,
        focusedBorder: border,
        errorBorder: border,
        focusedErrorBorder: border,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 16.0,
        ),
        prefixIcon: prefixIcon,
        prefixText: prefixText,
        suffixIcon: suffixIcon != null
            ? ClipOval(
                child: Material(
                  color: Colors.transparent,
                  child: suffixIcon,
                ),
              )
            : null,
        suffixText: suffixText,
        errorText: errorText,
      ),
      onFieldSubmitted: onSubmitted,
      inputFormatters: inputFormatters,
    );
  }

  TextStyle _enabledTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge!.copyWith(
          fontWeight: FontWeight.normal,
          fontSize: textSize,
        );
  }

  TextStyle _disabledTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge!.copyWith(
          fontWeight: FontWeight.normal,
          color: Theme.of(context).disabledColor,
          fontSize: textSize,
        );
  }
}
