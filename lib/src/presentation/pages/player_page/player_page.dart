import 'package:audio_book/gen/assets.gen.dart';
import 'package:audio_book/gen/colors.gen.dart';
import 'package:audio_book/src/data/models/book_model/book_model.dart';
import 'package:audio_book/src/helpers/extensions.dart';
import 'package:audio_book/src/presentation/base/theme_provider.dart';
import 'package:audio_book/src/presentation/view_models/player_view_model.dart';
import 'package:audio_book/src/presentation/widgets/regular_cached_image.dart';
import 'package:audio_book/src/presentation/widgets/regular_text_button.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlayerPage extends StatelessWidget {
  const PlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final book = context.getArguments<BookModel?>();
    context.read<PlayerViewModel>().initBookAudios(book);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          iconSize: 24,
          icon: Assets.icons.arrowDown.svg(),
        ),
        centerTitle: true,
        title: Text(
          book?.name ?? "Name not found",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 28,
          ),
          Expanded(
            child: RegularCachedImage(
              imageUrl: book?.photo,
              fit: BoxFit.contain,
              width: double.infinity,
            ),
          ),
          const SizedBox(
            height: 28,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              book?.name ?? "Name not found",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textStyles.medium20,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              book?.author ?? "Name not found",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textStyles.regular16.copyWith(
                    color: ColorName.black.withOpacity(
                      0.5,
                    ),
                  ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const _PlayerSlider(),
          const SizedBox(
            height: 24,
          ),
          _PlayerControlBar(onPlay: () {
            context.read<PlayerViewModel>().playOrPause();
          }),
          const SizedBox(
            height: 32,
          ),
          const _BottomControlBar(),
          const SizedBox(
            height: 32,
          ),
        ],
      ),
    );
  }
}

class _BottomControlBar extends StatelessWidget {
  const _BottomControlBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: _BottomBarItem(
                icon: Assets.icons.bookmark.svg(), label: "Bookmark"),
          ),
          Expanded(
            child: _BottomBarItem(
                icon: Assets.icons.paper.svg(), label: "Chapter 1"),
          ),
          Expanded(
            child: _BottomBarItem(
                icon: Assets.icons.timeSquare.svg(), label: "Speed 1x"),
          ),
          Expanded(
            child: _BottomBarItem(
                icon: Assets.icons.arrowDownSquare.svg(), label: "Download"),
          ),
        ],
      ),
    );
  }
}

class _BottomBarItem extends StatelessWidget {
  final Widget icon;
  final String? label;
  const _BottomBarItem({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return RegularTextButton(
      onPressed: () {},
      child: Column(
        children: [
          icon,
          const SizedBox(
            height: 8,
          ),
          Text(
            label ?? "Label",
            style: Theme.of(context).textStyles.medium10,
          ),
        ],
      ),
    );
  }
}

class _PlayerControlBar extends StatelessWidget {
  final VoidCallback? onVolume;
  final VoidCallback? onPrevious;
  final VoidCallback? onPlay;
  final VoidCallback? onNext;
  final VoidCallback? onShare;
  const _PlayerControlBar(
      {this.onNext, this.onPlay, this.onPrevious, this.onShare, this.onVolume});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          IconButton(
            onPressed: onVolume,
            icon: Assets.icons.volumeUp.svg(),
            iconSize: 24,
          ),
          const Expanded(child: SizedBox()),
          IconButton(
            onPressed: onPrevious,
            icon: Assets.icons.arrowLeftCircle.svg(
              width: 33,
              height: 33,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          IconButton(
            onPressed: onPlay,
            icon: Assets.icons.playBold.svg(
              width: 60,
              height: 60,
              colorFilter: const ColorFilter.mode(
                ColorName.primary50,
                BlendMode.srcIn,
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          IconButton(
            onPressed: onNext,
            icon: Assets.icons.arrowRightCircle.svg(
              width: 33,
              height: 33,
            ),
          ),
          const Expanded(child: SizedBox()),
          IconButton(
            onPressed: onShare,
            icon: Assets.icons.upload.svg(),
            iconSize: 24,
          ),
        ],
      ),
    );
  }
}

class _PlayerSlider extends StatelessWidget {
  const _PlayerSlider();

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<PlayerViewModel>();
    print("download progress: ${vm.downloadProgress}");

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ProgressBar(
        progress: vm.currentPosition ?? const Duration(),
        total: vm.duration ?? const Duration(milliseconds: 1000),
        buffered: Duration(milliseconds: vm.downloadProgress),
        barCapShape: BarCapShape.round,
        barHeight: 4,
        thumbRadius: 8,
        thumbGlowRadius: 16,
        timeLabelLocation: TimeLabelLocation.below,
        timeLabelPadding: 4,
        timeLabelTextStyle: Theme.of(context).textStyles.regular10.copyWith(
              color: ColorName.primary20,
            ),
      ),
    );
  }
}
