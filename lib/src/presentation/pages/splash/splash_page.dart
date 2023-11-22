import 'dart:async';

import 'package:audio_book/gen/assets.gen.dart';
import 'package:audio_book/gen/colors.gen.dart';
import 'package:audio_book/src/constants/text_styles.dart';
import 'package:audio_book/src/presentation/view_models/user_view_model.dart';
import 'package:audio_book/src/services/navigator_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userVM = context.read<UserViewModel>();
    userVM.init().then((value) {
      if (userVM.userAvailable) {
        Navigator.pushReplacement(
            context,
            generateRoute(
              Pages.mainPage,
            ));
      } else {
        Timer(const Duration(milliseconds: 500), () {
          if (userVM.isFirstOpen) {
            Navigator.pushReplacement(
                context,
                generateRoute(
                  Pages.onBoarding,
                ));
          } else {
            Navigator.pushReplacement(
                context,
                generateRoute(
                  Pages.signIn,
                ));
          }
        });
      }
    });
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Assets.images.logo.svg(width: 160, height: 160),
            Text(
              "version: 1.0",
              style: TextStyles.regular14.copyWith(color: ColorName.primary50),
            )
          ],
        ),
      ),
    );
  }
}
