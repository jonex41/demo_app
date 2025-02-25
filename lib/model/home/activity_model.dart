import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity_model.freezed.dart';
part 'activity_model.g.dart';

@freezed
class ActivityModel with _$ActivityModel {
  const factory ActivityModel({
    required int? recentSubmissions,
    int? totalPregnantWomen,
    int? households,
  }) = _ActivityModel;

  factory ActivityModel.fromJson(Map<String, dynamic> json) =>
      _$ActivityModelFromJson(json);

  // Map<String, dynamic> toJsodsn() => this.toJson();
}


@freezed
class SettlementModel with _$SettlementModel {
  const factory SettlementModel({
   
    String? name,
    String? teamCode,
  }) = _SettlementModel;

  factory SettlementModel.fromJson(Map<String, dynamic> json) =>
      _$SettlementModelFromJson(json);

  // Map<String, dynamic> toJsodsn() => this.toJson();
}
