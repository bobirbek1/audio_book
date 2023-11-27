import 'package:audio_book/gen/assets.gen.dart';
import 'package:audio_book/src/helpers/extensions.dart';
import 'package:audio_book/src/presentation/view_models/base_state.dart';
import 'package:audio_book/src/presentation/view_models/book_view_model.dart';
import 'package:audio_book/src/presentation/widgets/books_grid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BooksByCategoryPage extends StatelessWidget {
  const BooksByCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final argument = context.getArguments<Map<String, dynamic>?>();
    Future.microtask(() {
      context
          .read<BookViewModel>()
          .fetchBooksByCategory(argument?["category_id"] ?? "");
    });
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          iconSize: 24,
          icon: Assets.icons.arrowLeft.svg(),
        ),
        title: Text(argument?["category"] ?? ""),
        centerTitle: true,
      ),
      body: Consumer<BookViewModel>(
        builder: (ctx, vm, child) {
          return switch (vm.booksByCategoryState.state) {
            BaseState.loading => child!,
            BaseState.loaded => BooksGrid(
                books: vm.booksByCategoryState.books ?? [],
              ),
            BaseState.error => const Center(
                child: Text("No books found"),
              ),
            _ => const SizedBox(),
          };
        },
        child: const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      ),
    );
  }
}
