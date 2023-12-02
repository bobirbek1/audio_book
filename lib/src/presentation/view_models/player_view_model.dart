import 'dart:async';
import 'dart:io';

import 'package:audio_book/src/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:just_audio/just_audio.dart';

class PlayerViewModel extends ChangeNotifier {
  final AudioPlayer _player;
  final CacheManager _cm;
  final Box _box;

  PlayerViewModel(this._player, this._cm, this._box) {
    _player
        .createPositionStream(
            minPeriod: const Duration(milliseconds: 1000),
            maxPeriod: const Duration(milliseconds: 1000))
        .listen(_positionListener);
    _player
        .createPositionStream(
          minPeriod: const Duration(milliseconds: 5000),
          maxPeriod: const Duration(milliseconds: 5000),
        )
        .listen(_saveLastDurationToCache);
  }

  Duration? _currentPosition;
  Duration? get currentPosition => _currentPosition;

  Duration? _duration;
  Duration? get duration => _duration;

  double? _downloadProgress;
  int get downloadProgress => ((_downloadProgress ?? 0) * 1000).toInt();

  bool _isVoiceActive = true;
  bool get isVoiceActive => _isVoiceActive;

  bool get isPlaying => _player.playing;

  String? get getCurrentChapterName => _book?.audioUrls?[_currentIndex].title;

  List<AudioModel>? get getAudios => _book?.audioUrls;

  String get getShareText =>
      "Book name: ${_book?.name}\nAuthor: ${_book?.author}\n\nDescription: ${_book?.description}";

  File? _file;
  String? get filePath => _file?.path;

  int _currentIndex = 0;

  double get currentSpeed => _player.speed;

  String get getCurrentSpeedName => currentSpeed == 0.5
      ? "Speed 0.5x"
      : currentSpeed == 1.0
          ? "Speed normal"
          : currentSpeed == 1.5
              ? "Speed 1.5x"
              : currentSpeed == 2.0
                  ? "Speed 2.0x"
                  : "Speed 3x";

  BookModel? _book;

  void initBookAudios(BookModel? book) {
    if (book == null || _book == book) {
      return;
    }

    _book = book;
    _currentIndex = _getLastIndexFromCache();
    final lastDuration = _getLastDurationFromCache();
    _setAudioSource(_currentIndex, lastDuration);
  }

  void _positionListener(Duration? pos) {
    _currentPosition = pos;
    notifyListeners();
  }

  void playOrPause() async {
    if (isPlaying) {
      await _player.pause();
    } else {
      await _player.play();
    }
  }

  void seekTo(Duration duration) async {
    await _player.seek(duration);
  }

  void next() async {
    if (_book?.audioUrls == null) {
      return;
    }
    if (_book!.audioUrls!.length > _currentIndex + 1) {
      _currentIndex++;
      await _saveLastIndexToCache();
      _setAudioSource(_currentIndex);
    }
  }

  void previous() async {
    if (_book?.audioUrls == null) {
      return;
    }
    if (_currentIndex > 0) {
      _currentIndex--;
      await _saveLastIndexToCache();
      _setAudioSource(_currentIndex);
    }
  }

  void toogleVoice() async {
    if (_isVoiceActive) {
      await _player.setVolume(0);
      _isVoiceActive = false;
    } else {
      await _player.setVolume(1);
      _isVoiceActive = true;
    }
    notifyListeners();
  }

  void changeAudio(int index) async {
    if (_currentIndex == index) {
      return;
    }
    _currentIndex = index;
    await _saveLastIndexToCache();
    _setAudioSource(_currentIndex);
  }

  void changeSpeed(double speed) async {
    await _player.setSpeed(speed);
    notifyListeners();
  }

  void downloadAllAudios() async {
    if (_book?.audioUrls == null) return;
    for (var i = 0; i < _book!.audioUrls!.length; i++) {
      if (i == _currentIndex) continue;
      await _cm.getSingleFile(_book!.audioUrls![i].url ?? "");
    }
  }

  void _setAudioSource(int index, [Duration position = Duration.zero]) async {
    await _player.stop();
    _duration = null;
    _currentPosition = null;
    _downloadProgress = 0;
    _file == null;
    _file = await _getFilefromCache(_book?.audioUrls?[index].url);

    if (_file == null) {
      return;
    }
    _duration = await _player.setAudioSource(AudioSource.file(_file!.path),
        initialPosition: position);
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

  Future<void> _saveLastIndexToCache() async {
    try {
      final key = "${_book?.id}_index";
      await _box.put(key, _currentIndex);
    } catch (e) {
      print("save last index throw exception: $e");
    }
  }

  Future<void> _saveLastDurationToCache(Duration duration) async {
    try {
      final key = "${_book?.id}_duration";
      await _box.put(key, duration.inMilliseconds);
    } catch (e) {
      print("save last duration throw exception: $e");
    }
  }

  Duration _getLastDurationFromCache() {
    try {
      final key = "${_book?.id}_duration";
      return Duration(milliseconds: _box.get(key) ?? 0);
    } catch (e) {
      print("get last duration throw exception: $e");
      return Duration.zero;
    }
  }

  int _getLastIndexFromCache() {
    try {
      final key = "${_book?.id}_index";
      return _box.get(key) ?? 0;
    } catch (e) {
      print("get last index throw exception: $e");
      return 0;
    }
  }
}
