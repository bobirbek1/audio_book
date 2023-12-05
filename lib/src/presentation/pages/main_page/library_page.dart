import 'package:audio_book/src/helpers/extensions.dart';
import 'package:audio_book/src/presentation/base/theme_provider.dart';
import 'package:audio_book/src/presentation/view_models/library_view_model.dart';
import 'package:audio_book/src/presentation/widgets/book_item_horizontal.dart';
import 'package:audio_book/src/services/navigator_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final books = context.read<LibraryViewModel>().getLibraryBooks();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 40,
          ),
          Text(
            "My Books",
            style: Theme.of(context).textStyles.semiBold24,
          ),
          const SizedBox(
            height: 12,
          ),
          Expanded(
            child: ListView.separated(
              itemCount: books.length,
              padding: EdgeInsets.only(
                top: 16,
                bottom: 16 + context.getSnackbarPadding(),
              ),
              itemBuilder: (ctx, index) {
                final book = books[index];
                return BookItemHorizontal(
                  bookName: book.name,
                  bookAuthor: book.author,
                  image: book.photo,
                  onPressed: () {
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
              separatorBuilder: (ctx, index) {
                return const SizedBox(
                  height: 32,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
