import 'dart:async';

import 'package:finance/common/constants/app_colors.dart';
import 'package:finance/common/constants/app_routes.dart';
import 'package:finance/common/constants/app_text_style.dart';
import 'package:finance/common/widgets/custom_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Timer init() {
    return Timer(const Duration(seconds: 2), navigateToOnboarding);
  }

  void navigateToOnboarding() {
    Navigator.pushReplacementNamed(context, NamedRoute.initial);
  }

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Finance",
              style: AppTextStyle.bigText.copyWith(
                color: AppColors.white,
              ),
            ),
            32.verticalSpace,
            const CustomCircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
