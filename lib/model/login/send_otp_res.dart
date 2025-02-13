import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_otp_res.freezed.dart';
part 'send_otp_res.g.dart';

@freezed
class SendOtpRes with _$SendOtpRes {
  const factory SendOtpRes({
    required String? pinId,
    required String? to,
    required String? smsStatus,
    required String? message,
  
  }) = _SendOtpRes;

  factory SendOtpRes.fromJson(Map<String, dynamic> json) =>
      _$SendOtpResFromJson(json);

  // Map<String, dynamic> toJsodsn() => this.toJson();
}