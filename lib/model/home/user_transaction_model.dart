import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_transaction_model.freezed.dart';
part 'user_transaction_model.g.dart';

@freezed
class UserTransactionModel with _$UserTransactionModel {
  const factory UserTransactionModel({
    required List<TransactionModel?> results,
    required int? count,
    required int? totalPages,
  }) = _UserTransactionModel;

  factory UserTransactionModel.fromJson(Map<String, dynamic> json) =>
      _$UserTransactionModelFromJson(json);

  // Map<String, dynamic> toJsodsn() => this.toJson();
}



@freezed
class TransactionModel with _$TransactionModel {
  const factory TransactionModel({
    required String? status,
    required String? userId,
    required String? transactionType,
    required String? paymentMode,
    required String? provider,
    required int? amount,
    required String? walletId,
    required String? fromWalletId,
    required String? description,
    required String? date,
    required String? business_number,
    required String? reference,
    required String? createdAt,
    required String? updatedAt,
  }) = _TransactionModel;

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);

  // Map<String, dynamic> toJsodsn() => this.toJson();
}
