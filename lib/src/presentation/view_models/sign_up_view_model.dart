import 'package:audio_book/src/presentation/view_models/base_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpViewModel extends ChangeNotifier {
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  bool _isFieldValid = false;

  bool get isFieldValid => _isFieldValid;

  set isFieldValid(bool value) => _isFieldValid = value;

  SignUpState _state = SignUpState(state: BaseState.initial);

  SignUpState get state => _state;

  void signUp() async {
    if (!_isFieldValid) return;
    try {
      _state = SignUpState(state: BaseState.loading);
      notifyListeners();
      final user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailCtrl.text, password: passCtrl.text);
      print("user created: ${user.user?.email}");
      _state = SignUpState(state: BaseState.loaded, user: user.user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        _state = SignUpState(
            state: BaseState.error,
            error: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        _state = SignUpState(
            state: BaseState.error,
            error: 'The account already exists for that email.');
      }else {
        print('Unknown error occurred, please try again!');
        _state = SignUpState(
            state: BaseState.error,
            error: "Unknown error occurred, please try again!");
      }
    } catch (e) {
      print("Failed to sign up: $e");
      _state = SignUpState(
          state: BaseState.error,
          error: 'Unknown error occurred, please try again!');
    } finally {
      notifyListeners();
    }
  }
}

class SignUpState {
  final BaseState state;
  final User? user;
  final String? error;
  SignUpState({required this.state, this.user, this.error});
}
