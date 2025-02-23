import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_password_model.freezed.dart';
part 'forgot_password_model.g.dart';

@freezed
class ForgotPasswordModel with _$ForgotPasswordModel {
  const factory ForgotPasswordModel({
    required String? pinId,
    required String? to,
    required String? smsStatus,
    required String? message,
    required String? verified,
  }) = _ForgotPasswordModel;

  factory ForgotPasswordModel.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordModelFromJson(json);

  // Map<String, dynamic> toJsodsn() => this.toJson();
}
