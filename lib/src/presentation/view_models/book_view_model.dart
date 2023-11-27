import 'package:audio_book/src/data/models/book_model/book_model.dart';
import 'package:audio_book/src/presentation/view_models/base_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BookViewModel extends ChangeNotifier {
  final FirebaseFirestore _db;

  BookViewModel(this._db) {
    fetchRecommendedBooks();
  }

  List<BookModel> _recommendedBooks = [];

  List<BookModel> get recommendedBooks => _recommendedBooks;

  RecommendedBooksState _recommendedBooksState =
      RecommendedBooksState(state: BaseState.initial);

  RecommendedBooksState get recommendedState => _recommendedBooksState;

  void fetchRecommendedBooks() async {
    try {
      _recommendedBooksState = RecommendedBooksState(state: BaseState.loading);
      notifyListeners();
      final books = <BookModel>[];
      final data = await _db
          .collection("books")
          .where("is_recommended", isEqualTo: true)
          .orderBy("created_at",descending: true)
          .get();
      for (var doc in data.docs) {
        final book = BookModel.fromJson(doc.data());
        books.add(book);
      }
      _recommendedBooks = books;
      print("recommended books: $_recommendedBooks");
      _recommendedBooksState = RecommendedBooksState(
          state: BaseState.loaded, books: _recommendedBooks);
    } catch (e) {
      print("exception occured while fetching recommended books: $e");
      _recommendedBooksState = RecommendedBooksState(
          state: BaseState.error,
          error: "Unknown error occurred while fetching recommended books");
    } finally {
      notifyListeners();
    }
  }
}

class RecommendedBooksState {
  final BaseState state;
  final List<BookModel>? books;
  final String? error;
  RecommendedBooksState({required this.state, this.books, this.error});
}
