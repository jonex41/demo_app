// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ForgotPasswordModelImpl _$$ForgotPasswordModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ForgotPasswordModelImpl(
      pinId: json['pinId'] as String?,
      to: json['to'] as String?,
      smsStatus: json['smsStatus'] as String?,
      message: json['message'] as String?,
      verified: json['verified'] as String?,
    );

Map<String, dynamic> _$$ForgotPasswordModelImplToJson(
        _$ForgotPasswordModelImpl instance) =>
    <String, dynamic>{
      'pinId': instance.pinId,
      'to': instance.to,
      'smsStatus': instance.smsStatus,
      'message': instance.message,
      'verified': instance.verified,
    };
