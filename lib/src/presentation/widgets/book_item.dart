import 'package:audio_book/gen/colors.gen.dart';
import 'package:audio_book/src/presentation/base/theme_provider.dart';
import 'package:flutter/material.dart';

class BookItem extends StatelessWidget {
  final String? title;
  final String? author;
  const BookItem({required this.title, this.author, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 160,
            color: Colors.green,
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
