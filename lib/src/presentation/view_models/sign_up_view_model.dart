import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpViewModel extends ChangeNotifier {
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  bool _isFieldValid = false;

  bool get isFieldValid => _isFieldValid;

  set isFieldValid(bool value) => _isFieldValid = value;

  void signUp() async {
    if (!_isFieldValid) return;
    try {
      final user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailCtrl.text, password: passCtrl.text);
      print("user created: ${user.user?.email}");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print("Failed to sign up: $e");
    }
  }
}
