// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_otp_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SendOtpResImpl _$$SendOtpResImplFromJson(Map<String, dynamic> json) =>
    _$SendOtpResImpl(
      pinId: json['pinId'] as String?,
      to: json['to'] as String?,
      smsStatus: json['smsStatus'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$SendOtpResImplToJson(_$SendOtpResImpl instance) =>
    <String, dynamic>{
      'pinId': instance.pinId,
      'to': instance.to,
      'smsStatus': instance.smsStatus,
      'message': instance.message,
    };
