// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'IevResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IevSubmissionResponseImpl _$$IevSubmissionResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$IevSubmissionResponseImpl(
      submittedBy: json['submittedBy'] as String?,
      longitude: (json['longitude'] as num?)?.toDouble(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      answers: (json['answers'] as List<dynamic>?)
          ?.map((e) => Answer.fromJson(e as Map<String, dynamic>))
          .toList(),
      antigenAnswers: (json['antigenAnswers'] as List<dynamic>?)
          ?.map((e) => AntigenAnswer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$IevSubmissionResponseImplToJson(
        _$IevSubmissionResponseImpl instance) =>
    <String, dynamic>{
      'submittedBy': instance.submittedBy,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'answers': instance.answers,
      'antigenAnswers': instance.antigenAnswers,
    };

_$AnswerImpl _$$AnswerImplFromJson(Map<String, dynamic> json) => _$AnswerImpl(
      questionId: json['questionId'] as String?,
      answerText: json['answerText'] as String?,
    );

Map<String, dynamic> _$$AnswerImplToJson(_$AnswerImpl instance) =>
    <String, dynamic>{
      'questionId': instance.questionId,
      'answerText': instance.answerText,
    };

_$AntigenAnswerImpl _$$AntigenAnswerImplFromJson(Map<String, dynamic> json) =>
    _$AntigenAnswerImpl(
      name: json['name'] as String?,
      response: json['response'] as String?,
    );

Map<String, dynamic> _$$AntigenAnswerImplToJson(_$AntigenAnswerImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'response': instance.response,
    };
