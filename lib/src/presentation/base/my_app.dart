import 'package:audio_book/src/presentation/base/theme_provider.dart';
import 'package:audio_book/src/presentation/pages/splash/splash_page.dart';
import 'package:audio_book/src/presentation/view_models/book_view_model.dart';
import 'package:audio_book/src/presentation/view_models/category_view_model.dart';
import 'package:audio_book/src/presentation/view_models/comment_view_model.dart';
import 'package:audio_book/src/presentation/view_models/library_view_model.dart';
import 'package:audio_book/src/presentation/view_models/player_view_model.dart';
import 'package:audio_book/src/presentation/view_models/user_view_model.dart';
import 'package:audio_book/src/services/injection_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(
            create: (context) => UserViewModel(
                getIt.get(),
                getIt.get(),
                getIt.get(),
                getIt.get(),
                getIt.get(),
                getIt.get(),
                getIt.get(instanceName: "library_books"))),
        ChangeNotifierProvider(
            create: (context) => CategoryViewModel(
                  getIt.get(),
                )),
        ChangeNotifierProvider(
            create: (context) => BookViewModel(
                  getIt.get(),
                )),
        ChangeNotifierProvider(
            create: (context) =>
                PlayerViewModel(getIt.get(), getIt.get(), getIt.get())),
        ChangeNotifierProvider(
            create: (context) => CommentViewModel(getIt.get(), getIt.get())),
        ChangeNotifierProvider(
            create: (context) =>
                LibraryViewModel(getIt.get(instanceName: "library_books"))),
      ],
      builder: (context, child) => MaterialApp(
        title: "Audio book",
        theme: context.watch<ThemeProvider>().current,
        home: const SplashPage(),
      ),
    );
  }
}
