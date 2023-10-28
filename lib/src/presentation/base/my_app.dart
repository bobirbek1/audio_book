




import 'package:audio_book/gen/colors.gen.dart';
import 'package:audio_book/src/presentation/pages/on_boarding/on_boarding_page.dart';
import 'package:audio_book/src/presentation/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Audio book",
      theme: ThemeData(
        brightness: Brightness.light,
        fontFamily: GoogleFonts.poppins().fontFamily,
        scaffoldBackgroundColor: ColorName.white,
      ),
      home: const OnBoardingPage(),
    );
  }
}





