// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'IevSubmissionNewResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IevSubmissionNewResponseImpl _$$IevSubmissionNewResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$IevSubmissionNewResponseImpl(
      submittedBy: json['submittedBy'] as String?,
      longitude: (json['longitude'] as num?)?.toDouble(),
      latitude: (json['latitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$IevSubmissionNewResponseImplToJson(
        _$IevSubmissionNewResponseImpl instance) =>
    <String, dynamic>{
      'submittedBy': instance.submittedBy,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
    };
