





// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';


part 'comment_model.freezed.dart';
part 'comment_model.g.dart';


@freezed
class CommentModel with _$CommentModel{

   factory CommentModel({
    String? id,
    @JsonKey(name: "user_id")
    String? userId,
    @JsonKey(name: "user_name")
    String? userName,
    @JsonKey(name: "user_image")
    String? userImage,
    int? rating,
    String? comment,
    @JsonKey(name: "created_at")
    String? createdAt,
  }) = _Comment;

  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);

}



