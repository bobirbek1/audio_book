// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookImpl _$$BookImplFromJson(Map<String, dynamic> json) => _$BookImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      author: json['author'] as String?,
      description: json['description'] as String?,
      photo: json['photo'] as String?,
      fileUrl: json['file_url'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      audioUrls: (json['audio_urls'] as List<dynamic>?)
          ?.map((e) => AudioModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BookImplToJson(_$BookImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'author': instance.author,
      'description': instance.description,
      'photo': instance.photo,
      'file_url': instance.fileUrl,
      'rating': instance.rating,
      'categories': instance.categories,
      'audio_urls': instance.audioUrls,
    };

_$AudioImpl _$$AudioImplFromJson(Map<String, dynamic> json) => _$AudioImpl(
      title: json['title'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$$AudioImplToJson(_$AudioImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'url': instance.url,
    };
