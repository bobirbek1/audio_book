import 'package:audio_book/gen/colors.gen.dart';
import 'package:audio_book/src/helpers/extensions.dart';
import 'package:audio_book/src/presentation/base/theme_provider.dart';
import 'package:audio_book/src/presentation/view_models/base_state.dart';
import 'package:audio_book/src/presentation/view_models/book_view_model.dart';
import 'package:audio_book/src/presentation/view_models/category_view_model.dart';
import 'package:audio_book/src/presentation/widgets/book_item.dart';
import 'package:audio_book/src/presentation/widgets/category_item.dart';
import 'package:audio_book/src/presentation/widgets/rating_bar.dart';
import 'package:audio_book/src/presentation/widgets/regular_cached_image.dart';
import 'package:audio_book/src/presentation/widgets/regular_text_button.dart';
import 'package:audio_book/src/services/navigator_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            child: Consumer<CategoryViewModel>(
              builder: (context, value, child) => ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                ),
                children: value.categories
                    .map(
                      (cat) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: CategoryItem(
                          text: cat.name ?? "Unknown",
                          onPressed: () {
                            Navigator.push(
                              context,
                              generateRoute(
                                Pages.booksByCategoryPage,
                                argument: {
                                  "category": cat.name,
                                  "category_id": cat.id,
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          const _RecommendedBooks(),
          const SizedBox(
            height: 24,
          ),
          const _BestSellerBooks(),
          const SizedBox(
            height: 24,
          ),
          const _LatestBooks(),
          const SizedBox(
            height: 24,
          ),
          const _TrendingNow(),
          SizedBox(
            height: 48 + context.getSnackbarPadding(),
          ),
        ],
      ),
    );
  }
}

class _RecommendedBooks extends StatelessWidget {
  const _RecommendedBooks();

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<BookViewModel>();
    return switch (vm.recommendedState.state) {
      BaseState.loading => const CircularProgressIndicator.adaptive(),
      BaseState.loaded => Column(
          children: [
            _TitleWidget(
                title: "Recomended For You",
                onSeeMore: () {
                  Navigator.push(
                    context,
                    generateRoute(
                      Pages.recommendedBooksPage,
                    ),
                  );
                }),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 300,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: vm.recommendedState.books
                        ?.map(
                          (book) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  generateRoute(
                                    Pages.bookDetailPage,
                                    argument: {
                                      "id": book.id,
                                      "name": book.name
                                    },
                                  ),
                                );
                              },
                              child: RegularCachedImage(
                                imageUrl: book.photo,
                                width: 200,
                                height: 300,
                                fit: BoxFit.cover,
                                isSquare: false,
                              ),
                            ),
                          ),
                        )
                        .toList() ??
                    [],
              ),
            ),
          ],
        ),
      _ => const SizedBox(),
    };
  }
}

class _BestSellerBooks extends StatelessWidget {
  const _BestSellerBooks();

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<BookViewModel>();
    return switch (vm.bestSellerState.state) {
      BaseState.loading => const CircularProgressIndicator.adaptive(),
      BaseState.loaded => Column(
          children: [
            _TitleWidget(
                title: "Best Seller",
                onSeeMore: () {
                  Navigator.push(
                      context, generateRoute(Pages.bestSellerBooksPage));
                }),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 144,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: vm.bestSellerState.books
                        ?.map(
                          (book) => _HorizontalBookItem(
                            name: book.name,
                            author: book.author,
                            image: book.photo,
                            rating: book.rating,
                            listenersCount: book.listeners,
                            onPressed: (){
                               Navigator.push(
                                  context,
                                  generateRoute(
                                    Pages.bookDetailPage,
                                    argument: {
                                      "id": book.id,
                                      "name": book.name
                                    },
                                  ),
                                );
                            },
                          ),
                        )
                        .toList() ??
                    [],
              ),
            ),
          ],
        ),
      _ => const SizedBox(),
    };
  }
}

class _LatestBooks extends StatelessWidget {
  const _LatestBooks();

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<BookViewModel>();
    return switch (vm.latestState.state) {
      BaseState.loading => const CircularProgressIndicator.adaptive(),
      BaseState.loaded => Column(
          children: [
            _TitleWidget(
                title: "New Releases",
                onSeeMore: () {
                  Navigator.push(context, generateRoute(Pages.latestBooksPage));
                }),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 220,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                children: vm.latestState.books
                        ?.map(
                          (book) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: BookItem(
                              title: book.name,
                              imageUrl: book.photo,
                              width: 160,
                              height: 220,
                              onPressed: (){
                                 Navigator.push(
                                  context,
                                  generateRoute(
                                    Pages.bookDetailPage,
                                    argument: {
                                      "id": book.id,
                                      "name": book.name
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                        .toList() ??
                    [],
              ),
            ),
          ],
        ),
      _ => const SizedBox(),
    };
  }
}

class _TrendingNow extends StatelessWidget {
  const _TrendingNow();

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<BookViewModel>();
    return switch (vm.trendingState.state) {
      BaseState.loading => const CircularProgressIndicator.adaptive(),
      BaseState.loaded => Column(
          children: [
            _TitleWidget(
                title: "Trending Now",
                onSeeMore: () {
                  Navigator.push(
                      context, generateRoute(Pages.trendingBooksPage));
                }),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 220,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                children: vm.trendingState.books
                        ?.map(
                          (book) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: BookItem(
                              title: book.name,
                              imageUrl: book.photo,
                              width: 160,
                              height: 220,
                              onPressed: (){
                                 Navigator.push(
                                  context,
                                  generateRoute(
                                    Pages.bookDetailPage,
                                    argument: {
                                      "id": book.id,
                                      "name": book.name
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                        .toList() ??
                    [],
              ),
            ),
          ],
        ),
      _ => const SizedBox(),
    };
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
    return GestureDetector(
      onTap: onPressed,
      child: Container(
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
            RegularCachedImage(
              imageUrl: image,
              width: 120,
              height: 120,
              fit: BoxFit.cover,
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
                    "${listenersCount ?? 100}+ Listeners",
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
