import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';

class CustomPasswordFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String customLabelText;
  final String customHintText;
  final String? customHelperText;
  final FormFieldValidator<String>? customValidator;

  final TextInputType customKeyboardType;
  const CustomPasswordFormField({
    super.key,
    required this.customLabelText,
    required this.customHintText,
    required this.customKeyboardType,
    this.controller,
    this.customValidator,
    this.customHelperText,
  });

  @override
  State<CustomPasswordFormField> createState() =>
      _CustomPasswordFormFieldState();
}

class _CustomPasswordFormFieldState extends State<CustomPasswordFormField> {
  bool isVisible = true;
  String? _helperText;

  @override
  void initState() {
    super.initState();

    _helperText = widget.customHelperText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        if (value.length == 1) {
          setState(() {
            _helperText = null;
          });
        } else if (value.isEmpty) {
          setState(() {
            _helperText = widget.customHelperText;
          });
        }
      },
      controller: widget.controller,
      validator: widget.customValidator,
      cursorColor: AppColors.primary,
      textInputAction: TextInputAction.next,
      keyboardType: widget.customKeyboardType,
      obscureText: isVisible,
      decoration: InputDecoration(
        helperText: _helperText,
        helperMaxLines: 2,
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
