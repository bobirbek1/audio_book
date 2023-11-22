import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt getIt = GetIt.instance;

Future<void> setUp() async {
  final prefs = await SharedPreferences.getInstance();

  getIt.registerSingleton<SharedPreferences>(prefs);

  getIt.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  getIt.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);

  getIt.registerFactory<GoogleSignIn>(() => GoogleSignIn(
      clientId:
          "861791891738-ofnjunu5djnpv7idj920dk7v16udiqjn.apps.googleusercontent.com"));
}
