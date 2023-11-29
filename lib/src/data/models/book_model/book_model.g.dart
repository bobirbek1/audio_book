// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookModelAdapter extends TypeAdapter<_$BookImpl> {
  @override
  final int typeId = 1;

  @override
  _$BookImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$BookImpl(
      id: fields[0] as String?,
      name: fields[1] as String?,
      author: fields[2] as String?,
      description: fields[3] as String?,
      photo: fields[4] as String?,
      fileUrl: fields[5] as String?,
      rating: fields[6] as double?,
      listeners: fields[7] as int?,
      categories: (fields[8] as List?)?.cast<String>(),
      audioUrls: (fields[9] as List?)?.cast<AudioModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$BookImpl obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.author)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.photo)
      ..writeByte(5)
      ..write(obj.fileUrl)
      ..writeByte(6)
      ..write(obj.rating)
      ..writeByte(7)
      ..write(obj.listeners)
      ..writeByte(8)
      ..write(obj.categories)
      ..writeByte(9)
      ..write(obj.audioUrls);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AudioModelAdapter extends TypeAdapter<_$AudioImpl> {
  @override
  final int typeId = 2;

  @override
  _$AudioImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$AudioImpl(
      title: fields[0] as String?,
      url: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, _$AudioImpl obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AudioModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
      listeners: json['listeners'] as int?,
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
      'listeners': instance.listeners,
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
