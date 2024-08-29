import 'dart:developer';

import 'package:finance/common/constants/app_colors.dart';
import 'package:finance/common/constants/app_images.dart';
import 'package:finance/common/constants/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/widgets/custom_primary_button.dart';
import '../../common/widgets/custom_text_span.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffold,
      body: Align(
        child: Column(
          children: [
            64.verticalSpace,
            Expanded(
              flex: 2,
              child: Image.asset(
                AppImages.billyWithBank,
              ),
            ),
            Text(
              "Spend Smarter",
              style: AppTextStyle.mediumText.copyWith(
                color: AppColors.secondary,
              ),
            ),
            Text(
              "Save More",
              style: AppTextStyle.mediumText.copyWith(
                color: AppColors.secondary,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: CustomPrimaryButton(
                textButton: "Get Started",
                onPressed: () {
                  log("Tap");
                },
              ),
            ),
            const CustomTextSpan(
              primaryText: 'Already have an account?',
              actionText: 'Log In',
            ),
            32.verticalSpace,
          ],
        ),
      ),
    );
  }
}
