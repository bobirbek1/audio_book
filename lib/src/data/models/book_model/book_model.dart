
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_model.freezed.dart';

part 'book_model.g.dart';

@freezed
class BookModel with _$BookModel {
  factory BookModel({
    String? id,
    String? name,
    String? author,
    String? description,
    String? photo,
    @JsonKey(name: "file_url")
    String? fileUrl,
    double? rating,
    List<String>? categories,
    @JsonKey(name: "audio_urls")
    List<AudioModel>? audioUrls,
  }) = _Book;

   factory BookModel.fromJson(Map<String, dynamic> json) =>
      _$BookModelFromJson(json);

}

@freezed
class AudioModel with _$AudioModel {
  factory AudioModel({
    String? title,
    String? url,
  }) = _Audio;

   factory AudioModel.fromJson(Map<String, dynamic> json) =>
      _$AudioModelFromJson(json);

}




