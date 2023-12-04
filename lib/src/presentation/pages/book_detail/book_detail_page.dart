import 'package:audio_book/gen/assets.gen.dart';
import 'package:audio_book/gen/colors.gen.dart';
import 'package:audio_book/src/helpers/extensions.dart';
import 'package:audio_book/src/presentation/base/theme_provider.dart';
import 'package:audio_book/src/presentation/view_models/base_state.dart';
import 'package:audio_book/src/presentation/view_models/book_view_model.dart';
import 'package:audio_book/src/presentation/view_models/category_view_model.dart';
import 'package:audio_book/src/presentation/widgets/comment_item.dart';
import 'package:audio_book/src/presentation/widgets/page_indicator.dart';
import 'package:audio_book/src/presentation/widgets/rating_bar.dart';
import 'package:audio_book/src/presentation/widgets/regular_cached_image.dart';
import 'package:audio_book/src/presentation/widgets/regular_elevated_button.dart';
import 'package:audio_book/src/presentation/widgets/regular_outline_button.dart';
import 'package:audio_book/src/presentation/widgets/regular_text_button.dart';
import 'package:audio_book/src/services/navigator_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookDetailPage extends StatelessWidget {
  const BookDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = context.getArguments<Map<String, dynamic>?>();
    Future.microtask(
        () => context.read<BookViewModel>().fetchBookById(args?["id"] ?? ""));
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
        title: Text(
          args?["name"] ?? "Name not found",
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
      body: Consumer<BookViewModel>(
        builder: (ctx, vm, child) {
          return switch (vm.bookByIdState.state) {
            BaseState.loading => const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            BaseState.error => Center(
                child: Text(
                  vm.bookByIdState.error ??
                      "Unknown exception occured, Please try again.",
                ),
              ),
            BaseState.loaded => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 24,
                      ),
                      RegularCachedImage(
                        imageUrl: vm.bookByIdState.book?.photo,
                        height: 260,
                        width: double.infinity,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(
                        height: 28,
                      ),
                      Text(
                        vm.bookByIdState.book?.name ?? "Name not available",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textStyles.medium20,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        vm.bookByIdState.book?.author ?? "Author not available",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textStyles.regular16.copyWith(
                              color: ColorName.neutral50,
                            ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      _RatingBar(rating: vm.bookByIdState.book?.rating),
                      const SizedBox(
                        height: 8,
                      ),
                      _Categories(
                        categories: context
                            .read<CategoryViewModel>()
                            .getCategoriesNameByIds(
                              vm.bookByIdState.book?.categories,
                            ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      _ActionButtons(
                        onPlayAudio: () {
                          Navigator.push(
                            context,
                            generateRoute(
                              Pages.playerPage,
                              argument: vm.bookByIdState.book,
                            ),
                          );
                        },
                        onReadBook: () {
                          Navigator.push(
                            context,
                            generateRoute(
                              Pages.readingPage,
                              argument: {
                                "name": vm.bookByIdState.book?.name,
                                "file_url": vm.bookByIdState.book?.fileUrl,
                              },
                            ),
                          );
                        },
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
                        vm.bookByIdState.book?.description ??
                            "No description available",
                        style: Theme.of(context).textStyles.light12.copyWith(
                              color: ColorName.neutral60,
                            ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      _Comments(),
                      SizedBox(
                        height: 32 + ctx.getSnackbarPadding(),
                      ),
                    ],
                  ),
                ),
              ),
            _ => const SizedBox(),
          };
        },
      ),
    );
  }
}

class _Comments extends StatelessWidget {
  _Comments();

  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Review",
          style: Theme.of(context).textStyles.semiBold14,
        ),
        const SizedBox(
          height: 12,
        ),
        SizedBox(
          height: 156,
          child: PageView(
            controller: _controller,
            children: List.generate(
              3,
              (index) => CommentItem(
                rating: 4,
                comment:
                    "Some comment and not the end...\n some comment next line\n and also next line\nalso next line\nalso next line",
                createAt: DateTime(2023, 12, 2).toString(),
                maxLine: 4,
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PageIndicator(
              controller: _controller,
            ),
            RegularTextButton(
              onPressed: () {
                Navigator.push(context, generateRoute(Pages.commentsPage,));
              },
              textStyle: Theme.of(context).textStyles.medium14.copyWith(
                    color: ColorName.accent50,
                  ),
              size: const Size(10, 10),
              text: "View More",
            ),
          ],
        ),
      ],
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
