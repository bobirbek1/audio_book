import 'package:audio_book/src/data/models/book_model/book_model.dart';
import 'package:audio_book/src/helpers/extensions.dart';
import 'package:audio_book/src/presentation/widgets/book_item.dart';
import 'package:audio_book/src/services/navigator_service.dart';
import 'package:flutter/material.dart';

class BooksGrid extends StatelessWidget {
  final List<BookModel> books;
  final EdgeInsets? padding;
  final bool shrinkWrap;
  final void Function(BookModel book)? onPressed;
  const BooksGrid(
      {required this.books,
      this.padding,
      this.shrinkWrap = false,
      this.onPressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    final snackbarPadding = context.getSnackbarPadding();
    return books.isEmpty
        ? const Center(
            child: Text("No books found"),
          )
        : GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 16 / 21,
            ),
            shrinkWrap: shrinkWrap,
            physics: shrinkWrap ? const NeverScrollableScrollPhysics() : null,
            padding: padding?.copyWith(bottom: padding!.bottom + snackbarPadding) ??
                EdgeInsets.only(left: 20, top: 16,right: 20,bottom: snackbarPadding + 16),
            itemCount: books.length,
            itemBuilder: (ctx, index) {
              final book = books[index];
              return BookItem(
                title: book.name,
                imageUrl: book.photo,
                author: book.author,
                width: double.infinity,
                onPressed: () {
                  if (onPressed != null) {
                    onPressed!(book);
                  }
                  Navigator.push(
                    context,
                    generateRoute(
                      Pages.bookDetailPage,
                      argument: {"id": book.id, "name": book.name},
                    ),
                  );
                },
              );
            },
          );
  }
}
