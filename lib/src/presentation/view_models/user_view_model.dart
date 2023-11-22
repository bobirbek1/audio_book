import 'package:audio_book/src/data/models/user_model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserViewModel extends ChangeNotifier {
  UserViewModel() {
    _db = FirebaseFirestore.instance;
  }

  late FirebaseFirestore _db;

  void saveUser(UserModel user) async {
    try {
      final doc = _db.doc("users/${user.uid}");
      await doc.set(user.toJson());
    } catch (e) {
      print("Unknown exception occured, e: $e");
    }
  }
}
