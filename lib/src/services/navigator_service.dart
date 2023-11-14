import 'package:audio_book/src/presentation/pages/on_boarding/on_boarding_page.dart';
import 'package:audio_book/src/presentation/pages/sign_in/sign_in_page.dart';
import 'package:audio_book/src/presentation/pages/sign_up/sign_up_page.dart';
import 'package:flutter/material.dart';

enum Pages {
  onBoarding,
  signIn,
  signUp,
}

Route generateRoute(Pages page, {Object? argument}) {
  switch (page) {
    case Pages.onBoarding:
      return _buildMaterialRoute(
          RouteSettings(name: page.name, arguments: argument), (context) {
        return const OnBoardingPage();
      });
    case Pages.signIn:
      return _buildMaterialRoute(
          RouteSettings(name: page.name, arguments: argument), (context) {
        return const SignInPage();
      });
    case Pages.signUp:
      return _buildMaterialRoute(
          RouteSettings(name: page.name, arguments: argument), (context) {
        return const SignUpPage();
      });
    default:
      return _buildMaterialRoute(
          RouteSettings(name: "unKnown", arguments: argument), (context) {
        return Container();
      });
  }
}

Route _buildMaterialRoute(
  RouteSettings routeSettings,
  Widget Function(BuildContext) builder,
) {
  return MaterialPageRoute(builder: builder, settings: routeSettings);
}
