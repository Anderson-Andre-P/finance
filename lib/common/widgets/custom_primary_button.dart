import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';
import '../constants/app_text_style.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String textButton;
  PrimaryButton({
    super.key,
    this.onPressed,
    required this.textButton,
  });

  final BorderRadius _borderRadius = BorderRadius.all(Radius.circular(24.0.r));

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: 48.0.h,
      decoration: BoxDecoration(
        borderRadius: _borderRadius,
        gradient: LinearGradient(
          colors: onPressed != null
              ? AppColors.greenGradient
              : AppColors.greyGradient,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: InkWell(
        borderRadius: _borderRadius,
        onTap: onPressed,
        child: Align(
          child: Text(
            textButton,
            style: AppTextStyle.buttonText.copyWith(
              color: AppColors.whiteLight,
            ),
          ),
        ),
      ),
    );
  }
}
