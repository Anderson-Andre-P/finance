import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';

class CustomPasswordFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String customLabelText;
  final String customHintText;

  final TextInputType customKeyboardType;
  const CustomPasswordFormField({
    super.key,
    this.controller,
    required this.customLabelText,
    required this.customHintText,
    required this.customKeyboardType,
  });

  @override
  State<CustomPasswordFormField> createState() =>
      _CustomPasswordFormFieldState();
}

class _CustomPasswordFormFieldState extends State<CustomPasswordFormField> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      cursorColor: AppColors.primary,
      textInputAction: TextInputAction.next,
      keyboardType: widget.customKeyboardType,
      obscureText: isVisible,
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
            suffixIcon: InkWell(
              borderRadius: BorderRadius.circular(24.r),
              onTap: () {
                log("Prees");
                setState(() {
                  isVisible = !isVisible;
                });
              },
              child: Icon(
                isVisible ? Icons.visibility : Icons.visibility_off,
              ),
            ),
          ),
    );
  }
}
