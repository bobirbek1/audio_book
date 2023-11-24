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
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorName.primary50,
          minimumSize: const Size.fromHeight(56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              8,
            ),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: ColorName.primary50,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              8,
            ),
          ),
          side: const BorderSide(
            color: ColorName.primary50,
            width: 1,
          ),
          minimumSize: const Size.fromHeight(
            56,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              8,
            ),
          ),
          minimumSize: const Size.fromHeight(56),
          foregroundColor: ColorName.primary50,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
          hintStyle: LightTextStyles().medium14.copyWith(
                color: ColorName.neutral40,
              ),
          fillColor: ColorName.neutral5,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          )),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: ColorName.white,
        elevation: 8,
        selectedItemColor: ColorName.primary50,
        unselectedItemColor: ColorName.neutral60,
        selectedLabelStyle: LightTextStyles().semiBold10.copyWith(
              color: ColorName.primary50,
            ),
        unselectedLabelStyle: LightTextStyles().regular10.copyWith(
              color: ColorName.neutral60,
            ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: LightTextStyles().medium16,
      )
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
  TextStyles get textStyles =>
      brightness == Brightness.light ? LightTextStyles() : DarkTextStyles();
}
