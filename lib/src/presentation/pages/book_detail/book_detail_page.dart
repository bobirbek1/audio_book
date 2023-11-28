import 'package:audio_book/gen/assets.gen.dart';
import 'package:audio_book/gen/colors.gen.dart';
import 'package:audio_book/src/presentation/base/theme_provider.dart';
import 'package:audio_book/src/presentation/widgets/rating_bar.dart';
import 'package:audio_book/src/presentation/widgets/regular_cached_image.dart';
import 'package:audio_book/src/presentation/widgets/regular_elevated_button.dart';
import 'package:audio_book/src/presentation/widgets/regular_outline_button.dart';
import 'package:flutter/material.dart';

class BookDetailPage extends StatelessWidget {
  const BookDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          iconSize: 24,
          icon: Assets.icons.arrowLeft.svg(),
        ),
        centerTitle: true,
        title: const Text(
          "Name of book",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            iconSize: 24,
            icon: Assets.icons.more.svg(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 24,
              ),
              const RegularCachedImage(
                imageUrl: "",
                height: 260,
                width: double.infinity,
                fit: BoxFit.contain,
              ),
              const SizedBox(
                height: 28,
              ),
              Text(
                "Book Name and some description about book so thas funny",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textStyles.medium20,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                "Paolo Kenedi",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textStyles.regular16.copyWith(
                      color: ColorName.neutral50,
                    ),
              ),
              const SizedBox(
                height: 16,
              ),
              const _RatingBar(rating: 4),
              const SizedBox(
                height: 8,
              ),
              const _Categories(categories: [
                "Fantasy",
                "Drama",
                "Comedy",
                "Fantasy",
                "Drama",
                "Comedy",
                "Fantasy",
                "Drama",
                "Comedy"
              ]),
              const SizedBox(
                height: 32,
              ),
              _ActionButtons(
                onPlayAudio: () {},
                onReadBook: () {},
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                "Summary",
                style: Theme.of(context).textStyles.semiBold14,
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                "Some description",
                style: Theme.of(context).textStyles.light12.copyWith(
                      color: ColorName.neutral60,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ActionButtons extends StatelessWidget {
  final VoidCallback? onPlayAudio;
  final VoidCallback? onReadBook;
  const _ActionButtons({required this.onPlayAudio, required this.onReadBook});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RegularElevatedButton(
            onPressed: onPlayAudio,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Assets.icons.play.svg(
                  width: 20,
                  height: 20,
                  colorFilter: const ColorFilter.mode(
                    ColorName.white,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  "Play Audio",
                  style: Theme.of(context).textStyles.medium14.copyWith(
                        color: ColorName.white,
                      ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: RegularOutlineButton(
            onPressed: onReadBook,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Assets.icons.document.svg(
                  width: 20,
                  height: 20,
                  colorFilter: const ColorFilter.mode(
                    ColorName.primary50,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  "Read Book",
                  style: Theme.of(context).textStyles.medium14.copyWith(
                        color: ColorName.primary50,
                      ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _Categories extends StatelessWidget {
  final List<String> categories;
  const _Categories({required this.categories});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: categories
          .map(
            (e) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                border: Border.all(
                  color: ColorName.neutral60,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Text(
                e,
                style: Theme.of(context).textStyles.semiBold12.copyWith(
                      color: ColorName.neutral60,
                    ),
              ),
            ),
          )
          .toList(),
    );
  }
}

class _RatingBar extends StatelessWidget {
  final double? rating;
  const _RatingBar({required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 136,
          child: RatingBar(
            rating: rating ?? 1,
            size: 24,
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        Text(
          rating?.toStringAsFixed(1) ?? "1.0",
          style: Theme.of(context).textStyles.regular20.copyWith(
                color: ColorName.neutral50,
              ),
        ),
      ],
    );
  }
}