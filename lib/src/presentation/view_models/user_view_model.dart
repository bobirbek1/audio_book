import 'dart:async';
import 'dart:io';

import 'package:audio_book/src/data/models/book_model/book_model.dart';
import 'package:audio_book/src/data/models/user_model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel extends ChangeNotifier {
  final FirebaseFirestore _db;

  final SharedPreferences _prefs;

  final FirebaseStorage _storage;

  final FirebaseAuth _auth;

  final Box _box;

  final Box<BookModel> _latestSearchBox;

  final Box<BookModel> _libraryBox;

  UserViewModel(this._db, this._prefs, this._storage, this._auth, this._box,
      this._latestSearchBox, this._libraryBox);

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

  DateTime? _pickedDate;
  DateTime? get pickedDate => _pickedDate;
  set pickedDate(DateTime? value) {
    if (value == null) return;
    _pickedDate = value;
    _birthDateCtrl.text = DateFormat("dd.MM.yyyy").format(value);
  }

  void initTextControllers() {
    _nameCtrl.text = user?.fullName ?? "";
    _emailCtrl.text = user?.email ?? "";
    _phoneCtrl.text = user?.phone ?? "";
    if (user?.birthDate != null) {
      final date = DateTime.parse(user!.birthDate!);
      _birthDateCtrl.text = DateFormat("dd.MM.yyyy").format(date);
    }
  }

  Future<bool> logOut() async {
    try {
      await _auth.signOut();
      _user = null;
      _box.clear();
      _latestSearchBox.clear();
      _libraryBox.clear();
      return true;
    } catch (e) {
      print("exception occured while signing out: $e");
      return false;
    }
  }

  Future<void> updateUser() async {
    try {
      var newUser = UserModel(
        uid: user?.uid,
        fullName: _nameCtrl.text.isEmpty ? user?.fullName : _nameCtrl.text,
        birthDate:
            pickedDate != null ? pickedDate!.toString() : user?.birthDate,
        email: user?.email,
        phone: _phoneCtrl.text.isEmpty ? user?.phone : _phoneCtrl.text,
        photo: user?.photo,
      );
      final imageComleter = Completer();
      if (currentPickedImage != null) {
        final fileName = currentPickedImage!.split("/").last;
        final ref = _storage.ref().child("user/${user?.uid}/$fileName");
        ref
            .putFile(
          File(
            currentPickedImage!,
          ),
        )
            .whenComplete(() async {
          newUser = newUser.copyWith(photo: await ref.getDownloadURL());
          imageComleter.complete();
        });
      } else {
        imageComleter.complete();
      }
      await imageComleter.future;
      final doc = _db.doc("users/${user?.uid}");
      await doc.update(newUser.toJson());
      _user = newUser;
    } catch (e) {
      print("exception occured while updating user data: $e");
    } finally {
      notifyListeners();
    }
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

  void removeChanges() {
    _currentPickedImage = null;
    _pickedDate = null;
  }
}
