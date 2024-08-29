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

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

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
                  color: AppColors.secondary,
                ),
              ),
              Text(
                "Save More",
                style: AppTextStyle.mediumText.copyWith(
                  color: AppColors.secondary,
                ),
              ),
              SizedBox(
                height: 140.h,
                child: Image.asset(AppImages.billyComputerScientist),
              ),
              SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextFormField(
                        customLabelText: 'Name',
                        customHintText: 'Name',
                        customSufixIcon: Icons.person,
                        customKeyboardType: TextInputType.text,
                        customValidator: (value) {
                          if (value!.isEmpty) {
                            return "Esse campo não pode ser vazio.";
                          }
                          return null;
                        },
                      ),
                      16.verticalSpace,
                      CustomTextFormField(
                        customLabelText: 'Email',
                        customHintText: 'Email',
                        customSufixIcon: Icons.mail,
                        customKeyboardType: TextInputType.emailAddress,
                        customValidator: (value) {
                          if (value!.isEmpty) {
                            return "Esse campo não pode ser vazio.";
                          }
                          return null;
                        },
                      ),
                      16.verticalSpace,
                      CustomPasswordFormField(
                        customLabelText: 'Password',
                        customHintText: 'Password',
                        customKeyboardType: TextInputType.text,
                        customHelperText:
                            "Sua senha precisa de 8 caracteres com pelo menos 1 maiúcula e 1 número",
                        customValidator: (value) {
                          if (value!.isEmpty) {
                            return "Esse campo não pode ser vazio.";
                          }
                          return null;
                        },
                      ),
                      16.verticalSpace,
                      CustomPasswordFormField(
                        customLabelText: 'Confirm Password',
                        customHintText: 'Confirm Password',
                        customKeyboardType: TextInputType.text,
                        customValidator: (value) {
                          if (value!.isEmpty) {
                            return "Esse campo não pode ser vazio.";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              24.verticalSpace,
              CustomPrimaryButton(
                textButton: "Sign Up",
                onPressed: () {
                  final valid = _formKey.currentState != null &&
                      _formKey.currentState!.validate();
                  if (valid) {
                    log("Continuar logica de login");
                  } else {
                    log("Erro ao logar");
                  }
                },
              ),
              16.verticalSpace,
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
