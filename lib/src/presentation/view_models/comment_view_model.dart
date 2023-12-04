import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CommentViewModel extends ChangeNotifier {
  final FirebaseFirestore _db;
  final Box _box;

  CommentViewModel(this._db, this._box);

  Future<bool> isUserCommented(String bookId, String userId) async {
    try {
      final collection = _db.collection("books/$bookId/comments");
      final docs =
          await collection.where("user_id", isEqualTo: userId).limit(1).get();
      for (var doc in docs.docs) {
        if (doc.exists) {
          return true;
        }
      }
    } catch (e) {
      print("exception occured while checking user commented or not: $e");
    }
    return false;
  }

  void incrementCount(String bookId) async {
    if (bookId.isEmpty) return;
    try {
      var counts = _box.get("book_enter_counts") as List;
      counts = counts.cast<Map>();
      bool isExist = false;
      for (var i = 0; i < counts.length; i++) {
        if (counts[i]["id"] == bookId) {
          final count = counts[i]["count"];
          counts[i]["count"] = count + 1;
          isExist = true;
          break;
        }
      }
      if (!isExist) {
        counts.add({"id": bookId, "count": 1});
      }
      _box.put("book_enter_counts", counts);
    } catch (e) {
      print("exception occured while increment count: $e");
    }
  }
}
