// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PersonImpl _$$PersonImplFromJson(Map<String, dynamic> json) => _$PersonImpl(
      uid: json['uid'] as String?,
      fullName: json['fullName'] as String?,
      email: json['email'] as String?,
      birthDate: json['birthDate'] as String?,
      photo: json['photo'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$$PersonImplToJson(_$PersonImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'fullName': instance.fullName,
      'email': instance.email,
      'birthDate': instance.birthDate,
      'photo': instance.photo,
      'phone': instance.phone,
    };
