import 'package:audio_book/gen/assets.gen.dart';
import 'package:audio_book/gen/colors.gen.dart';
import 'package:audio_book/src/data/models/book_model/book_model.dart';
import 'package:audio_book/src/helpers/extensions.dart';
import 'package:audio_book/src/presentation/base/theme_provider.dart';
import 'package:audio_book/src/presentation/widgets/regular_cached_image.dart';
import 'package:audio_book/src/presentation/widgets/regular_text_button.dart';
import 'package:flutter/material.dart';

class PlayerPage extends StatelessWidget {
  const PlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final book = context.getArguments<BookModel?>();
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
          const _PlayerControlBar(),
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

class _PlayerSlider extends StatefulWidget {
  const _PlayerSlider();

  @override
  State<_PlayerSlider> createState() => __PlayerSliderState();
}

class __PlayerSliderState extends State<_PlayerSlider> {
  double currentValue = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
          value: currentValue,
          max: 100,
          onChanged: (val) {
            setState(() {
              currentValue = val;
            });
            print("onchanged: $val");
          },
          onChangeEnd: (val) {
            print("onchangeEnd: $val");
          },
          onChangeStart: (val) {
            print("onchangestart: $val");
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "00:30",
                style: Theme.of(context).textStyles.regular10.copyWith(
                      color: ColorName.primary20,
                    ),
              ),
              Text(
                "04:30",
                style: Theme.of(context).textStyles.regular10.copyWith(
                      color: ColorName.primary20,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
