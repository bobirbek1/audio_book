import 'package:audio_book/gen/assets.gen.dart';
import 'package:audio_book/src/presentation/widgets/comment_item.dart';
import 'package:flutter/material.dart';

class CommentsPage extends StatelessWidget {
  const CommentsPage({super.key});

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
          "Comments",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: ListView.separated(
        itemCount: 10,
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 16,
          bottom: 32,
        ),
        itemBuilder: (ctx, index) {
          return CommentItem(
            comment:
                "Some comment\nSome comment \nSome comment\nSome comment\nSome comment",
            createAt: DateTime(2023, 12, 2).toString(),
            rating: 4,
          );
        },
        separatorBuilder: (ctx, index) {
          return const SizedBox(
            height: 16,
          );
        },
      ),
    );
  }
}
