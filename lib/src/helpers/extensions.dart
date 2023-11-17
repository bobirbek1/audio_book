import 'package:audio_book/gen/colors.gen.dart';
import 'package:flutter/material.dart';

extension SnackBarExtension on BuildContext {
  void showSnackBar(String? message) {
    final messanger = ScaffoldMessenger.of(this);
    final snackBar = SnackBar(
      content: Center(
          child: Text(message ?? "Unknown error occured, please try again!")),
      backgroundColor: ColorName.black,
    );
    messanger.clearSnackBars();
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      messanger.showSnackBar(snackBar);
    });
  }
}
