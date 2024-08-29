import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/constants/app_colors.dart';
import '../../common/constants/app_images.dart';
import '../../common/constants/app_text_style.dart';
import '../../common/widgets/custom_password_form_field.dart';
import '../../common/widgets/custom_primary_button.dart';
import '../../common/widgets/custom_text_form_field.dart';
import '../../common/widgets/custom_text_span.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Spend Smarter",
                style: AppTextStyle.mediumText.copyWith(
                  color: AppColors.blueLightTwo,
                ),
              ),
              Text(
                "Save More",
                style: AppTextStyle.mediumText.copyWith(
                  color: AppColors.blueLightTwo,
                ),
              ),
              SizedBox(
                height: 210.h,
                child: Image.asset(AppImages.billyComputerScientist),
              ),
              const SizedBox(
                height: 264,
                child: Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextFormField(
                        customLabelText: 'Name',
                        customHintText: 'Name',
                        customSufixIcon: Icons.person,
                        customKeyboardType: TextInputType.text,
                      ),
                      CustomTextFormField(
                        customLabelText: 'Email',
                        customHintText: 'Email',
                        customSufixIcon: Icons.mail,
                        customKeyboardType: TextInputType.emailAddress,
                      ),
                      CustomPasswordFormField(
                        customLabelText: 'Password',
                        customHintText: 'Password',
                        customKeyboardType: TextInputType.text,
                      ),
                      CustomPasswordFormField(
                        customLabelText: 'Confirm Password',
                        customHintText: 'Confirm Password',
                        customKeyboardType: TextInputType.text,
                      ),
                    ],
                  ),
                ),
              ),
              24.verticalSpace,
              CustomPrimaryButton(
                textButton: "Sign Up",
                onPressed: () {
                  log("Tap");
                },
              ),
              const CustomTextSpan(
                primaryText: 'Already have an account?',
                actionText: 'Sign In',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
