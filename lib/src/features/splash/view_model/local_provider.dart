import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleProvider extends ChangeNotifier {
  Locale _locale = const Locale('en'); // Default to English
  static const String _languageKey = 'preferred_language';

  Locale get locale => _locale;

  LocaleProvider() {
    _loadPreferredLanguage();
  }

  void setLocale(Locale locale) async {
    _locale = locale;
    notifyListeners();
    await _savePreferredLanguage(locale.languageCode);
  }

  Future<void> _loadPreferredLanguage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? languageCode = prefs.getString(_languageKey);
    if (languageCode != null) {
      _locale = Locale(languageCode);
      notifyListeners();
    }
  }

  Future<void> _savePreferredLanguage(String languageCode) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, languageCode);
  }
}
