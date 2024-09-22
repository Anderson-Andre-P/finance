import 'package:finance/app.dart';
import 'package:finance/firebase_options.dart';
import 'package:finance/language_controller.dart';
import 'package:finance/locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencies();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final languageController = locator<LanguageController>();
  await languageController.loadLanguage();

  runApp(const App());
}
