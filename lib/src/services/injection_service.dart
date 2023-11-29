import 'package:algolia/algolia.dart';
import 'package:audio_book/src/constants/constants.dart';
import 'package:audio_book/src/data/models/book_model/book_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt getIt = GetIt.instance;

Future<void> setUp() async {
  final prefs = await SharedPreferences.getInstance();
  var algolia = const Algolia.init(
      applicationId: Constants.algoliaApplicationID,
      apiKey: Constants.algoliaApiKey);

  final searchBox = await Hive.openBox<BookModel>("latest_search_books");

  getIt.registerSingleton(algolia.instance);
  getIt.registerSingleton(searchBox);
  getIt.registerSingleton<SharedPreferences>(prefs);

  getIt.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  getIt.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);

  getIt.registerFactory<GoogleSignIn>(() => GoogleSignIn(
      clientId:
          "861791891738-ofnjunu5djnpv7idj920dk7v16udiqjn.apps.googleusercontent.com"));
}
