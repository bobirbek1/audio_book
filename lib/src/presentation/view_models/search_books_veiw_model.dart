import 'dart:async';

import 'package:algolia/algolia.dart';
import 'package:audio_book/src/data/models/book_model/book_model.dart';
import 'package:audio_book/src/presentation/view_models/base_state.dart';
import 'package:flutter/material.dart';

class SearchBooksViewModel extends ChangeNotifier {
  final Algolia _algolia;

  SearchBooksViewModel(this._algolia) {
    searchTextCtrl.addListener(searchTextListener);
  }

  final searchTextCtrl = TextEditingController();

  Timer? _timer;

  void searchTextListener() {
    _timer?.cancel();
    _timer = Timer(const Duration(milliseconds: 1000), () {
      if (searchTextCtrl.text.isEmpty) {
        _state = SearchResultState(state: BaseState.initial);
        notifyListeners();
      } else {
        _searchTextFromBooks();
      }
    });
  }

  @override
  void dispose() {
    searchTextCtrl.dispose();
    _timer?.cancel();
    super.dispose();
  }

  SearchResultState _state = SearchResultState(state: BaseState.initial);

  SearchResultState get state => _state;

  void _searchTextFromBooks() async {
    try {
      _state = SearchResultState(state: BaseState.loading);
      notifyListeners();
      final query = _algolia.index("books_index").query(searchTextCtrl.text);
      final snapshot = await query.getObjects();
      final books = <BookModel>[];
      for (var book in snapshot.hits) {
        books.add(BookModel.fromJson(book.data));
      }
      print("search result books: $books");
      _state = SearchResultState(state: BaseState.loaded, books: books);
    } catch (e) {
      print("Unknown exception occurred while searching from books: $e");
      _state = SearchResultState(
          state: BaseState.error,
          error: "Unknown exception occurred while searching from books");
    } finally {
      notifyListeners();
    }
  }
}

class SearchResultState {
  final BaseState state;
  final List<BookModel>? books;
  final String? error;
  SearchResultState({required this.state, this.books, this.error});
}
