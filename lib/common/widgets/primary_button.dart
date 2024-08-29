import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_text_style.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String textButton;
  const PrimaryButton({
    super.key,
    this.onPressed,
    required this.textButton,
  });

  final BorderRadius _borderRadius =
      const BorderRadius.all(Radius.circular(24.0));

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: 48.0,
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
