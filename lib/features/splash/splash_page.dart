import 'package:finance/common/constants/app_colors.dart';
import 'package:finance/common/constants/app_text_style.dart';
import 'package:finance/common/widgets/custom_circular_progress_indicator.dart';
import 'package:finance/features/splash/splash_controller.dart';
import 'package:finance/features/splash/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../locator.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _splashController = locator.get<SplashController>();

  @override
  void initState() {
    super.initState();
    _splashController.isUserLogged();
    _splashController.addListener(() {
      if (_splashController.state is SplashStateSuccess) {
      } else {}
    });
  }

  @override
  void dispose() {
    _splashController.dispose();
    super.dispose();
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
