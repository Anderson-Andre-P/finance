import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class CustomTextFormField extends StatefulWidget {
  final String customLabelText;
  final String customHintText;
  final IconData customSufixIcon;
  final TextInputType customKeyboardType;
  final TextEditingController? controller;

  const CustomTextFormField({
    super.key,
    required this.customLabelText,
    required this.customHintText,
    required this.customSufixIcon,
    required this.customKeyboardType,
    this.controller,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      cursorColor: AppColors.primary,
      textInputAction: TextInputAction.next,
      keyboardType: widget.customKeyboardType,
      decoration: InputDecoration(
        hintText: widget.customHintText,
        labelText: widget.customLabelText,
        labelStyle: const TextStyle(
          color: AppColors.primary,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      )
          .applyDefaults(
            Theme.of(context).inputDecorationTheme,
          )
          .copyWith(
            suffixIcon: Icon(
              widget.customSufixIcon,
            ),
          ),
    );
  }
}
