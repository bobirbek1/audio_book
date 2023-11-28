




import 'package:audio_book/src/presentation/base/theme_provider.dart';
import 'package:audio_book/src/presentation/widgets/regular_elevated_button.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  const CategoryItem({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RegularElevatedButton(
      onPressed: onPressed,
      text: text ?? "unknown",
      radius: 12,
      elevation: 0,
      backgroundColor: Theme.of(context).colorScheme.background,
      style: Theme.of(context).textStyles.regular16,
      size: const Size(0, 0),
    );
  }
}



