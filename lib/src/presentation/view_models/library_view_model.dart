import 'package:audio_book/src/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LibraryViewModel extends ChangeNotifier {
  final Box<BookModel> _box;

  LibraryViewModel(this._box);

  void addBookToLibrary(BookModel? book) async {
    if (book == null) return;
    final books = getLibraryBooks();
    for (var b in books) {
      if (book == b) {
        return;
      }
    }
    await _box.add(book);
  }

  List<BookModel> getLibraryBooks() {
    return _box.values.toList();
  }
}
