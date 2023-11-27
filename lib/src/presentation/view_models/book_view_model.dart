import 'package:audio_book/src/data/models/book_model/book_model.dart';
import 'package:audio_book/src/presentation/view_models/base_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BookViewModel extends ChangeNotifier {
  final FirebaseFirestore _db;

  BookViewModel(this._db) {
    fetchRecommendedBooks();
    fetchBestSellerBooks();
    fetchLatestBooks();
    fetchTrendingBooks();
  }

  RecommendedBooksState _recommendedBooksState =
      RecommendedBooksState(state: BaseState.initial);

  RecommendedBooksState get recommendedState => _recommendedBooksState;

  BestSellerBooksState _bestSellerBooksState =
      BestSellerBooksState(state: BaseState.initial);

  BestSellerBooksState get bestSellerState => _bestSellerBooksState;

  LatestBooksState _latestBooksState =
      LatestBooksState(state: BaseState.initial);

  LatestBooksState get latestState => _latestBooksState;

  TrendingBooksState _trendingBooksState =
      TrendingBooksState(state: BaseState.initial);

  TrendingBooksState get trendingState => _trendingBooksState;

  BooksByCategoryState _booksByCategoryState =
      BooksByCategoryState(state: BaseState.initial);

  BooksByCategoryState get booksByCategoryState => _booksByCategoryState;

  void fetchRecommendedBooks() async {
    try {
      _recommendedBooksState = RecommendedBooksState(state: BaseState.loading);
      notifyListeners();
      final books = <BookModel>[];
      final data = await _db
          .collection("books")
          .where("is_recommended", isEqualTo: true)
          .orderBy("created_at", descending: true)
          .get();
      for (var doc in data.docs) {
        final book = BookModel.fromJson(doc.data());
        books.add(book);
      }
      print("recommended books: $books");
      _recommendedBooksState =
          RecommendedBooksState(state: BaseState.loaded, books: books);
    } catch (e) {
      print("exception occured while fetching recommended books: $e");
      _recommendedBooksState = RecommendedBooksState(
          state: BaseState.error,
          error: "Unknown error occurred while fetching recommended books");
    } finally {
      notifyListeners();
    }
  }

  void fetchBestSellerBooks() async {
    try {
      _bestSellerBooksState = BestSellerBooksState(state: BaseState.loading);
      notifyListeners();
      final books = <BookModel>[];
      final data = await _db
          .collection("books")
          .where("is_best_seller", isEqualTo: true)
          .orderBy("created_at", descending: true)
          .get();
      for (var doc in data.docs) {
        final book = BookModel.fromJson(doc.data());
        books.add(book);
      }
      print("best seller books: $books");
      _bestSellerBooksState =
          BestSellerBooksState(state: BaseState.loaded, books: books);
    } catch (e) {
      print("exception occured while fetching best seller books: $e");
      _bestSellerBooksState = BestSellerBooksState(
          state: BaseState.error,
          error: "Unknown error occurred while fetching best seller books");
    } finally {
      notifyListeners();
    }
  }

  void fetchLatestBooks() async {
    try {
      _latestBooksState = LatestBooksState(state: BaseState.loading);
      notifyListeners();
      final books = <BookModel>[];
      final data = await _db
          .collection("books")
          .orderBy("created_at", descending: true)
          .get();
      for (var doc in data.docs) {
        final book = BookModel.fromJson(doc.data());
        books.add(book);
      }
      print("latest books: $books");
      _latestBooksState =
          LatestBooksState(state: BaseState.loaded, books: books);
    } catch (e) {
      print("exception occured while fetching latest books: $e");
      _latestBooksState = LatestBooksState(
          state: BaseState.error,
          error: "Unknown error occurred while fetching latest books");
    } finally {
      notifyListeners();
    }
  }

  void fetchTrendingBooks() async {
    try {
      _trendingBooksState = TrendingBooksState(state: BaseState.loading);
      notifyListeners();
      final books = <BookModel>[];
      final data = await _db
          .collection("books")
          .where("is_trending", isEqualTo: true)
          .orderBy("created_at", descending: true)
          .get();
      for (var doc in data.docs) {
        final book = BookModel.fromJson(doc.data());
        books.add(book);
      }
      print("trending books: $books");
      _trendingBooksState =
          TrendingBooksState(state: BaseState.loaded, books: books);
    } catch (e) {
      print("exception occured while fetching trending books: $e");
      _trendingBooksState = TrendingBooksState(
          state: BaseState.error,
          error: "Unknown error occurred while fetching trending books");
    } finally {
      notifyListeners();
    }
  }

  void fetchBooksByCategory(String categoryId) async {
    try {
      _booksByCategoryState = BooksByCategoryState(state: BaseState.loading);
      notifyListeners();
      final books = <BookModel>[];
      final data = await _db
          .collection("books")
          .where("categories", arrayContains: categoryId)
          .orderBy("created_at", descending: true)
          .get();
      for (var doc in data.docs) {
        final book = BookModel.fromJson(doc.data());
        books.add(book);
      }
      print("books by category: $books");
      _booksByCategoryState =
          BooksByCategoryState(state: BaseState.loaded, books: books);
    } catch (e) {
      print("exception occured while fetching books by category: $e");
      _booksByCategoryState = BooksByCategoryState(
          state: BaseState.error,
          error: "Unknown error occurred while fetching books by category");
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

class BestSellerBooksState {
  final BaseState state;
  final List<BookModel>? books;
  final String? error;
  BestSellerBooksState({required this.state, this.books, this.error});
}

class LatestBooksState {
  final BaseState state;
  final List<BookModel>? books;
  final String? error;
  LatestBooksState({required this.state, this.books, this.error});
}

class TrendingBooksState {
  final BaseState state;
  final List<BookModel>? books;
  final String? error;
  TrendingBooksState({required this.state, this.books, this.error});
}

class BooksByCategoryState {
  final BaseState state;
  final List<BookModel>? books;
  final String? error;
  BooksByCategoryState({required this.state, this.books, this.error});
}
