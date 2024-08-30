import 'dart:developer';

import 'package:finance/common/utils/validator.dart';
import 'package:finance/features/sign_up/sign_up_controller.dart';
import 'package:finance/services/mock_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/constants/app_colors.dart';
import '../../common/constants/app_images.dart';
import '../../common/constants/app_text_style.dart';
import '../../common/widgets/custom_bottom_sheet.dart';
import '../../common/widgets/custom_circular_progress_indicator.dart';
import '../../common/widgets/custom_password_form_field.dart';
import '../../common/widgets/custom_primary_button.dart';
import '../../common/widgets/custom_text_form_field.dart';
import '../../common/widgets/custom_text_span.dart';
import 'sign_up_state.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _controller = SignUpController(MockAuthService());

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(
      () {
        if (_controller.state is SignUpLoadingState) {
          showDialog(
            context: context,
            builder: (context) => const CustomCircularProgressIndicator(),
          );
        }
        if (_controller.state is SignUpSuccessState) {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Scaffold(
                body: Center(
                  child: Text(
                    "Nova Tela",
                  ),
                ),
              ),
            ),
          );
        }

        if (_controller.state is SignUpErrorState) {
          final errorMessage = _controller.state as SignUpErrorState;
          Navigator.pop(context);
          customBottomSheet(
            context,
            content: errorMessage.message,
            buttonText: "Tentar novamente",
          );
        }
      },
    );
  }

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
                        controller: _nameController,
                        customLabelText: 'Name',
                        customHintText: 'Name',
                        customSufixIcon: Icons.person,
                        customKeyboardType: TextInputType.text,
                        customValidator: Validator.validateName,
                        textCapitalization: TextCapitalization.words,
                      ),
                      16.verticalSpace,
                      CustomTextFormField(
                        controller: _emailController,
                        customLabelText: 'Email',
                        customHintText: 'Email',
                        customSufixIcon: Icons.mail,
                        customKeyboardType: TextInputType.emailAddress,
                        customValidator: Validator.validateEmail,
                      ),
                      16.verticalSpace,
                      CustomPasswordFormField(
                        customLabelText: 'Password',
                        customHintText: 'Password',
                        customKeyboardType: TextInputType.text,
                        customHelperText: "The password needs to be strong",
                        customValidator: Validator.validatePassword,
                        controller: _passwordController,
                      ),
                      16.verticalSpace,
                      CustomPasswordFormField(
                        customLabelText: 'Confirm Password',
                        customHintText: 'Confirm Password',
                        customKeyboardType: TextInputType.text,
                        customValidator: (value) =>
                            Validator.validateConfirmPassword(
                                _passwordController.text, value),
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
                    _controller.signUp(
                      name: _nameController.text,
                      email: _emailController.text,
                      password: _passwordController.text,
                    );
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
