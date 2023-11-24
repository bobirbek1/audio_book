import 'package:audio_book/gen/colors.gen.dart';
import 'package:audio_book/src/presentation/base/theme_provider.dart';
import 'package:audio_book/src/presentation/widgets/book_item.dart';
import 'package:audio_book/src/presentation/widgets/rating_bar.dart';
import 'package:audio_book/src/presentation/widgets/regular_elevated_button.dart';
import 'package:audio_book/src/presentation/widgets/regular_text_button.dart';
import 'package:flutter/material.dart';

const categoires = [
  "Art",
  "Business",
  "Comedy",
  "Drama",
  "Personal",
  "Photography",
  "Music"
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          const _TitleWidget(title: "Categories"),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
              ),
              children: categoires
                  .map(
                    (e) => _TabItem(
                      text: e,
                      onPressed: () {},
                    ),
                  )
                  .toList(),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          _TitleWidget(title: "Recomended For You", onSeeMore: () {}),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            height: 300,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: List.generate(
                  10,
                  (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        color: Colors.cyan,
                        width: 200,
                        height: 300,
                      )),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          _TitleWidget(
            title: "Best Seller",
            onSeeMore: () {},
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            height: 144,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: List.generate(
                10,
                (index) => const _HorizontalBookItem(
                  listenersCount: 1000,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          _TitleWidget(
            title: "New Releases",
            onSeeMore: () {},
          ),
          SizedBox(
            height: 220,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              children: List.generate(
                10,
                (index) => const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: BookItem(title: "The Black Witch"),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          _TitleWidget(
            title: "Trending now",
            onSeeMore: () {},
          ),
          SizedBox(
            height: 220,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              children: List.generate(
                10,
                (index) => const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: BookItem(title: "The Black Witch"),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 48,
          ),
        ],
      ),
    );
  }
}

class _HorizontalBookItem extends StatelessWidget {
  final String? image;
  final String? name;
  final String? author;
  final double? rating;
  final int? listenersCount;
  final VoidCallback? onPressed;
  const _HorizontalBookItem(
      {this.image,
      this.name,
      this.author,
      this.rating,
      this.listenersCount,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 144,
      width: 315,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 120,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.deepOrange,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 4,
                ),
                Text(
                  name ?? "Light Mage",
                  style: Theme.of(context).textStyles.medium16,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  author ?? "Laurie Forest",
                  style: Theme.of(context).textStyles.regular12.copyWith(
                        color: ColorName.neutral60,
                      ),
                ),
                const Expanded(child: SizedBox()),
                const RatingBar(
                  rating: 4,
                  size: 20,
                ),
                Text(
                  "$listenersCount+ Listeners",
                  style: Theme.of(context)
                      .textStyles
                      .regular12
                      .copyWith(color: ColorName.neutral60),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TabItem extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  const _TabItem({required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: RegularElevatedButton(
        onPressed: onPressed,
        text: text,
        radius: 12,
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.background,
        style: Theme.of(context).textStyles.regular16,
        size: const Size(0, 0),
      ),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  final String title;
  final VoidCallback? onSeeMore;
  const _TitleWidget({required this.title, this.onSeeMore});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 24,
        ),
        Text(
          title,
          style: Theme.of(context).textStyles.medium16,
        ),
        const Expanded(
          child: SizedBox(),
        ),
        if (onSeeMore != null)
          RegularTextButton(
            onPressed: onSeeMore,
            text: "See more",
            textStyle: Theme.of(context).textStyles.medium14.copyWith(
                  color: ColorName.primary50,
                ),
            size: const Size(
              0,
              0,
            ),
          ),
        const SizedBox(
          width: 24,
        ),
      ],
    );
  }
}
