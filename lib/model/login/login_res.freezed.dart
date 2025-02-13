// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) {
  return _LoginResponse.fromJson(json);
}

/// @nodoc
mixin _$LoginResponse {
  String? get userId => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get middleName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get accessToken => throw _privateConstructorUsedError;
  UserAccountResPonse? get user => throw _privateConstructorUsedError;
  String? get refreshToken => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;
  int? get status => throw _privateConstructorUsedError;

  /// Serializes this LoginResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginResponseCopyWith<LoginResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginResponseCopyWith<$Res> {
  factory $LoginResponseCopyWith(
          LoginResponse value, $Res Function(LoginResponse) then) =
      _$LoginResponseCopyWithImpl<$Res, LoginResponse>;
  @useResult
  $Res call(
      {String? userId,
      String? firstName,
      String? middleName,
      String? lastName,
      String? phoneNumber,
      String? email,
      String? accessToken,
      UserAccountResPonse? user,
      String? refreshToken,
      String? token,
      int? status});

  $UserAccountResPonseCopyWith<$Res>? get user;
}

/// @nodoc
class _$LoginResponseCopyWithImpl<$Res, $Val extends LoginResponse>
    implements $LoginResponseCopyWith<$Res> {
  _$LoginResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? firstName = freezed,
    Object? middleName = freezed,
    Object? lastName = freezed,
    Object? phoneNumber = freezed,
    Object? email = freezed,
    Object? accessToken = freezed,
    Object? user = freezed,
    Object? refreshToken = freezed,
    Object? token = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      middleName: freezed == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserAccountResPonse?,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserAccountResPonseCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserAccountResPonseCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LoginResponseImplCopyWith<$Res>
    implements $LoginResponseCopyWith<$Res> {
  factory _$$LoginResponseImplCopyWith(
          _$LoginResponseImpl value, $Res Function(_$LoginResponseImpl) then) =
      __$$LoginResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? userId,
      String? firstName,
      String? middleName,
      String? lastName,
      String? phoneNumber,
      String? email,
      String? accessToken,
      UserAccountResPonse? user,
      String? refreshToken,
      String? token,
      int? status});

  @override
  $UserAccountResPonseCopyWith<$Res>? get user;
}

/// @nodoc
class __$$LoginResponseImplCopyWithImpl<$Res>
    extends _$LoginResponseCopyWithImpl<$Res, _$LoginResponseImpl>
    implements _$$LoginResponseImplCopyWith<$Res> {
  __$$LoginResponseImplCopyWithImpl(
      _$LoginResponseImpl _value, $Res Function(_$LoginResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? firstName = freezed,
    Object? middleName = freezed,
    Object? lastName = freezed,
    Object? phoneNumber = freezed,
    Object? email = freezed,
    Object? accessToken = freezed,
    Object? user = freezed,
    Object? refreshToken = freezed,
    Object? token = freezed,
    Object? status = freezed,
  }) {
    return _then(_$LoginResponseImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      middleName: freezed == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserAccountResPonse?,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginResponseImpl implements _LoginResponse {
  const _$LoginResponseImpl(
      {required this.userId,
      required this.firstName,
      required this.middleName,
      required this.lastName,
      required this.phoneNumber,
      required this.email,
      required this.accessToken,
      required this.user,
      required this.refreshToken,
      required this.token,
      required this.status});

  factory _$LoginResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginResponseImplFromJson(json);

  @override
  final String? userId;
  @override
  final String? firstName;
  @override
  final String? middleName;
  @override
  final String? lastName;
  @override
  final String? phoneNumber;
  @override
  final String? email;
  @override
  final String? accessToken;
  @override
  final UserAccountResPonse? user;
  @override
  final String? refreshToken;
  @override
  final String? token;
  @override
  final int? status;

  @override
  String toString() {
    return 'LoginResponse(userId: $userId, firstName: $firstName, middleName: $middleName, lastName: $lastName, phoneNumber: $phoneNumber, email: $email, accessToken: $accessToken, user: $user, refreshToken: $refreshToken, token: $token, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginResponseImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.middleName, middleName) ||
                other.middleName == middleName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      firstName,
      middleName,
      lastName,
      phoneNumber,
      email,
      accessToken,
      user,
      refreshToken,
      token,
      status);

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginResponseImplCopyWith<_$LoginResponseImpl> get copyWith =>
      __$$LoginResponseImplCopyWithImpl<_$LoginResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginResponseImplToJson(
      this,
    );
  }
}

abstract class _LoginResponse implements LoginResponse {
  const factory _LoginResponse(
      {required final String? userId,
      required final String? firstName,
      required final String? middleName,
      required final String? lastName,
      required final String? phoneNumber,
      required final String? email,
      required final String? accessToken,
      required final UserAccountResPonse? user,
      required final String? refreshToken,
      required final String? token,
      required final int? status}) = _$LoginResponseImpl;

  factory _LoginResponse.fromJson(Map<String, dynamic> json) =
      _$LoginResponseImpl.fromJson;

  @override
  String? get userId;
  @override
  String? get firstName;
  @override
  String? get middleName;
  @override
  String? get lastName;
  @override
  String? get phoneNumber;
  @override
  String? get email;
  @override
  String? get accessToken;
  @override
  UserAccountResPonse? get user;
  @override
  String? get refreshToken;
  @override
  String? get token;
  @override
  int? get status;

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginResponseImplCopyWith<_$LoginResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserAccountResPonse _$UserAccountResPonseFromJson(Map<String, dynamic> json) {
  return _UserAccountResPonse.fromJson(json);
}

/// @nodoc
mixin _$UserAccountResPonse {
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  int? get balance => throw _privateConstructorUsedError;
  String? get accountNumber => throw _privateConstructorUsedError;
  String? get accountPin => throw _privateConstructorUsedError;
  String? get walletId => throw _privateConstructorUsedError;
  String? get referralCode => throw _privateConstructorUsedError;
  String? get accountType => throw _privateConstructorUsedError;
  int? get tier => throw _privateConstructorUsedError;
  String? get transactionPin => throw _privateConstructorUsedError;
  String? get atmCard => throw _privateConstructorUsedError;

  /// Serializes this UserAccountResPonse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserAccountResPonse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserAccountResPonseCopyWith<UserAccountResPonse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAccountResPonseCopyWith<$Res> {
  factory $UserAccountResPonseCopyWith(
          UserAccountResPonse value, $Res Function(UserAccountResPonse) then) =
      _$UserAccountResPonseCopyWithImpl<$Res, UserAccountResPonse>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      int? balance,
      String? accountNumber,
      String? accountPin,
      String? walletId,
      String? referralCode,
      String? accountType,
      int? tier,
      String? transactionPin,
      String? atmCard});
}

/// @nodoc
class _$UserAccountResPonseCopyWithImpl<$Res, $Val extends UserAccountResPonse>
    implements $UserAccountResPonseCopyWith<$Res> {
  _$UserAccountResPonseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserAccountResPonse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? balance = freezed,
    Object? accountNumber = freezed,
    Object? accountPin = freezed,
    Object? walletId = freezed,
    Object? referralCode = freezed,
    Object? accountType = freezed,
    Object? tier = freezed,
    Object? transactionPin = freezed,
    Object? atmCard = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int?,
      accountNumber: freezed == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      accountPin: freezed == accountPin
          ? _value.accountPin
          : accountPin // ignore: cast_nullable_to_non_nullable
              as String?,
      walletId: freezed == walletId
          ? _value.walletId
          : walletId // ignore: cast_nullable_to_non_nullable
              as String?,
      referralCode: freezed == referralCode
          ? _value.referralCode
          : referralCode // ignore: cast_nullable_to_non_nullable
              as String?,
      accountType: freezed == accountType
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as String?,
      tier: freezed == tier
          ? _value.tier
          : tier // ignore: cast_nullable_to_non_nullable
              as int?,
      transactionPin: freezed == transactionPin
          ? _value.transactionPin
          : transactionPin // ignore: cast_nullable_to_non_nullable
              as String?,
      atmCard: freezed == atmCard
          ? _value.atmCard
          : atmCard // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserAccountResPonseImplCopyWith<$Res>
    implements $UserAccountResPonseCopyWith<$Res> {
  factory _$$UserAccountResPonseImplCopyWith(_$UserAccountResPonseImpl value,
          $Res Function(_$UserAccountResPonseImpl) then) =
      __$$UserAccountResPonseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      int? balance,
      String? accountNumber,
      String? accountPin,
      String? walletId,
      String? referralCode,
      String? accountType,
      int? tier,
      String? transactionPin,
      String? atmCard});
}

/// @nodoc
class __$$UserAccountResPonseImplCopyWithImpl<$Res>
    extends _$UserAccountResPonseCopyWithImpl<$Res, _$UserAccountResPonseImpl>
    implements _$$UserAccountResPonseImplCopyWith<$Res> {
  __$$UserAccountResPonseImplCopyWithImpl(_$UserAccountResPonseImpl _value,
      $Res Function(_$UserAccountResPonseImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserAccountResPonse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? balance = freezed,
    Object? accountNumber = freezed,
    Object? accountPin = freezed,
    Object? walletId = freezed,
    Object? referralCode = freezed,
    Object? accountType = freezed,
    Object? tier = freezed,
    Object? transactionPin = freezed,
    Object? atmCard = freezed,
  }) {
    return _then(_$UserAccountResPonseImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int?,
      accountNumber: freezed == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      accountPin: freezed == accountPin
          ? _value.accountPin
          : accountPin // ignore: cast_nullable_to_non_nullable
              as String?,
      walletId: freezed == walletId
          ? _value.walletId
          : walletId // ignore: cast_nullable_to_non_nullable
              as String?,
      referralCode: freezed == referralCode
          ? _value.referralCode
          : referralCode // ignore: cast_nullable_to_non_nullable
              as String?,
      accountType: freezed == accountType
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as String?,
      tier: freezed == tier
          ? _value.tier
          : tier // ignore: cast_nullable_to_non_nullable
              as int?,
      transactionPin: freezed == transactionPin
          ? _value.transactionPin
          : transactionPin // ignore: cast_nullable_to_non_nullable
              as String?,
      atmCard: freezed == atmCard
          ? _value.atmCard
          : atmCard // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserAccountResPonseImpl implements _UserAccountResPonse {
  const _$UserAccountResPonseImpl(
      {@JsonKey(name: "_id") required this.id,
      required this.balance,
      required this.accountNumber,
      required this.accountPin,
      required this.walletId,
      required this.referralCode,
      required this.accountType,
      required this.tier,
      required this.transactionPin,
      required this.atmCard});

  factory _$UserAccountResPonseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserAccountResPonseImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String? id;
  @override
  final int? balance;
  @override
  final String? accountNumber;
  @override
  final String? accountPin;
  @override
  final String? walletId;
  @override
  final String? referralCode;
  @override
  final String? accountType;
  @override
  final int? tier;
  @override
  final String? transactionPin;
  @override
  final String? atmCard;

  @override
  String toString() {
    return 'UserAccountResPonse(id: $id, balance: $balance, accountNumber: $accountNumber, accountPin: $accountPin, walletId: $walletId, referralCode: $referralCode, accountType: $accountType, tier: $tier, transactionPin: $transactionPin, atmCard: $atmCard)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserAccountResPonseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.accountNumber, accountNumber) ||
                other.accountNumber == accountNumber) &&
            (identical(other.accountPin, accountPin) ||
                other.accountPin == accountPin) &&
            (identical(other.walletId, walletId) ||
                other.walletId == walletId) &&
            (identical(other.referralCode, referralCode) ||
                other.referralCode == referralCode) &&
            (identical(other.accountType, accountType) ||
                other.accountType == accountType) &&
            (identical(other.tier, tier) || other.tier == tier) &&
            (identical(other.transactionPin, transactionPin) ||
                other.transactionPin == transactionPin) &&
            (identical(other.atmCard, atmCard) || other.atmCard == atmCard));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      balance,
      accountNumber,
      accountPin,
      walletId,
      referralCode,
      accountType,
      tier,
      transactionPin,
      atmCard);

  /// Create a copy of UserAccountResPonse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserAccountResPonseImplCopyWith<_$UserAccountResPonseImpl> get copyWith =>
      __$$UserAccountResPonseImplCopyWithImpl<_$UserAccountResPonseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserAccountResPonseImplToJson(
      this,
    );
  }
}

abstract class _UserAccountResPonse implements UserAccountResPonse {
  const factory _UserAccountResPonse(
      {@JsonKey(name: "_id") required final String? id,
      required final int? balance,
      required final String? accountNumber,
      required final String? accountPin,
      required final String? walletId,
      required final String? referralCode,
      required final String? accountType,
      required final int? tier,
      required final String? transactionPin,
      required final String? atmCard}) = _$UserAccountResPonseImpl;

  factory _UserAccountResPonse.fromJson(Map<String, dynamic> json) =
      _$UserAccountResPonseImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String? get id;
  @override
  int? get balance;
  @override
  String? get accountNumber;
  @override
  String? get accountPin;
  @override
  String? get walletId;
  @override
  String? get referralCode;
  @override
  String? get accountType;
  @override
  int? get tier;
  @override
  String? get transactionPin;
  @override
  String? get atmCard;

  /// Create a copy of UserAccountResPonse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserAccountResPonseImplCopyWith<_$UserAccountResPonseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
