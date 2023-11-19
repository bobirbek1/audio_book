import 'package:audio_book/src/presentation/view_models/base_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInViewModel extends ChangeNotifier {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  bool _isFieldsValid = false;

  bool get isFieldsValid => _isFieldsValid;

  set isFieldsValid(bool value) => _isFieldsValid = value;

  SignInState _state = SignInState(state: BaseState.initial);

  SignInState get state => _state;

  void signIn() async {
    if (!_isFieldsValid) return;
    try {
      _state = SignInState(state: BaseState.loading);
      notifyListeners();
      final userCredentials =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailCtrl.text,
        password: passCtrl.text,
      );
      print("user signed in: ${userCredentials.user}");
      _state = SignInState(state: BaseState.loaded, user: userCredentials.user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        _state = SignInState(
            state: BaseState.error, error: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        _state = SignInState(
            state: BaseState.error,
            error: 'Wrong password provided for that user.');
      } else {
        print("Email or password is incorrect, please try again!");
        _state = SignInState(
            state: BaseState.error,
            error: "Email or password is incorrect, please try again!");
      }
    } catch (e) {
      print("Unknown exception occurred, please try again!");
      _state = SignInState(
          state: BaseState.error,
          error: "Unknown exception occurred, please try again!");
    } finally {
      notifyListeners();
    }
  }
}

class SignInState {
  final BaseState state;
  final User? user;
  final String? error;

  SignInState({required this.state, this.user, this.error});
}
