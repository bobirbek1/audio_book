import 'package:audio_book/src/presentation/view_models/base_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInViewModel extends ChangeNotifier {
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;

  SignInViewModel(this._auth, this._googleSignIn);

  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  bool _isFieldsValid = false;

  bool get isFieldsValid => _isFieldsValid;

  set isFieldsValid(bool value) => _isFieldsValid = value;

  SignInState _state = SignInState(state: BaseState.initial);
  SignInState _googleState = SignInState(state: BaseState.initial);

  SignInState get state => _state;
  SignInState get googleState => _googleState;

  void signIn() async {
    if (!_isFieldsValid) return;
    try {
      _state = SignInState(state: BaseState.loading);
      notifyListeners();
      final userCredentials =
          await _auth.signInWithEmailAndPassword(
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

  void signInWithGoogle() async {
    _googleState = SignInState(state: BaseState.loading);
    notifyListeners();
    final credential = await _fetchGoogleCredentials();
    if (credential == null) {
      notifyListeners();
      return;
    }
    try {
      final user = await _auth.signInWithCredential(credential);
      _googleState = SignInState(state: BaseState.loaded, user: user.user);
      print('google sign in user: $user');
    } on FirebaseAuthException catch (e) {
      print("Sign in with Google failed: ${e.code}");
      _googleState = SignInState(
          state: BaseState.error,
          error: "Sign In with Google failed: ${e.code}");
    } catch (e) {
      print("Unknown exception occurred, please try again!");
      _googleState = SignInState(
          state: BaseState.error,
          error: "Unknown exception occurred, please try again!");
    } finally {
      notifyListeners();
    }
  }

  Future<OAuthCredential?> _fetchGoogleCredentials() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await _googleSignIn
          .signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      return credential;
    } catch (e) {
      print("Google signIn failed: $e");
      _googleState = SignInState(
          state: BaseState.error, error: "Google signIn failed: $e");
      return null;
    }
  }
}

class SignInState {
  final BaseState state;
  final User? user;
  final String? error;

  SignInState({required this.state, this.user, this.error});
}
