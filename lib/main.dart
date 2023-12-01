import 'package:audio_book/src/data/models/book_model/book_model.dart';
import 'package:audio_book/src/presentation/base/my_app.dart';
import 'package:audio_book/src/services/injection_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  await Hive.initFlutter();

  Hive.registerAdapter(BookModelAdapter());
  Hive.registerAdapter(AudioModelAdapter());

  await setUp();

  getIt.get<CacheManager>().emptyCache();

  runApp(const MyApp());
}
