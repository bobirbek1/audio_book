import 'package:audio_book/src/constants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CommentViewModel extends ChangeNotifier {
  final FirebaseFirestore _db;
  final Box _box;

  CommentViewModel(this._db, this._box);

  String? _bookId;

  String? get bookId => _bookId;

  int? _rating;
  int? get rating => _rating;
  set rating(int? value) => _rating = value;

  final _commentController = TextEditingController();
  TextEditingController get commentController => _commentController;

  Future<bool> shouldUserComment(String userId) async {
    if (userId.isEmpty) return false;
    try {
      var counts = _getCountsFromLocal();
      for (var count in counts) {
        if (count["count"] >= 1) {
          final userCommented = await _isUserCommented(count["id"], userId);
          if (!userCommented) {
            _bookId = count["id"];
            return true;
          }
        }
      }
    } catch (e) {
      print("exception occured while checking user should comment or not: $e");
    }
    return false;
  }

  Future<void> addComment(
    String userId,
    String? userImage,
    String? userName,
    String bookId,
  ) async {
    if (bookId.isEmpty || userId.isEmpty) {
      return;
    }
    try {
      final data = {
        "user_id": userId,
        "comment": commentController.text,
        "rating": rating,
        "user_image": userImage,
        "user_name": userName,
      };

      final col = _db.collection("books/$bookId/comments");
      final doc = await col.add(data);
      await doc.update({"id": doc.id});
    } catch (e) {
      print("exception occured while adding comment: $e");
    }
  }

  Future<bool> _isUserCommented(String bookId, String userId) async {
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

  List<Map> _getCountsFromLocal() {
    var counts = _box.get(Constants.keyBookEnterCounts) as List?;
    var result = counts?.cast<Map>();
    result ??= <Map>[];
    return result;
  }

  void incrementCount(String bookId) async {
    if (bookId.isEmpty) return;
    try {
      var counts = _getCountsFromLocal();
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
