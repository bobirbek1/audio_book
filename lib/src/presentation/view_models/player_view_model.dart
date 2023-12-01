import 'dart:async';
import 'dart:io';

import 'package:audio_book/src/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:just_audio/just_audio.dart';

class PlayerViewModel extends ChangeNotifier {
  final AudioPlayer _player;
  final CacheManager _cm;

  PlayerViewModel(this._player, this._cm) {
    _player
        .createPositionStream(
            minPeriod: const Duration(milliseconds: 1000),
            maxPeriod: const Duration(milliseconds: 1000))
        .listen(_positionListener);
  }

  Duration? _currentPosition;
  Duration? get currentPosition => _currentPosition;

  Duration? _duration;
  Duration? get duration => _duration;

  double? _downloadProgress;
  int get downloadProgress => ((_downloadProgress ?? 0) * 1000).toInt();

  bool get isPLaying => _player.playing;

  BookModel? _book;

  void initBookAudios(BookModel? book) {
    if (book == null || _book == book) {
      return;
    }

    _book = book;
    _setAudioSource(0);
  }

  void _positionListener(Duration? pos) {
    print("audio position changed: $pos");
    _currentPosition = pos;
    notifyListeners();
  }

  void playOrPause() async {
    if (isPLaying) {
      await _player.pause();
    } else {
      await _player.play();
    }
  }

  void _setAudioSource(int index) async {
    await _player.stop();
    _duration = null;
    _currentPosition = null;
    _downloadProgress = 0;
    final file = await _getFilefromCache(_book?.audioUrls?[index].url);

    if (file == null) {
      return;
    }
    _duration = await _player.setAudioSource(AudioSource.file(file.path));
    print("audio duration: $duration");
    _player.play();
  }

  Future<File?> _getFilefromCache(String? url) async {
    if (url == null) {
      return null;
    }
    final fileInfo = await _cm.getFileFromCache(url);
    if (fileInfo != null) {
      return fileInfo.file;
    }

    final file = Completer<File?>();

    _cm.getFileStream(url, withProgress: true).listen((response) {
      if (response is DownloadProgress) {
        print("audio download progress: ${response.progress}");
        _downloadProgress = response.progress;
        notifyListeners();
      } else if (response is FileInfo) {
        file.complete(response.file);
      }
    }, onError: (e) {
      print("audio download error: $e");
      file.complete(null);
    });
    return file.future;
  }
}
