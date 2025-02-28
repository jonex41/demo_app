import 'package:freezed_annotation/freezed_annotation.dart';

part 'IevSubmissionNewResponse.freezed.dart';
part 'IevSubmissionNewResponse.g.dart';

@freezed
class IevSubmissionNewResponse with _$IevSubmissionNewResponse {
  const factory IevSubmissionNewResponse({
    required String? submittedBy,
    required double? longitude,
    required double? latitude,
  }) = _IevSubmissionNewResponse;

  factory IevSubmissionNewResponse.fromJson(Map<String, dynamic> json) =>
      _$IevSubmissionNewResponseFromJson(json);
//_$IevSubmissionFromJson(json);
}
