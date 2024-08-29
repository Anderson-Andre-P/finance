import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_text_style.dart';

class CustomTextSpan extends StatelessWidget {
  final String primaryText;
  final String actionText;
  const CustomTextSpan({
    super.key,
    required this.primaryText,
    required this.actionText,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: primaryText,
            style: AppTextStyle.smallText.copyWith(
              color: AppColors.greyLight,
            ),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                log("Tap");
              },
            text: " $actionText",
            style: AppTextStyle.smallText.copyWith(
              color: AppColors.blueLightOne,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
