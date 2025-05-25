import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_text_style.dart';

class CustomTextSpan extends StatelessWidget {
  final String primaryText;
  final String actionText;
  final String page;

  const CustomTextSpan({
    super.key,
    required this.primaryText,
    required this.actionText,
    required this.page,
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
                Navigator.pushNamed(context, page);
              },
            text: " $actionText",
            style: AppTextStyle.smallText.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
