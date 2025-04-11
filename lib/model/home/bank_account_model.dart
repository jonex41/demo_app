import 'package:freezed_annotation/freezed_annotation.dart';

part 'bank_account_model.freezed.dart';
part 'bank_account_model.g.dart';

@freezed
class BankAccountModel with _$BankAccountModel {
  const factory BankAccountModel({
    required String? id,
    required String? accountNumber,
    required String? accountName,
    required String? bankName,
    required String? fullName,
    required String? phoneNumber,
    required String? designation,
    required String? teamCode,
    required String? createdBy,
    required String? createdAt,
  }) = _BankAccountModel;

  factory BankAccountModel.fromJson(Map<String, dynamic> json) =>
      _$BankAccountModelFromJson(json);
}
