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

_$SettlementModelImpl _$$SettlementModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SettlementModelImpl(
      name: json['name'] as String?,
      teamCode: json['teamCode'] as String?,
    );

Map<String, dynamic> _$$SettlementModelImplToJson(
        _$SettlementModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'teamCode': instance.teamCode,
    };
