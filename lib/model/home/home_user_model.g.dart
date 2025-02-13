// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HomeUserModelImpl _$$HomeUserModelImplFromJson(Map<String, dynamic> json) =>
    _$HomeUserModelImpl(
      verifiedEmail: json['verifiedEmail'] as String?,
      kyc: json['kyc'] as String?,
      rrrrrrrr: json['rrrrrrrr'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      verifiedPhoneNumber: json['verifiedPhoneNumber'] as String?,
      referralCode: json['referralCode'] as String?,
      walletId: json['walletId'] as String?,
      accountType: json['accountType'] as String?,
      status: json['status'] as String?,
      kycInfo: json['kycInfo'] == null
          ? null
          : KycInfo.fromJson(json['kycInfo'] as Map<String, dynamic>),
      transactionPin: json['transactionPin'] as String?,
    );

Map<String, dynamic> _$$HomeUserModelImplToJson(_$HomeUserModelImpl instance) =>
    <String, dynamic>{
      'verifiedEmail': instance.verifiedEmail,
      'kyc': instance.kyc,
      'rrrrrrrr': instance.rrrrrrrr,
      'phoneNumber': instance.phoneNumber,
      'verifiedPhoneNumber': instance.verifiedPhoneNumber,
      'referralCode': instance.referralCode,
      'walletId': instance.walletId,
      'accountType': instance.accountType,
      'status': instance.status,
      'kycInfo': instance.kycInfo,
      'transactionPin': instance.transactionPin,
    };

_$KycInfoImpl _$$KycInfoImplFromJson(Map<String, dynamic> json) =>
    _$KycInfoImpl(
      fullname: json['fullname'] as String?,
      dob: json['dob'] as String?,
      gender: json['gender'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      kycType: json['kycType'] as String?,
    );

Map<String, dynamic> _$$KycInfoImplToJson(_$KycInfoImpl instance) =>
    <String, dynamic>{
      'fullname': instance.fullname,
      'dob': instance.dob,
      'gender': instance.gender,
      'phoneNumber': instance.phoneNumber,
      'kycType': instance.kycType,
    };
