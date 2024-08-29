import 'package:finance/common/constants/app_colors.dart';
import 'package:finance/common/constants/app_text_style.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: AppColors.greenGradient,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Text(
          "Finance",
          style: AppTextStyle.bigText.copyWith(
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
