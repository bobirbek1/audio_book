import 'package:audio_book/gen/colors.gen.dart';
import 'package:audio_book/src/presentation/base/theme_provider.dart';
import 'package:audio_book/src/presentation/widgets/regular_cached_image.dart';
import 'package:flutter/material.dart';

class BookItemHorizontal extends StatelessWidget {
  final String? bookName;
  final String? bookAuthor;
  final String? image;
  final VoidCallback? onPressed;
  const BookItemHorizontal(
      {this.bookName, this.bookAuthor, this.image,this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        children: [
          const SizedBox(
            width: 8,
          ),
          RegularCachedImage(
            imageUrl: image,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
            isSquare: true,
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                bookName ?? "No name available",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textStyles.medium16,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                bookAuthor ?? "Unknown",
                style: Theme.of(context).textStyles.regular12.copyWith(
                      color: ColorName.primary50,
                    ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
