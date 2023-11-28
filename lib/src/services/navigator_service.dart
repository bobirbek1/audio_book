import 'package:audio_book/src/presentation/pages/book_detail/book_detail_page.dart';
import 'package:audio_book/src/presentation/pages/books_list_pages/best_seller_books_page.dart';
import 'package:audio_book/src/presentation/pages/books_list_pages/books_by_category_page.dart';
import 'package:audio_book/src/presentation/pages/books_list_pages/latest_books_page.dart';
import 'package:audio_book/src/presentation/pages/books_list_pages/recommended_books_page.dart';
import 'package:audio_book/src/presentation/pages/books_list_pages/trending_books_page.dart';
import 'package:audio_book/src/presentation/pages/forget_password/forget_password_email.dart';
import 'package:audio_book/src/presentation/pages/forget_password/forget_password_finish.dart';
import 'package:audio_book/src/presentation/pages/main_page/main_page.dart';
import 'package:audio_book/src/presentation/pages/on_boarding/on_boarding_page.dart';
import 'package:audio_book/src/presentation/pages/sign_in/sign_in_page.dart';
import 'package:audio_book/src/presentation/pages/sign_up/sign_up_page.dart';
import 'package:audio_book/src/presentation/view_models/forget_password_view_model.dart';
import 'package:audio_book/src/presentation/view_models/sign_in_view_model.dart';
import 'package:audio_book/src/presentation/view_models/sign_up_view_model.dart';
import 'package:audio_book/src/services/injection_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum Pages {
  onBoarding,
  signIn,
  signUp,
  forgetPasswordEmail,
  forgetPasswordFinish,
  mainPage,
  recommendedBooksPage,
  bestSellerBooksPage,
  latestBooksPage,
  trendingBooksPage,
  booksByCategoryPage,
  bookDetailPage,
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
        return ChangeNotifierProvider(
          create: (context) => SignInViewModel(getIt.get(),getIt.get()),
          builder: (context, child) => child!,
          child: const SignInPage(),);
      });
    case Pages.signUp:
      return _buildMaterialRoute(
          RouteSettings(name: page.name, arguments: argument), (context) {
        return ChangeNotifierProvider(
          create: (context) => SignUpViewModel(getIt.get()),
          builder: (context, child) => child!,
          child: const SignUpPage(),);
      });
    case Pages.forgetPasswordEmail:
      return _buildMaterialRoute(
          RouteSettings(name: page.name, arguments: argument), (context) {
        return ChangeNotifierProvider(
          create: (context) => ForgetPasswordViewModel(getIt.get()),
          builder: (context, child) => child!,
          child: const ForgetPasswordEmail(),);
      });
    case Pages.forgetPasswordFinish:
      return _buildMaterialRoute(
          RouteSettings(name: page.name, arguments: argument), (context) {
        return const ForgetPasswordFinish();
      });
    case Pages.mainPage:
      return _buildMaterialRoute(
          RouteSettings(name: page.name, arguments: argument), (context) {
        return const MainPage();
      });
    case Pages.recommendedBooksPage:
      return _buildMaterialRoute(
          RouteSettings(name: page.name, arguments: argument), (context) {
        return const RecommendedBooksPage();
      });
    case Pages.bestSellerBooksPage:
      return _buildMaterialRoute(
          RouteSettings(name: page.name, arguments: argument), (context) {
        return const BestSellerBooksPage();
      });
    case Pages.latestBooksPage:
      return _buildMaterialRoute(
          RouteSettings(name: page.name, arguments: argument), (context) {
        return const LatestBooksPage();
      });
    case Pages.trendingBooksPage:
      return _buildMaterialRoute(
          RouteSettings(name: page.name, arguments: argument), (context) {
        return const TrendingBooksPage();
      });
    case Pages.booksByCategoryPage:
      return _buildMaterialRoute(
          RouteSettings(name: page.name, arguments: argument), (context) {
        return const BooksByCategoryPage();
      });
    case Pages.bookDetailPage:
      return _buildMaterialRoute(
          RouteSettings(name: page.name, arguments: argument), (context) {
        return const BookDetailPage();
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
