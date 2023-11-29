// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BookModel _$BookModelFromJson(Map<String, dynamic> json) {
  return _Book.fromJson(json);
}

/// @nodoc
mixin _$BookModel {
  @HiveField(0)
  String? get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get name => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get author => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get description => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get photo => throw _privateConstructorUsedError;
  @JsonKey(name: "file_url")
  @HiveField(5)
  String? get fileUrl => throw _privateConstructorUsedError;
  @HiveField(6)
  double? get rating => throw _privateConstructorUsedError;
  @HiveField(7)
  int? get listeners => throw _privateConstructorUsedError;
  @HiveField(8)
  List<String>? get categories => throw _privateConstructorUsedError;
  @JsonKey(name: "audio_urls")
  @HiveField(9)
  List<AudioModel>? get audioUrls => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookModelCopyWith<BookModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookModelCopyWith<$Res> {
  factory $BookModelCopyWith(BookModel value, $Res Function(BookModel) then) =
      _$BookModelCopyWithImpl<$Res, BookModel>;
  @useResult
  $Res call(
      {@HiveField(0) String? id,
      @HiveField(1) String? name,
      @HiveField(2) String? author,
      @HiveField(3) String? description,
      @HiveField(4) String? photo,
      @JsonKey(name: "file_url") @HiveField(5) String? fileUrl,
      @HiveField(6) double? rating,
      @HiveField(7) int? listeners,
      @HiveField(8) List<String>? categories,
      @JsonKey(name: "audio_urls") @HiveField(9) List<AudioModel>? audioUrls});
}

/// @nodoc
class _$BookModelCopyWithImpl<$Res, $Val extends BookModel>
    implements $BookModelCopyWith<$Res> {
  _$BookModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? author = freezed,
    Object? description = freezed,
    Object? photo = freezed,
    Object? fileUrl = freezed,
    Object? rating = freezed,
    Object? listeners = freezed,
    Object? categories = freezed,
    Object? audioUrls = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      fileUrl: freezed == fileUrl
          ? _value.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      listeners: freezed == listeners
          ? _value.listeners
          : listeners // ignore: cast_nullable_to_non_nullable
              as int?,
      categories: freezed == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      audioUrls: freezed == audioUrls
          ? _value.audioUrls
          : audioUrls // ignore: cast_nullable_to_non_nullable
              as List<AudioModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookImplCopyWith<$Res> implements $BookModelCopyWith<$Res> {
  factory _$$BookImplCopyWith(
          _$BookImpl value, $Res Function(_$BookImpl) then) =
      __$$BookImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String? id,
      @HiveField(1) String? name,
      @HiveField(2) String? author,
      @HiveField(3) String? description,
      @HiveField(4) String? photo,
      @JsonKey(name: "file_url") @HiveField(5) String? fileUrl,
      @HiveField(6) double? rating,
      @HiveField(7) int? listeners,
      @HiveField(8) List<String>? categories,
      @JsonKey(name: "audio_urls") @HiveField(9) List<AudioModel>? audioUrls});
}

/// @nodoc
class __$$BookImplCopyWithImpl<$Res>
    extends _$BookModelCopyWithImpl<$Res, _$BookImpl>
    implements _$$BookImplCopyWith<$Res> {
  __$$BookImplCopyWithImpl(_$BookImpl _value, $Res Function(_$BookImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? author = freezed,
    Object? description = freezed,
    Object? photo = freezed,
    Object? fileUrl = freezed,
    Object? rating = freezed,
    Object? listeners = freezed,
    Object? categories = freezed,
    Object? audioUrls = freezed,
  }) {
    return _then(_$BookImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      fileUrl: freezed == fileUrl
          ? _value.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      listeners: freezed == listeners
          ? _value.listeners
          : listeners // ignore: cast_nullable_to_non_nullable
              as int?,
      categories: freezed == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      audioUrls: freezed == audioUrls
          ? _value._audioUrls
          : audioUrls // ignore: cast_nullable_to_non_nullable
              as List<AudioModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 1, adapterName: "BookModelAdapter")
class _$BookImpl extends _Book {
  _$BookImpl(
      {@HiveField(0) this.id,
      @HiveField(1) this.name,
      @HiveField(2) this.author,
      @HiveField(3) this.description,
      @HiveField(4) this.photo,
      @JsonKey(name: "file_url") @HiveField(5) this.fileUrl,
      @HiveField(6) this.rating,
      @HiveField(7) this.listeners,
      @HiveField(8) final List<String>? categories,
      @JsonKey(name: "audio_urls")
      @HiveField(9)
      final List<AudioModel>? audioUrls})
      : _categories = categories,
        _audioUrls = audioUrls,
        super._();

  factory _$BookImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookImplFromJson(json);

  @override
  @HiveField(0)
  final String? id;
  @override
  @HiveField(1)
  final String? name;
  @override
  @HiveField(2)
  final String? author;
  @override
  @HiveField(3)
  final String? description;
  @override
  @HiveField(4)
  final String? photo;
  @override
  @JsonKey(name: "file_url")
  @HiveField(5)
  final String? fileUrl;
  @override
  @HiveField(6)
  final double? rating;
  @override
  @HiveField(7)
  final int? listeners;
  final List<String>? _categories;
  @override
  @HiveField(8)
  List<String>? get categories {
    final value = _categories;
    if (value == null) return null;
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<AudioModel>? _audioUrls;
  @override
  @JsonKey(name: "audio_urls")
  @HiveField(9)
  List<AudioModel>? get audioUrls {
    final value = _audioUrls;
    if (value == null) return null;
    if (_audioUrls is EqualUnmodifiableListView) return _audioUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'BookModel(id: $id, name: $name, author: $author, description: $description, photo: $photo, fileUrl: $fileUrl, rating: $rating, listeners: $listeners, categories: $categories, audioUrls: $audioUrls)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.photo, photo) || other.photo == photo) &&
            (identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.listeners, listeners) ||
                other.listeners == listeners) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality()
                .equals(other._audioUrls, _audioUrls));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      author,
      description,
      photo,
      fileUrl,
      rating,
      listeners,
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_audioUrls));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookImplCopyWith<_$BookImpl> get copyWith =>
      __$$BookImplCopyWithImpl<_$BookImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookImplToJson(
      this,
    );
  }
}

abstract class _Book extends BookModel {
  factory _Book(
      {@HiveField(0) final String? id,
      @HiveField(1) final String? name,
      @HiveField(2) final String? author,
      @HiveField(3) final String? description,
      @HiveField(4) final String? photo,
      @JsonKey(name: "file_url") @HiveField(5) final String? fileUrl,
      @HiveField(6) final double? rating,
      @HiveField(7) final int? listeners,
      @HiveField(8) final List<String>? categories,
      @JsonKey(name: "audio_urls")
      @HiveField(9)
      final List<AudioModel>? audioUrls}) = _$BookImpl;
  _Book._() : super._();

  factory _Book.fromJson(Map<String, dynamic> json) = _$BookImpl.fromJson;

  @override
  @HiveField(0)
  String? get id;
  @override
  @HiveField(1)
  String? get name;
  @override
  @HiveField(2)
  String? get author;
  @override
  @HiveField(3)
  String? get description;
  @override
  @HiveField(4)
  String? get photo;
  @override
  @JsonKey(name: "file_url")
  @HiveField(5)
  String? get fileUrl;
  @override
  @HiveField(6)
  double? get rating;
  @override
  @HiveField(7)
  int? get listeners;
  @override
  @HiveField(8)
  List<String>? get categories;
  @override
  @JsonKey(name: "audio_urls")
  @HiveField(9)
  List<AudioModel>? get audioUrls;
  @override
  @JsonKey(ignore: true)
  _$$BookImplCopyWith<_$BookImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AudioModel _$AudioModelFromJson(Map<String, dynamic> json) {
  return _Audio.fromJson(json);
}

/// @nodoc
mixin _$AudioModel {
  @HiveField(0)
  String? get title => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AudioModelCopyWith<AudioModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AudioModelCopyWith<$Res> {
  factory $AudioModelCopyWith(
          AudioModel value, $Res Function(AudioModel) then) =
      _$AudioModelCopyWithImpl<$Res, AudioModel>;
  @useResult
  $Res call({@HiveField(0) String? title, @HiveField(1) String? url});
}

/// @nodoc
class _$AudioModelCopyWithImpl<$Res, $Val extends AudioModel>
    implements $AudioModelCopyWith<$Res> {
  _$AudioModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AudioImplCopyWith<$Res> implements $AudioModelCopyWith<$Res> {
  factory _$$AudioImplCopyWith(
          _$AudioImpl value, $Res Function(_$AudioImpl) then) =
      __$$AudioImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@HiveField(0) String? title, @HiveField(1) String? url});
}

/// @nodoc
class __$$AudioImplCopyWithImpl<$Res>
    extends _$AudioModelCopyWithImpl<$Res, _$AudioImpl>
    implements _$$AudioImplCopyWith<$Res> {
  __$$AudioImplCopyWithImpl(
      _$AudioImpl _value, $Res Function(_$AudioImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? url = freezed,
  }) {
    return _then(_$AudioImpl(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 2, adapterName: "AudioModelAdapter")
class _$AudioImpl extends _Audio {
  _$AudioImpl({@HiveField(0) this.title, @HiveField(1) this.url}) : super._();

  factory _$AudioImpl.fromJson(Map<String, dynamic> json) =>
      _$$AudioImplFromJson(json);

  @override
  @HiveField(0)
  final String? title;
  @override
  @HiveField(1)
  final String? url;

  @override
  String toString() {
    return 'AudioModel(title: $title, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AudioImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AudioImplCopyWith<_$AudioImpl> get copyWith =>
      __$$AudioImplCopyWithImpl<_$AudioImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AudioImplToJson(
      this,
    );
  }
}

abstract class _Audio extends AudioModel {
  factory _Audio(
      {@HiveField(0) final String? title,
      @HiveField(1) final String? url}) = _$AudioImpl;
  _Audio._() : super._();

  factory _Audio.fromJson(Map<String, dynamic> json) = _$AudioImpl.fromJson;

  @override
  @HiveField(0)
  String? get title;
  @override
  @HiveField(1)
  String? get url;
  @override
  @JsonKey(ignore: true)
  _$$AudioImplCopyWith<_$AudioImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
