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

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.all(Radius.circular(24.0)),
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(24.0)),
          gradient: LinearGradient(
            colors: onPressed != null
                ? AppColors.greenGradient
                : AppColors.greyGradient,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(24.0)),
          onTap: onPressed,
          child: Container(
            alignment: Alignment.center,
            height: 48.0,
            child: Text(
              textButton,
              style: AppTextStyle.buttonText.copyWith(
                color: AppColors.whiteLight,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
