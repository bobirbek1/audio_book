



// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';


part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
class CategoryModel with _$CategoryModel{

  factory CategoryModel({
    String? id,
    String? name,
    @JsonKey(name: "is_recommended")
    bool? isRecommended,
  }) = _Category;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}




