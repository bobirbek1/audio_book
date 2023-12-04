import 'package:audio_book/gen/colors.gen.dart';
import 'package:audio_book/src/presentation/base/theme_provider.dart';
import 'package:audio_book/src/presentation/widgets/rating_bar.dart';
import 'package:audio_book/src/presentation/widgets/regular_cached_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CommentItem extends StatelessWidget {
  final String? userPhoto;
  final String? userName;
  final double? rating;
  final String? createAt;
  final String? comment;
  final int? maxLine;

  const CommentItem(
      {this.userPhoto,
      this.userName,
      this.rating,
      this.createAt,
      this.comment,
      this.maxLine,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: RegularCachedImage(
                imageUrl: userPhoto,
                width: 48,
                height: 48,
                fit: BoxFit.cover,
                isSquare: true,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    userName ?? "No name available",
                    style: Theme.of(context).textStyles.medium14,
                  ),
                  Row(
                    children: [
                      if (rating != null)
                        SizedBox(
                          width: 96,
                          height: 24,
                          child: RatingBar(
                            rating: rating!,
                            size: 16,
                          ),
                        ),
                      if (createAt != null)
                        const SizedBox(
                          width: 16,
                        ),
                      if (createAt != null)
                        Text(
                          _getDate(createAt!),
                          style:
                              Theme.of(context).textStyles.regular10.copyWith(
                                    color: ColorName.neutral50,
                                  ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          comment ?? "No comment",
          maxLines: maxLine,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textStyles.light14.copyWith(
                color: ColorName.neutral60,
              ),
        ),
      ],
    );
  }

  String _getDate(String date) {
    final dateTime = DateTime.parse(date);
    final now = DateTime.now();
    final diff = now.difference(dateTime);
    if (diff.inMinutes < 1) {
      return "a minute ago";
    } else if (diff.inMinutes < 60) {
      return "${diff.inMinutes} minutes ago";
    } else if (diff.inHours < 24) {
      return "${diff.inHours} hours ago";
    } else if (diff.inDays < 7) {
      return "${diff.inDays} days ago";
    } else {
      return DateFormat("dd.MM.yyyy").format(dateTime);
    }
  }
}
