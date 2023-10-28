import 'package:audio_book/gen/assets.gen.dart';
import 'package:audio_book/gen/colors.gen.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Assets.images.logo.svg(
              width: 160,
              height: 160
            ),
            const Text(
              "version: 1.0",
              style: TextStyle(
                fontSize: 14,
                color: ColorName.primary50,
              ),
            )
          ],
        ),
      ),
    );
  }
}
