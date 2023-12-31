import 'package:audio_book/gen/colors.gen.dart';
import 'package:audio_book/src/presentation/base/theme_provider.dart';
import 'package:audio_book/src/presentation/widgets/regular_cached_image.dart';
import 'package:flutter/material.dart';

class BookItem extends StatelessWidget {
  final String? title;
  final String? author;
  final String? imageUrl;
  final double? width;
  final double? height;
  final VoidCallback? onPressed;
  const BookItem(
      {required this.title,
      required this.imageUrl,
      this.author,
      this.width,
      this.height,
      this.onPressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        width: width,
        height: height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: RegularCachedImage(
                imageUrl: imageUrl,
                width: width,
                height: height,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              title ?? "No title",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textStyles.medium16,
            ),
            if (author != null)
              Text(
                author!,
                maxLines: 1,
                style: Theme.of(context)
                    .textStyles
                    .regular12
                    .copyWith(color: ColorName.primary50),
              ),
          ],
        ),
      ),
    );
  }
}
