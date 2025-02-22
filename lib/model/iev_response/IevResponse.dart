import 'package:freezed_annotation/freezed_annotation.dart';

part 'IevResponse.freezed.dart';
part 'IevResponse.g.dart';

@freezed
class IevSubmissionResponse with _$IevSubmissionResponse {
  const factory IevSubmissionResponse({
    required String? submittedBy,
    required double? longitude,
    required double? latitude,
    required List<Answer>? answers,
    required List<AntigenAnswer>? antigenAnswers,
  }) = _IevSubmissionResponse;

  factory IevSubmissionResponse.fromJson(Map<String, dynamic> json) =>
      _$IevSubmissionResponseFromJson(json);
  //_$IevSubmissionFromJson(json);
}

@freezed
class Answer with _$Answer {
  const factory Answer({required String? questionId, required String? answerText}) = _Answer;

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);
}

@freezed
class AntigenAnswer with _$AntigenAnswer {
  const factory AntigenAnswer({required String? name, required String? response}) = _AntigenAnswer;

  factory AntigenAnswer.fromJson(Map<String, dynamic> json) => _$AntigenAnswerFromJson(json);
}
