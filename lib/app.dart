import 'package:finance/common/constants/app_routes.dart';
import 'package:finance/common/themes/default_theme.dart';
import 'package:finance/features/home/home_page.dart';
import 'package:finance/features/onboarding/onboarding_page.dart';
import 'package:finance/features/sign_up/sign_up_page.dart';
import 'package:finance/features/splash/splash_page.dart';
import 'package:finance/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'common/themes/theme_controller.dart';
import 'features/sign_in/sign_in_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = locator<ThemeController>();

    return FutureBuilder(
      future: themeController.loadTheme(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ChangeNotifierProvider.value(
            value: themeController,
            child: Consumer<ThemeController>(
              builder: (context, controller, child) {
                return ScreenUtilInit(
                  designSize: const Size(360, 690),
                  minTextAdapt: true,
                  splitScreenMode: true,
                  builder: (_, child) {
                    return MaterialApp(
                      debugShowCheckedModeBanner: false,
                      theme: AppTheme.lightTheme,
                      darkTheme: AppTheme.darkTheme,
                      themeMode: controller
                          .themeMode, // Usando o themeMode do controller
                      initialRoute: NamedRoute.splash,
                      routes: {
                        NamedRoute.initial: (context) => const OnboardingPage(),
                        NamedRoute.splash: (context) => const SplashPage(),
                        NamedRoute.signUp: (context) => const SignUpPage(),
                        NamedRoute.signIn: (context) => const SignInPage(),
                        NamedRoute.home: (context) => const HomePage(),
                      },
                    );
                  },
                );
              },
            ),
          );
        }
      },
    );
  }
}
