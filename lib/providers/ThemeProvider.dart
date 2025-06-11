import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  ThemeData get currentTheme {
    return _isDarkMode
        ? ThemeData.dark().copyWith(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          )
        : ThemeData.light().copyWith(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          );
  }
}
