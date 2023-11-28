import 'package:audio_book/src/data/models/category_model/category_model.dart';
import 'package:audio_book/src/presentation/view_models/base_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CategoryViewModel extends ChangeNotifier {
  final FirebaseFirestore _db;

  CategoryViewModel(this._db) {
    fetchCategories();
  }

  var _categories = <CategoryModel>[];

  List<CategoryModel> get categories => _categories;

  CategoryState _state = CategoryState(state: BaseState.initial);

  CategoryState get state => _state;

  void fetchCategories() async {
    try {
      _state = CategoryState(state: BaseState.loading);
      notifyListeners();
      final ctgs = <CategoryModel>[];
      final res = await _db.collection("categories").get();
      for (var ctg in res.docs) {
        ctgs.add(CategoryModel.fromJson(ctg.data()));
      }
      _categories = ctgs;
      _state = CategoryState(state: BaseState.loaded, categories: categories);
    } catch (e) {
      print("Unknown exception occured while fetching categories: $e");
      _state = CategoryState(
          state: BaseState.error,
          error: "Unknown exception occured while fetching categories");
    } finally {
      notifyListeners();
    }
  }

  List<String> getCategoriesNameByIds(List<String>? ids) {
    if (ids == null || ids.isEmpty) return [];

    final List<String> names = [];
    for (var ctg in categories) {
      if (ids.contains(ctg.id)) {
        names.add(ctg.name ?? "unknown");
      }
    }
    return names;
  }
}

class CategoryState {
  final BaseState state;
  final List<CategoryModel>? categories;
  final String? error;
  CategoryState({
    required this.state,
    this.categories = const [],
    this.error,
  });
}
