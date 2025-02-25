// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ActivityModelImpl _$$ActivityModelImplFromJson(Map<String, dynamic> json) =>
    _$ActivityModelImpl(
      recentSubmissions: (json['recentSubmissions'] as num?)?.toInt(),
      totalPregnantWomen: (json['totalPregnantWomen'] as num?)?.toInt(),
      households: (json['households'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ActivityModelImplToJson(_$ActivityModelImpl instance) =>
    <String, dynamic>{
      'recentSubmissions': instance.recentSubmissions,
      'totalPregnantWomen': instance.totalPregnantWomen,
      'households': instance.households,
    };
