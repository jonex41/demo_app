import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_user_model.freezed.dart';
part 'home_user_model.g.dart';

@freezed
class HomeUserModel with _$HomeUserModel {
  const factory HomeUserModel({
    required String? verifiedEmail,
    required String? kyc,
    required String? rrrrrrrr,
    required String? phoneNumber,
    required String? verifiedPhoneNumber,
    required String? referralCode,
    required String? walletId,
    required String? accountType,
    required String? status,
    required KycInfo? kycInfo,
    required String? transactionPin,
  }) = _HomeUserModel;

  factory HomeUserModel.fromJson(Map<String, dynamic> json) =>
      _$HomeUserModelFromJson(json);

  // Map<String, dynamic> toJsodsn() => this.toJson();
}

@freezed
class KycInfo with _$KycInfo {
  const factory KycInfo({
    required String? fullname,
    required String? dob,
    required String? gender,
    required String? phoneNumber,
    required String? kycType,
  }) = _KycInfo;

  factory KycInfo.fromJson(Map<String, dynamic> json) =>
      _$KycInfoFromJson(json);

  // Map<String, dynamic> toJsodsn() => this.toJson();
}
