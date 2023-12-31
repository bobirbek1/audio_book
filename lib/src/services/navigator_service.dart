import 'package:audio_book/src/presentation/pages/book_detail/book_detail_page.dart';
import 'package:audio_book/src/presentation/pages/books_list_pages/best_seller_books_page.dart';
import 'package:audio_book/src/presentation/pages/books_list_pages/books_by_category_page.dart';
import 'package:audio_book/src/presentation/pages/books_list_pages/latest_books_page.dart';
import 'package:audio_book/src/presentation/pages/books_list_pages/recommended_books_page.dart';
import 'package:audio_book/src/presentation/pages/books_list_pages/trending_books_page.dart';
import 'package:audio_book/src/presentation/pages/comments_page/comments_page.dart';
import 'package:audio_book/src/presentation/pages/forget_password/forget_password_email.dart';
import 'package:audio_book/src/presentation/pages/forget_password/forget_password_finish.dart';
import 'package:audio_book/src/presentation/pages/main_page/main_page.dart';
import 'package:audio_book/src/presentation/pages/on_boarding/on_boarding_page.dart';
import 'package:audio_book/src/presentation/pages/player_page/player_page.dart';
import 'package:audio_book/src/presentation/pages/settings_page/profile_page.dart';
import 'package:audio_book/src/presentation/pages/settings_page/settings_page.dart';
import 'package:audio_book/src/presentation/pages/reading_page/reading_page.dart';
import 'package:audio_book/src/presentation/pages/sign_in/sign_in_page.dart';
import 'package:audio_book/src/presentation/pages/sign_up/sign_up_page.dart';
import 'package:audio_book/src/presentation/view_models/forget_password_view_model.dart';
import 'package:audio_book/src/presentation/view_models/sign_in_view_model.dart';
import 'package:audio_book/src/presentation/view_models/sign_up_view_model.dart';
import 'package:audio_book/src/services/injection_service.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
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
  readingPage,
  playerPage,
  commentsPage,
  settingsPage,
  profilePage,
}

Route generateRoute(Pages page,
    {Object? argument}) {
  switch (page) {
    case Pages.onBoarding:
      return _buildRoute(
        RouteSettings(name: page.name, arguments: argument),
        (context) {
          return const OnBoardingPage();
        },
      );
    case Pages.signIn:
      return _buildRoute(
        RouteSettings(name: page.name, arguments: argument),
        (context) {
          return ChangeNotifierProvider(
            create: (context) => SignInViewModel(getIt.get(), getIt.get()),
            builder: (context, child) => child!,
            child: const SignInPage(),
          );
        },
      );
    case Pages.signUp:
      return _buildRoute(
        RouteSettings(name: page.name, arguments: argument),
        (context) {
          return ChangeNotifierProvider(
            create: (context) => SignUpViewModel(getIt.get()),
            builder: (context, child) => child!,
            child: const SignUpPage(),
          );
        },
      );
    case Pages.forgetPasswordEmail:
      return _buildRoute(
        RouteSettings(name: page.name, arguments: argument),
        (context) {
          return ChangeNotifierProvider(
            create: (context) => ForgetPasswordViewModel(getIt.get()),
            builder: (context, child) => child!,
            child: const ForgetPasswordEmail(),
          );
        },
      );
    case Pages.forgetPasswordFinish:
      return _buildRoute(
        RouteSettings(name: page.name, arguments: argument),
        (context) {
          return const ForgetPasswordFinish();
        },
      );
    case Pages.mainPage:
      return _buildRoute(
        RouteSettings(name: page.name, arguments: argument),
        (context) {
          return const MainPage();
        },
      );
    case Pages.recommendedBooksPage:
      return _buildRoute(
        RouteSettings(name: page.name, arguments: argument),
        (context) {
          return const RecommendedBooksPage();
        },
      );
    case Pages.bestSellerBooksPage:
      return _buildRoute(
        RouteSettings(name: page.name, arguments: argument),
        (context) {
          return const BestSellerBooksPage();
        },
      );
    case Pages.latestBooksPage:
      return _buildRoute(
        RouteSettings(name: page.name, arguments: argument),
        (context) {
          return const LatestBooksPage();
        },
      );
    case Pages.trendingBooksPage:
      return _buildRoute(
        RouteSettings(name: page.name, arguments: argument),
        (context) {
          return const TrendingBooksPage();
        },
      );
    case Pages.booksByCategoryPage:
      return _buildRoute(
        RouteSettings(name: page.name, arguments: argument),
        (context) {
          return const BooksByCategoryPage();
        },
      );
    case Pages.bookDetailPage:
      return _buildRoute(
        RouteSettings(name: page.name, arguments: argument),
        (context) {
          return const BookDetailPage();
        },
      );
    case Pages.readingPage:
      return _buildRoute(
        RouteSettings(name: page.name, arguments: argument),
        (context) {
          return ReadingPage(dcm: getIt.get(), box: getIt.get());
        },
      );
    case Pages.playerPage:
      return _buildPageTransition(
              RouteSettings(name: page.name, arguments: argument),
              PageTransitionType.bottomToTop,
              const PlayerPage());
    case Pages.commentsPage:
      return _buildRoute(
        RouteSettings(name: page.name, arguments: argument),
        (context) {
          return const CommentsPage();
        },
      );
    case Pages.settingsPage:
      return _buildRoute(
        RouteSettings(name: page.name, arguments: argument),
        (context) {
          return const SettingsPage();
        },
      );
    case Pages.profilePage:
      return _buildRoute(RouteSettings(name: page.name, arguments: argument),
          (context) {
        return const ProfilePage();
      });
    default:
      return _buildRoute(RouteSettings(name: "unKnown", arguments: argument),
          (context) {
        return Container();
      });
  }
}

Route _buildPageTransition(
    RouteSettings setting, PageTransitionType type, Widget child) {
  return PageTransition(
      child: child, type: type, curve: Curves.ease, settings: setting);
}

Route _buildRoute(
    RouteSettings routeSettings, Widget Function(BuildContext) builder) {
  return MaterialPageRoute(builder: builder, settings: routeSettings);
}
