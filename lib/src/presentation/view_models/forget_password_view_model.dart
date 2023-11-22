import 'package:audio_book/src/presentation/view_models/base_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgetPasswordViewModel extends ChangeNotifier {
  final FirebaseAuth _auth;

  ForgetPasswordViewModel(this._auth);

  final emailCtrl = TextEditingController();

  bool _isEmailValid = false;

  bool get isEmailValid => _isEmailValid;

  set isEmailValid(bool value) => _isEmailValid = value;

  ForgetPasswordState _state = ForgetPasswordState(state: BaseState.initial);

  ForgetPasswordState get state => _state;

  void sentChangePasswordEmail() async {
    if (!_isEmailValid) return;

    try {
      _state = ForgetPasswordState(state: BaseState.loading);
      notifyListeners();
      await _auth.sendPasswordResetEmail(email: emailCtrl.text);
      _state = ForgetPasswordState(state: BaseState.loaded);
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("User not found");
        _state = ForgetPasswordState(
            state: BaseState.error, error: "User not found");
      } else {
        print("Unknown exception occurred: " + e.code);
        _state = ForgetPasswordState(
            state: BaseState.error,
            error: "Unknown exception occurred, please try again!");
      }
    } catch (e) {
      print("Unknown exception occurred: $e");
      _state = ForgetPasswordState(
          state: BaseState.error,
          error: "Unknown exception occurred, please try again!");
    } finally {
      notifyListeners();
    }
  }
}

class ForgetPasswordState {
  final BaseState state;
  final String? error;
  ForgetPasswordState({required this.state, this.error});
}
