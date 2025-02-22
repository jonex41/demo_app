// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginResponseImpl _$$LoginResponseImplFromJson(Map<String, dynamic> json) =>
    _$LoginResponseImpl(
      id: json['id'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      phone: json['phone'] as String?,
      gender: json['gender'] as String?,
      state: json['state'] as String?,
      lga: json['lga'] as String?,
      ward: json['ward'] as String?,
      settlement: json['settlement'] as String?,
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
    );

Map<String, dynamic> _$$LoginResponseImplToJson(_$LoginResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'phone': instance.phone,
      'gender': instance.gender,
      'state': instance.state,
      'lga': instance.lga,
      'ward': instance.ward,
      'settlement': instance.settlement,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
