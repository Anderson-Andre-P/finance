import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';

class CustomTextFormField extends StatefulWidget {
  final String customLabelText;
  final String customHintText;
  final IconData customSufixIcon;
  final TextInputType customKeyboardType;
  final TextEditingController? controller;
  final String? customHelperText;

  final FormFieldValidator<String>? customValidator;

  const CustomTextFormField({
    super.key,
    required this.customLabelText,
    required this.customHintText,
    required this.customSufixIcon,
    required this.customKeyboardType,
    this.controller,
    this.customValidator,
    this.customHelperText,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.customValidator,
      cursorColor: AppColors.primary,
      textInputAction: TextInputAction.next,
      keyboardType: widget.customKeyboardType,
      decoration: InputDecoration(
        helperText: widget.customHelperText,
        hintText: widget.customHintText,
        labelText: widget.customLabelText,
        labelStyle: const TextStyle(
          color: AppColors.primary,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        errorMaxLines: 1,
        errorStyle: TextStyle(
          color: Colors.red,
          fontSize: 12.sp,
        ),
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
