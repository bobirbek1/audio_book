import 'package:audio_book/gen/assets.gen.dart';
import 'package:audio_book/gen/colors.gen.dart';
import 'package:audio_book/src/data/models/book_model/book_model.dart';
import 'package:audio_book/src/helpers/extensions.dart';
import 'package:audio_book/src/presentation/base/theme_provider.dart';
import 'package:audio_book/src/presentation/view_models/player_view_model.dart';
import 'package:audio_book/src/presentation/widgets/regular_cached_image.dart';
import 'package:audio_book/src/presentation/widgets/regular_elevated_button.dart';
import 'package:audio_book/src/presentation/widgets/regular_text_button.dart';
import 'package:audio_book/src/services/navigator_service.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class PlayerPage extends StatelessWidget {
  const PlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final book = context.getArguments<BookModel?>();
    final vm = context.read<PlayerViewModel>();
    final messanger = ScaffoldMessenger.of(context);
    messanger.clearSnackBars();
    vm.initBookAudios(book);
    return PopScope(
      onPopInvoked: (canPop) {
        vm.isSnackbarActive = true;
        messanger
            .showSnackBar(
              const SnackBar(
                content: _PlayerSnackbar(),
                backgroundColor: Colors.white,
                duration: Duration(days: 1),
                elevation: 6,
                padding: EdgeInsets.zero,
              ),
            )
            .closed
            .then((value) {
          if (value == SnackBarClosedReason.swipe && vm.isPlaying) {
            vm.playOrPause();
          }
          vm.isSnackbarActive = false;
        });
      },
      child: Scaffold(
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
            _PlayerControlBar(
              onPlay: () {
                context.read<PlayerViewModel>().playOrPause();
              },
              onNext: () {
                context.read<PlayerViewModel>().next();
              },
              onPrevious: () {
                context.read<PlayerViewModel>().previous();
              },
              onVolume: () {
                context.read<PlayerViewModel>().toogleVoice();
              },
              onShare: () async {
                final filePath = context.read<PlayerViewModel>().filePath;
                final shareText = context.read<PlayerViewModel>().getShareText;
                ShareResult result;
                if (filePath != null) {
                  result = await Share.shareXFiles([XFile(filePath)],
                      text: shareText, subject: "Audio book");
                } else {
                  result = await Share.shareWithResult(shareText,
                      subject: "Audio book");
                }
                print("share result: ${result.status.name}");
              },
            ),
            const SizedBox(
              height: 32,
            ),
            const _BottomControlBar(),
            const SizedBox(
              height: 32,
            ),
          ],
        ),
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
              icon: Assets.icons.paper.svg(),
              label: context.select<PlayerViewModel, String?>(
                (value) => value.getCurrentChapterName,
              ),
              onPressed: () {
                _showChapterSelector(context);
              },
            ),
          ),
          Expanded(
            child: _BottomBarItem(
              icon: Assets.icons.timeSquare.svg(),
              label: context.select<PlayerViewModel, String>(
                  (value) => value.getCurrentSpeedName),
              onPressed: () {
                _showSpeedSelector(context);
              },
            ),
          ),
          Expanded(
            child: _BottomBarItem(
              icon: Assets.icons.arrowDownSquare.svg(),
              label: "Download",
              onPressed: () {
                context.read<PlayerViewModel>().downloadAllAudios();
                context.showSnackBar("All audios are downloading...");
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showChapterSelector(BuildContext context) {
    final audios = context.read<PlayerViewModel>().getAudios;
    if (audios != null) {
      showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (ctx) {
            return SafeArea(child: _ChapterSelector(audios));
          });
    }
  }

  void _showSpeedSelector(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (ctx) {
          return const SafeArea(child: _SpeedSelector());
        });
  }
}

class _SpeedSelector extends StatelessWidget {
  const _SpeedSelector();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      shrinkWrap: true,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 60,
              height: 4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorName.neutral30,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        ListTile(
          title: const Text("Speed 0.5x"),
          onTap: () {
            context.read<PlayerViewModel>().changeSpeed(0.5);
          },
        ),
        ListTile(
          title: const Text("Speed normal"),
          onTap: () {
            context.read<PlayerViewModel>().changeSpeed(1.0);
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: const Text("Speed 1.5x"),
          onTap: () {
            context.read<PlayerViewModel>().changeSpeed(1.5);
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: const Text("Speed 2x"),
          onTap: () {
            context.read<PlayerViewModel>().changeSpeed(2.0);
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: const Text("Speed 3"),
          onTap: () {
            context.read<PlayerViewModel>().changeSpeed(3.0);
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}

class _ChapterSelector extends StatelessWidget {
  final List<AudioModel> audios;
  const _ChapterSelector(this.audios);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      shrinkWrap: true,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 60,
              height: 4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorName.neutral30,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        ...List.generate(audios.length, (index) {
          return ListTile(
            title: Text(audios[index].title ?? "No name"),
            onTap: () {
              context.read<PlayerViewModel>().changeAudio(index);
              Navigator.pop(context);
            },
          );
        }),
      ],
    );
  }
}

class _BottomBarItem extends StatelessWidget {
  final Widget icon;
  final String? label;
  final VoidCallback? onPressed;
  const _BottomBarItem({
    required this.icon,
    required this.label,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return RegularTextButton(
      onPressed: onPressed,
      child: Column(
        children: [
          icon,
          const SizedBox(
            height: 8,
          ),
          Text(
            label ?? "No name",
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
            icon: context.select<PlayerViewModel, bool>(
                    (value) => value.isVoiceActive)
                ? Assets.icons.volumeUp.svg()
                : Assets.icons.volumeOff.svg(),
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
          RegularElevatedButton(
            onPressed: onPlay,
            size: const Size(60, 60),
            radius: 60,
            padding: const EdgeInsets.all(8),
            child: context
                    .select<PlayerViewModel, bool>((value) => value.isPlaying)
                ? const Icon(
                    Icons.pause_rounded,
                    size: 36,
                    color: ColorName.white,
                  )
                : const Icon(
                    Icons.play_arrow_rounded,
                    size: 36,
                    color: ColorName.white,
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ProgressBar(
        progress: vm.currentPosition ?? const Duration(),
        total: vm.duration ?? const Duration(milliseconds: 1000),
        buffered: Duration(milliseconds: vm.downloadProgress),
        barCapShape: BarCapShape.round,
        onSeek: (duration) {
          vm.seekTo(duration);
        },
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

class _PlayerSnackbar extends StatelessWidget {
  const _PlayerSnackbar();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProgressBar(
          barCapShape: BarCapShape.square,
          barHeight: 2,
          thumbColor: Colors.transparent,
          thumbGlowColor: Colors.transparent,
          timeLabelLocation: TimeLabelLocation.none,
          onSeek: (position) =>
              context.read<PlayerViewModel>().seekTo(position),
          progress: context.select<PlayerViewModel, Duration?>(
                  (value) => value.currentPosition) ??
              Duration.zero,
          total: context.select<PlayerViewModel, Duration?>(
                  (value) => value.duration) ??
              Duration.zero,
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            const SizedBox(
              width: 8,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: RegularCachedImage(
                imageUrl: context.read<PlayerViewModel>().book?.photo,
                width: 64,
                height: 64,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    generateRoute(
                      Pages.playerPage,
                      argument: context.read<PlayerViewModel>().book,
                    ),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      context.read<PlayerViewModel>().book?.name ?? "Unknown",
                      style: Theme.of(context).textStyles.medium16,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      context.read<PlayerViewModel>().book?.author ?? "Unknown",
                      style: Theme.of(context).textStyles.regular16.copyWith(
                            color: ColorName.neutral50,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            RegularElevatedButton(
              onPressed: () {
                context.read<PlayerViewModel>().playOrPause();
              },
              size: const Size(33, 33),
              radius: 50,
              padding: const EdgeInsets.all(8),
              child: context.read<PlayerViewModel>().isPlaying
                  ? const Icon(
                      Icons.pause_rounded,
                      color: ColorName.white,
                    )
                  : const Icon(
                      Icons.play_arrow_rounded,
                      color: ColorName.white,
                    ),
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
