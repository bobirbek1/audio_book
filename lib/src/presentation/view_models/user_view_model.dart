import 'package:audio_book/src/data/models/user_model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel extends ChangeNotifier {
  Future<void> init() async {
    _db = FirebaseFirestore.instance;
    _prefs = await SharedPreferences.getInstance();

    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await getUser(user.uid);
    }
    _isFirstOpen = _prefs.getBool(
          "is_first_open",
        ) ??
        true;
  }

  late FirebaseFirestore _db;

  late SharedPreferences _prefs;

  bool _isFirstOpen = true;

  bool get isFirstOpen => _isFirstOpen;

  bool get userAvailable => _user != null;

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
      final userDoc = await doc.get();
      if (userDoc.exists && userDoc.data() != null) {
        _user = UserModel.fromJson(userDoc.data()!);
      }
      print("user data => $_user");
    } catch (e) {
      print("Unknown exception occured, e: $e");
    }
  }

 Future<void> makeUserNotFirst() async {
    await _prefs.setBool("is_first_open", false);
  }
}
