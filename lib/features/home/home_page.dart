import 'package:finance/common/constants/app_routes.dart';
import 'package:finance/language_controller.dart';
import 'package:finance/services/secure_storage.dart';
import 'package:flutter/material.dart';

import '../../common/themes/theme_controller.dart';
import '../../generated/l10n.dart';
import '../../locator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _secureStoage = const SecureStorage();
  @override
  Widget build(BuildContext context) {
    final themeController = locator<ThemeController>();
    final languageController = locator<LanguageController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).signIn),
        actions: [
          IconButton(
            icon: Icon(
              themeController.themeMode == ThemeMode.dark
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
            onPressed: () {
              themeController.toggleTheme();
            },
          ),
          PopupMenuButton<String>(
            onSelected: (String value) {
              if (value == 'pt') {
                languageController.setLanguage('pt_BR');
              } else {
                languageController.setLanguage('en_US');
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'en',
                child: Text('English'),
              ),
              const PopupMenuItem<String>(
                value: 'pt',
                child: Text('Português'),
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Olá, mundo!"),
            ElevatedButton(
              onPressed: () {
                _secureStoage.deleteOne(key: "CURRENT_USER").then(
                      (_) => Navigator.popAndPushNamed(
                          context, NamedRoute.initial),
                    );
              },
              child: const Text(
                "Log Out",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
