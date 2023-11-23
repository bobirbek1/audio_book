import 'package:audio_book/gen/colors.gen.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeProvider() {
    _current = _light;
  }

  final _light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: ColorName.white,
  );

  final _dark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: ColorName.black,
  );

  late ThemeData _current;

  ThemeData get current => _current;

  void changeTheme() {
    if (_current.brightness == Brightness.light) {
      _current = _dark;
    } else {
      _current = _light;
    }
    notifyListeners();
  }
}
