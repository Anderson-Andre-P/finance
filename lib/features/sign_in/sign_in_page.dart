import 'dart:developer';

import 'package:finance/common/utils/validator.dart';
import 'package:finance/services/mock_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/constants/app_colors.dart';
import '../../common/constants/app_images.dart';
import '../../common/constants/app_routes.dart';
import '../../common/constants/app_text_style.dart';
import '../../common/widgets/custom_bottom_sheet.dart';
import '../../common/widgets/custom_circular_progress_indicator.dart';
import '../../common/widgets/custom_password_form_field.dart';
import '../../common/widgets/custom_primary_button.dart';
import '../../common/widgets/custom_text_form_field.dart';
import '../../common/widgets/custom_text_span.dart';
import 'sign_in_controller.dart';
import 'sign_in_state.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _controller = SignInController(MockAuthService());

  @override
  void dispose() {
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
        if (_controller.state is SignInStateLoading) {
          showDialog(
            context: context,
            builder: (context) => const CustomCircularProgressIndicator(),
          );
        }
        if (_controller.state is SignInStateSuccess) {
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

        if (_controller.state is SignInStateError) {
          final errorMessage = _controller.state as SignInStateError;
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
                "Welcome Back!",
                style: AppTextStyle.mediumText.copyWith(
                  color: AppColors.secondary,
                ),
              ),
              SizedBox(
                height: 140.h,
                child: Image.asset(AppImages.billyWithKey),
              ),
              SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                    ],
                  ),
                ),
              ),
              24.verticalSpace,
              CustomPrimaryButton(
                textButton: "Login",
                onPressed: () {
                  final valid = _formKey.currentState != null &&
                      _formKey.currentState!.validate();
                  if (valid) {
                    _controller.signIn(
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
                page: NamedRoute.signUp,
                primaryText: 'Don\'t have an account?',
                actionText: 'Sign Up',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
