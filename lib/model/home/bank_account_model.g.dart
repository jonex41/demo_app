// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BankAccountModelImpl _$$BankAccountModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BankAccountModelImpl(
      id: json['id'] as String?,
      accountNumber: json['accountNumber'] as String?,
      accountName: json['accountName'] as String?,
      bankName: json['bankName'] as String?,
      fullName: json['fullName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      designation: json['designation'] as String?,
      teamCode: json['teamCode'] as String?,
      createdBy: json['createdBy'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$$BankAccountModelImplToJson(
        _$BankAccountModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'accountNumber': instance.accountNumber,
      'accountName': instance.accountName,
      'bankName': instance.bankName,
      'fullName': instance.fullName,
      'phoneNumber': instance.phoneNumber,
      'designation': instance.designation,
      'teamCode': instance.teamCode,
      'createdBy': instance.createdBy,
      'createdAt': instance.createdAt,
    };
