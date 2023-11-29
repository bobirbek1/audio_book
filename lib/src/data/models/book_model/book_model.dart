// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'book_model.freezed.dart';

part 'book_model.g.dart';

@freezed
class BookModel extends HiveObject with _$BookModel {
  BookModel._();

  @HiveType(typeId: 1,adapterName: "BookModelAdapter")
  factory BookModel({
    @HiveField(0) String? id,
    @HiveField(1) String? name,
    @HiveField(2) String? author,
    @HiveField(3) String? description,
    @HiveField(4) String? photo,
    @JsonKey(name: "file_url") @HiveField(5) String? fileUrl,
    @HiveField(6) double? rating,
    @HiveField(7) int? listeners,
    @HiveField(8) List<String>? categories,
    @JsonKey(name: "audio_urls") @HiveField(9) List<AudioModel>? audioUrls,
  }) = _Book;

  factory BookModel.fromJson(Map<String, dynamic> json) =>
      _$BookModelFromJson(json);
}

@freezed
class AudioModel extends HiveObject with _$AudioModel {
  AudioModel._();

  @HiveType(typeId: 2,adapterName: "AudioModelAdapter")
  factory AudioModel({
    @HiveField(0)
    String? title,
    @HiveField(1)
    String? url,
  }) = _Audio;

  factory AudioModel.fromJson(Map<String, dynamic> json) =>
      _$AudioModelFromJson(json);
}
