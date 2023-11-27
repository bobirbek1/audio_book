import 'package:audio_book/gen/colors.gen.dart';
import 'package:audio_book/src/presentation/base/theme_provider.dart';
import 'package:audio_book/src/presentation/widgets/regular_cached_image.dart';
import 'package:flutter/material.dart';

class BookItem extends StatelessWidget {
  final String? title;
  final String? author;
  final String? imageUrl;
  const BookItem(
      {required this.title, required this.imageUrl, this.author, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RegularCachedImage(
            imageUrl: imageUrl,
            width: 160,
            height: 160,
            fit: BoxFit.cover,
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
    );
  }
}
