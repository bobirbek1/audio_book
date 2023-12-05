import 'package:audio_book/gen/assets.gen.dart';
import 'package:audio_book/src/helpers/extensions.dart';
import 'package:audio_book/src/presentation/view_models/base_state.dart';
import 'package:audio_book/src/presentation/view_models/comment_view_model.dart';
import 'package:audio_book/src/presentation/widgets/comment_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CommentsPage extends StatefulWidget {
  const CommentsPage({super.key});

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  @override
  void initState() {
    Future.microtask(() {
      if (context.mounted) {
        final arg = context.getArguments<String?>();
        context.read<CommentViewModel>().fetchComments(arg ?? "");
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CommentViewModel>().state;
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
            "Comments",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        body: switch (state.state) {
          BaseState.loading => const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          BaseState.loaded => ListView.separated(
              itemCount: state.comments?.length ?? 0,
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 16,
                bottom: 32,
              ),
              itemBuilder: (ctx, index) {
                final comment = state.comments![index];
                return CommentItem(
                  userImage: comment.userImage,
                  userName: comment.userName,
                  comment: comment.comment,
                  createAt: comment.createdAt,
                  rating: comment.rating,
                );
              },
              separatorBuilder: (ctx, index) {
                return const SizedBox(
                  height: 16,
                );
              },
            ),
          _ => const SizedBox(),
        });
  }
}
