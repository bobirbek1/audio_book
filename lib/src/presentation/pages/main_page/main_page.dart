import 'package:audio_book/src/presentation/base/theme_provider.dart';
import 'package:audio_book/src/presentation/widgets/regular_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RegularElevatedButton(
          onPressed: () {
            context.read<ThemeProvider>().changeTheme();
          },
          text: "Change theme",
        ),
      ),
    );
  }
}
