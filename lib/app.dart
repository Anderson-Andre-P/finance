import 'package:finance/language_controller.dart';
import 'package:finance/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'common/constants/app_routes.dart';
import 'common/themes/default_theme.dart';
import 'common/themes/theme_controller.dart';
import 'features/home/home_page.dart';
import 'features/onboarding/onboarding_page.dart';
import 'features/sign_in/sign_in_page.dart';
import 'features/sign_up/sign_up_page.dart';
import 'features/splash/splash_page.dart';
import 'generated/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    final themeController = locator<ThemeController>();
    final languageController = locator<LanguageController>();

    return FutureBuilder(
      future: themeController.loadTheme(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider.value(value: themeController),
              ChangeNotifierProvider.value(value: languageController),
            ],
            child: Consumer2<ThemeController, LanguageController>(
              builder: (context, themeController, languageController, child) {
                return ScreenUtilInit(
                  designSize: const Size(360, 690),
                  minTextAdapt: true,
                  splitScreenMode: true,
                  builder: (_, child) {
                    return MaterialApp(
                      navigatorKey: App.navigatorKey,
                      debugShowCheckedModeBanner: false,
                      theme: AppTheme.lightTheme,
                      darkTheme: AppTheme.darkTheme,
                      themeMode: themeController.themeMode,
                      locale: languageController.locale,
                      supportedLocales: const [
                        Locale('en', 'US'),
                        Locale('pt', 'BR'),
                      ],
                      localizationsDelegates: const [
                        S.delegate,
                        GlobalMaterialLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate,
                        GlobalCupertinoLocalizations.delegate,
                      ],
                      localeResolutionCallback: (locale, supportedLocales) {
                        if (locale == null) {
                          return supportedLocales.first;
                        }
                        for (var supportedLocale in supportedLocales) {
                          if (supportedLocale.languageCode ==
                                  locale.languageCode &&
                              supportedLocale.countryCode ==
                                  locale.countryCode) {
                            return supportedLocale;
                          }
                        }
                        return supportedLocales.first;
                      },
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
