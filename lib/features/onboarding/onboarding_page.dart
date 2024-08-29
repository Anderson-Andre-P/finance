import 'dart:developer';

import 'package:finance/common/constants/app_colors.dart';
import 'package:finance/common/constants/app_text_style.dart';
import 'package:flutter/material.dart';

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
            const SizedBox(
              height: 64.0,
            ),
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
            Text(
              "Already have account? Log In...",
              style: AppTextStyle.smallText.copyWith(
                color: AppColors.greyLight,
              ),
            ),
            const SizedBox(
              height: 32.0,
            ),
          ],
        ),
      ),
    );
  }
}
