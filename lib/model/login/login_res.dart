import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_res.freezed.dart';
part 'login_res.g.dart';

@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    required String? userId,
    required String? firstName,
    required String? middleName,
    required String? lastName,
    required String? phoneNumber,
    required String? email,
    required String? accessToken,
    required UserAccountResPonse? user,
    required String? refreshToken,
    required String? token,
   
    required int? status,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  // Map<String, dynamic> toJsodsn() => this.toJson();
}

@freezed
class UserAccountResPonse with _$UserAccountResPonse {
  const factory UserAccountResPonse({
    @JsonKey(name: "_id")
    required String? id,
    required int? balance,
    required String? accountNumber,
    required String? accountPin,
    required String? walletId,
    required String? referralCode,
    required String? accountType,
    required int? tier,
     required String? transactionPin,
    required String? atmCard,
  }) = _UserAccountResPonse;

  factory UserAccountResPonse.fromJson(Map<String, dynamic> json) =>
      _$UserAccountResPonseFromJson(json);

  // Map<String, dynamic> toJsodsn() => this.toJson();
}


/* 
String? id;
  int? balance;
  String? accountNumber;
  Null? accountPin;
  int? tier;
  Null? atmCard;

 */