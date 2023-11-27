import 'package:audio_book/src/data/models/book_model/book_model.dart';
import 'package:audio_book/src/presentation/widgets/book_item.dart';
import 'package:flutter/material.dart';

class BooksGrid extends StatelessWidget {
  final List<BookModel> books;
  final EdgeInsets? padding;
  const BooksGrid({required this.books, this.padding, super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 16 / 21,
      ),
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      itemCount: books.length,
      itemBuilder: (ctx, index) {
        final book = books[index];
        return BookItem(
          title: book.name,
          imageUrl: book.photo,
          author: book.author,
          width: double.infinity,
        );
      },
    );
  }
}
