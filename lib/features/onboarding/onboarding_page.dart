import 'dart:developer';

import 'package:finance/common/constants/app_colors.dart';
import 'package:finance/common/constants/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/widgets/custom_text_button.dart';
import '../../common/widgets/primary_button.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.iceLight,
      body: Align(
        child: Column(
          children: [
            64.verticalSpace,
            Expanded(
              flex: 2,
              child: Image.asset(
                "assets/images/man.png",
              ),
            ),
            Text(
              "Spend Smarter",
              style: AppTextStyle.mediumText.copyWith(
                color: AppColors.greenLightTwo,
              ),
            ),
            Text(
              "Save More",
              style: AppTextStyle.mediumText.copyWith(
                color: AppColors.greenLightTwo,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: PrimaryButton(
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
