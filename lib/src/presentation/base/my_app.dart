import 'package:audio_book/gen/colors.gen.dart';
import 'package:audio_book/src/presentation/pages/splash/splash_page.dart';
import 'package:audio_book/src/presentation/view_models/user_view_model.dart';
import 'package:audio_book/src/services/injection_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserViewModel(getIt.get(),getIt.get()),
      builder: (context, child) => child!,
      child: MaterialApp(
        title: "Audio book",
        theme: ThemeData(
          brightness: Brightness.light,
          fontFamily: GoogleFonts.poppins().fontFamily,
          scaffoldBackgroundColor: ColorName.white,
        ),
        home: const SplashPage(),
      ),
    );
  }
}
