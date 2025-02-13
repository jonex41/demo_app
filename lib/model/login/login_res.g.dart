// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginResponseImpl _$$LoginResponseImplFromJson(Map<String, dynamic> json) =>
    _$LoginResponseImpl(
      userId: json['userId'] as String?,
      firstName: json['firstName'] as String?,
      middleName: json['middleName'] as String?,
      lastName: json['lastName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      email: json['email'] as String?,
      accessToken: json['accessToken'] as String?,
      user: json['user'] == null
          ? null
          : UserAccountResPonse.fromJson(json['user'] as Map<String, dynamic>),
      refreshToken: json['refreshToken'] as String?,
      token: json['token'] as String?,
      status: (json['status'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$LoginResponseImplToJson(_$LoginResponseImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'accessToken': instance.accessToken,
      'user': instance.user,
      'refreshToken': instance.refreshToken,
      'token': instance.token,
      'status': instance.status,
    };

_$UserAccountResPonseImpl _$$UserAccountResPonseImplFromJson(
        Map<String, dynamic> json) =>
    _$UserAccountResPonseImpl(
      id: json['_id'] as String?,
      balance: (json['balance'] as num?)?.toInt(),
      accountNumber: json['accountNumber'] as String?,
      accountPin: json['accountPin'] as String?,
      walletId: json['walletId'] as String?,
      referralCode: json['referralCode'] as String?,
      accountType: json['accountType'] as String?,
      tier: (json['tier'] as num?)?.toInt(),
      transactionPin: json['transactionPin'] as String?,
      atmCard: json['atmCard'] as String?,
    );

Map<String, dynamic> _$$UserAccountResPonseImplToJson(
        _$UserAccountResPonseImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'balance': instance.balance,
      'accountNumber': instance.accountNumber,
      'accountPin': instance.accountPin,
      'walletId': instance.walletId,
      'referralCode': instance.referralCode,
      'accountType': instance.accountType,
      'tier': instance.tier,
      'transactionPin': instance.transactionPin,
      'atmCard': instance.atmCard,
    };
