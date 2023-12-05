import 'package:audio_book/gen/colors.gen.dart';
import 'package:audio_book/src/presentation/base/theme_provider.dart';
import 'package:audio_book/src/presentation/view_models/base_state.dart';
import 'package:audio_book/src/presentation/view_models/book_view_model.dart';
import 'package:audio_book/src/presentation/view_models/comment_view_model.dart';
import 'package:audio_book/src/presentation/view_models/user_view_model.dart';
import 'package:audio_book/src/presentation/widgets/rating_bar.dart';
import 'package:audio_book/src/presentation/widgets/regular_cached_image.dart';
import 'package:audio_book/src/presentation/widgets/regular_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddComment extends StatefulWidget {
  const AddComment({super.key});

  @override
  State<AddComment> createState() => _AddCommentState();
}

class _AddCommentState extends State<AddComment> {
  @override
  void initState() {
    Future.microtask(() {
      final id = context.read<CommentViewModel>().bookId;

      context.read<BookViewModel>().fetchBookById(id ?? "");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<BookViewModel>();
    return PopScope(
      canPop: false,
      child: SafeArea(
          child: switch (vm.bookByIdState.state) {
        BaseState.loading => const SizedBox(
            height: 240,
            child: Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          ),
        BaseState.loaded => SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                Container(
                  width: 60,
                  height: 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorName.neutral30,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                _BookItem(
                  bookName: vm.bookByIdState.book?.name,
                  bookAuthor: vm.bookByIdState.book?.author,
                  image: vm.bookByIdState.book?.photo,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  child: RatingBar(
                    rating: 0,
                    onRating: (value) {
                      context.read<CommentViewModel>().rating = value;
                    },
                    size: 36,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                ),
                Container(
                  constraints: const BoxConstraints(
                    minHeight: 120,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Theme.of(context).inputDecorationTheme.fillColor,
                  ),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: TextField(
                    controller:
                        context.read<CommentViewModel>().commentController,
                    maxLines: null,
                    decoration: const InputDecoration(
                      fillColor: Colors.transparent,
                      hintText: "Please, enter your comment...",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  child: RegularElevatedButton(
                    onPressed: () {
                      final user = context.read<UserViewModel>().user;
                      context.read<CommentViewModel>().addComment(
                            user?.uid ?? "",
                            user?.photo,
                            user?.fullName,
                            vm.bookByIdState.book?.id ?? "",
                          );
                      Navigator.pop(context);
                    },
                    text: "Add comment",
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).viewInsets.bottom,
                ),
              ],
            ),
          ),
        _ => const SizedBox(),
      }),
    );
  }
}

class _BookItem extends StatelessWidget {
  final String? image;
  final String? bookName;
  final String? bookAuthor;
  const _BookItem({this.image, this.bookName, this.bookAuthor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 20,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: RegularCachedImage(
            imageUrl: image,
            width: 82,
            height: 82,
            fit: BoxFit.cover,
            isSquare: true,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
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
          ),
        ),
        const SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
