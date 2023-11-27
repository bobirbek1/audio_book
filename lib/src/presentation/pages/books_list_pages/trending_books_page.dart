






import 'package:audio_book/gen/assets.gen.dart';
import 'package:audio_book/src/data/models/book_model/book_model.dart';
import 'package:audio_book/src/presentation/widgets/books_grid.dart';
import 'package:flutter/material.dart';

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
      body: BooksGrid(
        books: [BookModel(),BookModel()],
      ),
    );
  }
}