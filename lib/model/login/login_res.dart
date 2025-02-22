import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_res.freezed.dart';
part 'login_res.g.dart';

@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    required String? id,
    required String? firstName,
    required String? lastName,
    required String? phone,
    required String? gender,
    required String? state,
    required String? lga,
    required String? ward,
    required String? settlement,
    required String? accessToken,
    required String? refreshToken,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  // Map<String, dynamic> toJsodsn() => this.toJson();
}

/* 
 "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
    "userId": "string",
    "firstName": "string",
    "lastName": "string",
    "phone": "string",
    "gender": "string",
    "state": "string",
    "lga": "string",
    "ward": "string",
    "settlement": "string",
    "accessToken": "string",
    "refreshToken": "string"
 */
