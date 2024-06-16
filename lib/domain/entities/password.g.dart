// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Password _$PasswordFromJson(Map<String, dynamic> json) => Password(
      id: (json['id'] as num?)?.toInt(),
      website: json['website'] as String?,
      identifier: json['identifier'] as String?,
      pwd: json['pwd'] as String?,
    )
      ..identifierVisible = json['identifierVisible'] as bool?
      ..pwdVisible = json['pwdVisible'] as bool?;

Map<String, dynamic> _$PasswordToJson(Password instance) => <String, dynamic>{
      'id': instance.id,
      'website': instance.website,
      'identifier': instance.identifier,
      'pwd': instance.pwd,
      'identifierVisible': instance.identifierVisible,
      'pwdVisible': instance.pwdVisible,
    };
