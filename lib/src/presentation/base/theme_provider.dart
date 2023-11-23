import 'package:audio_book/gen/colors.gen.dart';
import 'package:audio_book/src/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeProvider() {
    _current = _light;
  }

  final _light = ThemeData(
    brightness: Brightness.light,
    fontFamily: GoogleFonts.poppins().fontFamily,
    scaffoldBackgroundColor: ColorName.white,
  );

  final _dark = ThemeData(
    brightness: Brightness.dark,
    fontFamily: GoogleFonts.poppins().fontFamily,
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

extension TextStylesProvider on ThemeData {
  TextStyles get textStyles => brightness == Brightness.light
      ? LightTextStyles()
      : DarkTextStyles();
}
