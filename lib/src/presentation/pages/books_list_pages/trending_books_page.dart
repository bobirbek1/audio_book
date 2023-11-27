






import 'package:audio_book/gen/assets.gen.dart';
import 'package:audio_book/src/presentation/view_models/base_state.dart';
import 'package:audio_book/src/presentation/view_models/book_view_model.dart';
import 'package:audio_book/src/presentation/widgets/books_grid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TrendingBooksPage extends StatelessWidget {
  const TrendingBooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          iconSize: 24,
          icon: Assets.icons.arrowLeft.svg(),
        ),
        title: const Text("Trending"),
        centerTitle: true,
      ),
      body:Consumer<BookViewModel>(
        builder: (ctx, vm, child) {
          return switch (vm.trendingState.state) {
            BaseState.loading => const CircularProgressIndicator.adaptive(),
            BaseState.loaded => BooksGrid(books: vm.trendingState.books ?? []),
            BaseState.error => const Center(child: Text("No trending books found"),),  
            _ => const SizedBox(),
          };
        },
      ),
    );
  }
}