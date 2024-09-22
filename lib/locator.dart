import 'package:finance/features/sign_in/sign_in_controller.dart';
import 'package:finance/features/sign_up/sign_up_controller.dart';
import 'package:finance/features/splash/splash_controller.dart';
import 'package:finance/services/auth_service.dart';
import 'package:finance/services/secure_storage.dart';
import 'package:get_it/get_it.dart';

import 'common/themes/theme_controller.dart';
import 'services/firebase_auth_service.dart';

final locator = GetIt.instance;

void setupDependencies() {
  locator.registerLazySingleton<AuthService>(() => FirebaseAuthService());
  locator.registerLazySingleton<SecureStorage>(() => const SecureStorage());

  locator.registerFactory<SplashController>(
      () => SplashController(const SecureStorage()));

  locator.registerFactory<SignInController>(
      () => SignInController(locator.get<AuthService>()));

  locator.registerFactory<SignUpController>(
      () => SignUpController(locator.get<AuthService>()));

  // Registrar o ThemeController
  locator.registerLazySingleton<ThemeController>(
      () => ThemeController(locator.get<SecureStorage>()));
}
