import 'package:audio_book/src/data/models/user_model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserViewModel extends ChangeNotifier {
  UserViewModel() {
    _db = FirebaseFirestore.instance;
  }

  late FirebaseFirestore _db;

  DocumentSnapshot<Map<String, dynamic>>? _userDoc;

  DocumentSnapshot<Map<String, dynamic>>? get userDoc => _userDoc;

  UserModel? _user;

  UserModel? get user => _user;

  void saveUser(UserModel user) async {
    try {
      final doc = _db.doc("users/${user.uid}");
      await doc.set(user.toJson());
      _user = user;
      print("save user: $user");
    } catch (e) {
      print("Unknown exception occured, e: $e");
    }
  }

  Future<void> getUser(String uid) async {
    try {
      final doc = _db.doc("users/$uid");
      _userDoc = await doc.get();
      if (_userDoc!.exists && _userDoc!.data() != null) {
        _user = UserModel.fromJson(_userDoc!.data()!);
      }
      print("user data => $_user");
    } catch (e) {
      print("Unknown exception occured, e: $e");
    }
  }
}
