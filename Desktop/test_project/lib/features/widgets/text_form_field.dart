import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_project/features/utils/app_colors.dart';

class TextFormInput extends StatelessWidget {
  const TextFormInput(
      {Key? key,
      required this.controller,
      this.autovalidateMode,
      required this.validator,
      this.labelText,
      required this.obscureText,
      this.suffixIcon,
      this.prefixIcon,
      this.onChanged,
      this.inputFormatters,
      this.enabled,
      this.textLength,
      this.readOnly = false,
      // required this.capitalization,

      this.keyboardType})
      : super(key: key);

  final String? labelText;
  final bool obscureText;
  final Widget? suffixIcon;
  final bool? enabled;
  final bool readOnly;
  final Widget? prefixIcon;

  final TextInputType? keyboardType;
  final TextEditingController controller;
  final AutovalidateMode? autovalidateMode;
  final String? Function(String?) validator;
  // final TextCapitalization capitalization;
  final List<TextInputFormatter>? inputFormatters;
  final int? textLength;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        enabled: enabled,
        controller: controller,
        cursorColor: Colors.black,
        readOnly: readOnly,
        maxLength: textLength,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        autovalidateMode: autovalidateMode,
        // textCapitalization: capitalization,
        inputFormatters: inputFormatters,
        obscureText: obscureText,
        textInputAction: TextInputAction.next,
        keyboardType: keyboardType,
        onChanged: onChanged,
        onEditingComplete: () => FocusScope.of(context).nextFocus(),
        decoration: InputDecoration(
          errorStyle: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Colors.blue, fontSize: 12),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedErrorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          hintText: labelText,
          hintStyle: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Colors.grey),
          border: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.backgroundColor),
          ),
        ),
        validator: validator);
  }
}

class TextFormInput2 extends StatelessWidget {
  const TextFormInput2(
      {Key? key,
      required this.controller,
      this.autovalidateMode,
      required this.validator,
      this.labelText,
      required this.obscureText,
      this.suffixIcon,
      this.prefixIcon,
      this.onChanged,
      this.inputFormatters,
      this.enabled,
      this.textLength,
      this.color = Colors.black,
      this.readOnly = false,
      // required this.capitalization,

      this.keyboardType})
      : super(key: key);

  final String? labelText;
  final bool obscureText;
  final Widget? suffixIcon;
  final bool? enabled;
  final bool readOnly;
  final Widget? prefixIcon;

  final TextInputType? keyboardType;
  final TextEditingController controller;
  final Color? color;
  final AutovalidateMode? autovalidateMode;
  final String? Function(String?) validator;
  // final TextCapitalization capitalization;
  final List<TextInputFormatter>? inputFormatters;
  final int? textLength;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        enabled: enabled,
        controller: controller,
        cursorColor: Colors.black54,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: color),
        readOnly: readOnly,
        maxLength: textLength,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        autovalidateMode: autovalidateMode,
        // textCapitalization: capitalization,
        inputFormatters: inputFormatters,
        obscureText: obscureText,
        textInputAction: TextInputAction.next,
        keyboardType: keyboardType,
        onChanged: onChanged,
        onEditingComplete: () => FocusScope.of(context).nextFocus(),
        decoration: InputDecoration(
          errorStyle: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Colors.blue, fontSize: 12),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
          focusedErrorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          hintText: labelText,
          hintStyle: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Colors.grey),
          border: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
        ),
        validator: validator);
  }
}
