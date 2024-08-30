import 'package:finance/common/constants/app_routes.dart';
import 'package:finance/common/themes/default_theme.dart';
import 'package:finance/features/onboarding/onboarding_page.dart';
import 'package:finance/features/sign_up/sign_up_page.dart';
import 'package:finance/features/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: ThemeMode.system,
            initialRoute: NamedRoute.splash,
            routes: {
              NamedRoute.initial: (context) => const OnboardingPage(),
              NamedRoute.splash: (context) => const SplashPage(),
              NamedRoute.signUp: (context) => const SignUpPage(),
            },
          );
        },
      ),
    );
  }
}
