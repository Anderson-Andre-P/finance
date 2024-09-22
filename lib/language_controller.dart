import 'package:finance/services/secure_storage.dart';
import 'package:flutter/material.dart';

class LanguageController extends ChangeNotifier {
  final SecureStorage _secureStorage;

  Locale? _locale;

  LanguageController(this._secureStorage);

  Locale? get locale => _locale;

  Future<void> loadLanguage() async {
    final languageCode = await _secureStorage.getLanguage();
    if (languageCode != null) {
      _locale = Locale(languageCode.split('_')[0], languageCode.split('_')[1]);
    } else {
      _locale = const Locale('pt', 'BR'); // Padrão
    }
    notifyListeners();
  }

  Future<void> setLanguage(String languageCode) async {
    await _secureStorage.saveLanguage(languageCode);
    _locale = Locale(languageCode.split('_')[0], languageCode.split('_')[1]);
    notifyListeners();
  }
}
