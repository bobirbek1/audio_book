import 'package:audio_book/src/data/models/user_model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel extends ChangeNotifier {
  UserViewModel(this._db, this._prefs);

  Future<void> init() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await getUser(user.uid);
    }
    _isFirstOpen = _prefs.getBool(
          "is_first_open",
        ) ??
        true;
  }

  final _nameCtrl = TextEditingController();
  TextEditingController get nameCtrl => _nameCtrl;
  final _emailCtrl = TextEditingController();
  TextEditingController get emailCtrl => _emailCtrl;
  final _phoneCtrl = TextEditingController();
  TextEditingController get phoneCtrl => _phoneCtrl;
  final _birthDateCtrl = TextEditingController();
  TextEditingController get birthDateCtrl => _birthDateCtrl;

  final FirebaseFirestore _db;

  final SharedPreferences _prefs;

  bool _isFirstOpen = true;

  bool get isFirstOpen => _isFirstOpen;

  bool get userAvailable => _user != null;

  UserModel? _user;

  UserModel? get user => _user;

  String? _currentPickedImage;
  String? get currentPickedImage => _currentPickedImage;
  set currentPickedImage(String? value) {
    _currentPickedImage = value;
    notifyListeners();
  }

  void initTextControllers() {
    print("user information: $user");
    _nameCtrl.text = user?.fullName ?? "";
    _emailCtrl.text = user?.email ?? "";
    _phoneCtrl.text = user?.phone ?? "";
    _birthDateCtrl.text = user?.birthDate ?? "";
  }

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
