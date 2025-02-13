// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserTransactionModelImpl _$$UserTransactionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserTransactionModelImpl(
      results: (json['results'] as List<dynamic>)
          .map((e) => e == null
              ? null
              : TransactionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: (json['count'] as num?)?.toInt(),
      totalPages: (json['totalPages'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$UserTransactionModelImplToJson(
        _$UserTransactionModelImpl instance) =>
    <String, dynamic>{
      'results': instance.results,
      'count': instance.count,
      'totalPages': instance.totalPages,
    };

_$TransactionModelImpl _$$TransactionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionModelImpl(
      status: json['status'] as String?,
      userId: json['userId'] as String?,
      transactionType: json['transactionType'] as String?,
      paymentMode: json['paymentMode'] as String?,
      provider: json['provider'] as String?,
      amount: (json['amount'] as num?)?.toInt(),
      walletId: json['walletId'] as String?,
      fromWalletId: json['fromWalletId'] as String?,
      description: json['description'] as String?,
      date: json['date'] as String?,
      business_number: json['business_number'] as String?,
      reference: json['reference'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$TransactionModelImplToJson(
        _$TransactionModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'userId': instance.userId,
      'transactionType': instance.transactionType,
      'paymentMode': instance.paymentMode,
      'provider': instance.provider,
      'amount': instance.amount,
      'walletId': instance.walletId,
      'fromWalletId': instance.fromWalletId,
      'description': instance.description,
      'date': instance.date,
      'business_number': instance.business_number,
      'reference': instance.reference,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
