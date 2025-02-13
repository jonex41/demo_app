// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_transaction_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserTransactionModel _$UserTransactionModelFromJson(Map<String, dynamic> json) {
  return _UserTransactionModel.fromJson(json);
}

/// @nodoc
mixin _$UserTransactionModel {
  List<TransactionModel?> get results => throw _privateConstructorUsedError;
  int? get count => throw _privateConstructorUsedError;
  int? get totalPages => throw _privateConstructorUsedError;

  /// Serializes this UserTransactionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserTransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserTransactionModelCopyWith<UserTransactionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserTransactionModelCopyWith<$Res> {
  factory $UserTransactionModelCopyWith(UserTransactionModel value,
          $Res Function(UserTransactionModel) then) =
      _$UserTransactionModelCopyWithImpl<$Res, UserTransactionModel>;
  @useResult
  $Res call({List<TransactionModel?> results, int? count, int? totalPages});
}

/// @nodoc
class _$UserTransactionModelCopyWithImpl<$Res,
        $Val extends UserTransactionModel>
    implements $UserTransactionModelCopyWith<$Res> {
  _$UserTransactionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserTransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
    Object? count = freezed,
    Object? totalPages = freezed,
  }) {
    return _then(_value.copyWith(
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<TransactionModel?>,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPages: freezed == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserTransactionModelImplCopyWith<$Res>
    implements $UserTransactionModelCopyWith<$Res> {
  factory _$$UserTransactionModelImplCopyWith(_$UserTransactionModelImpl value,
          $Res Function(_$UserTransactionModelImpl) then) =
      __$$UserTransactionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TransactionModel?> results, int? count, int? totalPages});
}

/// @nodoc
class __$$UserTransactionModelImplCopyWithImpl<$Res>
    extends _$UserTransactionModelCopyWithImpl<$Res, _$UserTransactionModelImpl>
    implements _$$UserTransactionModelImplCopyWith<$Res> {
  __$$UserTransactionModelImplCopyWithImpl(_$UserTransactionModelImpl _value,
      $Res Function(_$UserTransactionModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserTransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
    Object? count = freezed,
    Object? totalPages = freezed,
  }) {
    return _then(_$UserTransactionModelImpl(
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<TransactionModel?>,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPages: freezed == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserTransactionModelImpl implements _UserTransactionModel {
  const _$UserTransactionModelImpl(
      {required final List<TransactionModel?> results,
      required this.count,
      required this.totalPages})
      : _results = results;

  factory _$UserTransactionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserTransactionModelImplFromJson(json);

  final List<TransactionModel?> _results;
  @override
  List<TransactionModel?> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  final int? count;
  @override
  final int? totalPages;

  @override
  String toString() {
    return 'UserTransactionModel(results: $results, count: $count, totalPages: $totalPages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserTransactionModelImpl &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_results), count, totalPages);

  /// Create a copy of UserTransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserTransactionModelImplCopyWith<_$UserTransactionModelImpl>
      get copyWith =>
          __$$UserTransactionModelImplCopyWithImpl<_$UserTransactionModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserTransactionModelImplToJson(
      this,
    );
  }
}

abstract class _UserTransactionModel implements UserTransactionModel {
  const factory _UserTransactionModel(
      {required final List<TransactionModel?> results,
      required final int? count,
      required final int? totalPages}) = _$UserTransactionModelImpl;

  factory _UserTransactionModel.fromJson(Map<String, dynamic> json) =
      _$UserTransactionModelImpl.fromJson;

  @override
  List<TransactionModel?> get results;
  @override
  int? get count;
  @override
  int? get totalPages;

  /// Create a copy of UserTransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserTransactionModelImplCopyWith<_$UserTransactionModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) {
  return _TransactionModel.fromJson(json);
}

/// @nodoc
mixin _$TransactionModel {
  String? get status => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  String? get transactionType => throw _privateConstructorUsedError;
  String? get paymentMode => throw _privateConstructorUsedError;
  String? get provider => throw _privateConstructorUsedError;
  int? get amount => throw _privateConstructorUsedError;
  String? get walletId => throw _privateConstructorUsedError;
  String? get fromWalletId => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  String? get business_number => throw _privateConstructorUsedError;
  String? get reference => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this TransactionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionModelCopyWith<TransactionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionModelCopyWith<$Res> {
  factory $TransactionModelCopyWith(
          TransactionModel value, $Res Function(TransactionModel) then) =
      _$TransactionModelCopyWithImpl<$Res, TransactionModel>;
  @useResult
  $Res call(
      {String? status,
      String? userId,
      String? transactionType,
      String? paymentMode,
      String? provider,
      int? amount,
      String? walletId,
      String? fromWalletId,
      String? description,
      String? date,
      String? business_number,
      String? reference,
      String? createdAt,
      String? updatedAt});
}

/// @nodoc
class _$TransactionModelCopyWithImpl<$Res, $Val extends TransactionModel>
    implements $TransactionModelCopyWith<$Res> {
  _$TransactionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? userId = freezed,
    Object? transactionType = freezed,
    Object? paymentMode = freezed,
    Object? provider = freezed,
    Object? amount = freezed,
    Object? walletId = freezed,
    Object? fromWalletId = freezed,
    Object? description = freezed,
    Object? date = freezed,
    Object? business_number = freezed,
    Object? reference = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionType: freezed == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMode: freezed == paymentMode
          ? _value.paymentMode
          : paymentMode // ignore: cast_nullable_to_non_nullable
              as String?,
      provider: freezed == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      walletId: freezed == walletId
          ? _value.walletId
          : walletId // ignore: cast_nullable_to_non_nullable
              as String?,
      fromWalletId: freezed == fromWalletId
          ? _value.fromWalletId
          : fromWalletId // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      business_number: freezed == business_number
          ? _value.business_number
          : business_number // ignore: cast_nullable_to_non_nullable
              as String?,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionModelImplCopyWith<$Res>
    implements $TransactionModelCopyWith<$Res> {
  factory _$$TransactionModelImplCopyWith(_$TransactionModelImpl value,
          $Res Function(_$TransactionModelImpl) then) =
      __$$TransactionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? status,
      String? userId,
      String? transactionType,
      String? paymentMode,
      String? provider,
      int? amount,
      String? walletId,
      String? fromWalletId,
      String? description,
      String? date,
      String? business_number,
      String? reference,
      String? createdAt,
      String? updatedAt});
}

/// @nodoc
class __$$TransactionModelImplCopyWithImpl<$Res>
    extends _$TransactionModelCopyWithImpl<$Res, _$TransactionModelImpl>
    implements _$$TransactionModelImplCopyWith<$Res> {
  __$$TransactionModelImplCopyWithImpl(_$TransactionModelImpl _value,
      $Res Function(_$TransactionModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? userId = freezed,
    Object? transactionType = freezed,
    Object? paymentMode = freezed,
    Object? provider = freezed,
    Object? amount = freezed,
    Object? walletId = freezed,
    Object? fromWalletId = freezed,
    Object? description = freezed,
    Object? date = freezed,
    Object? business_number = freezed,
    Object? reference = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$TransactionModelImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionType: freezed == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMode: freezed == paymentMode
          ? _value.paymentMode
          : paymentMode // ignore: cast_nullable_to_non_nullable
              as String?,
      provider: freezed == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      walletId: freezed == walletId
          ? _value.walletId
          : walletId // ignore: cast_nullable_to_non_nullable
              as String?,
      fromWalletId: freezed == fromWalletId
          ? _value.fromWalletId
          : fromWalletId // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      business_number: freezed == business_number
          ? _value.business_number
          : business_number // ignore: cast_nullable_to_non_nullable
              as String?,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionModelImpl implements _TransactionModel {
  const _$TransactionModelImpl(
      {required this.status,
      required this.userId,
      required this.transactionType,
      required this.paymentMode,
      required this.provider,
      required this.amount,
      required this.walletId,
      required this.fromWalletId,
      required this.description,
      required this.date,
      required this.business_number,
      required this.reference,
      required this.createdAt,
      required this.updatedAt});

  factory _$TransactionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionModelImplFromJson(json);

  @override
  final String? status;
  @override
  final String? userId;
  @override
  final String? transactionType;
  @override
  final String? paymentMode;
  @override
  final String? provider;
  @override
  final int? amount;
  @override
  final String? walletId;
  @override
  final String? fromWalletId;
  @override
  final String? description;
  @override
  final String? date;
  @override
  final String? business_number;
  @override
  final String? reference;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;

  @override
  String toString() {
    return 'TransactionModel(status: $status, userId: $userId, transactionType: $transactionType, paymentMode: $paymentMode, provider: $provider, amount: $amount, walletId: $walletId, fromWalletId: $fromWalletId, description: $description, date: $date, business_number: $business_number, reference: $reference, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.transactionType, transactionType) ||
                other.transactionType == transactionType) &&
            (identical(other.paymentMode, paymentMode) ||
                other.paymentMode == paymentMode) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.walletId, walletId) ||
                other.walletId == walletId) &&
            (identical(other.fromWalletId, fromWalletId) ||
                other.fromWalletId == fromWalletId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.business_number, business_number) ||
                other.business_number == business_number) &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      userId,
      transactionType,
      paymentMode,
      provider,
      amount,
      walletId,
      fromWalletId,
      description,
      date,
      business_number,
      reference,
      createdAt,
      updatedAt);

  /// Create a copy of TransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionModelImplCopyWith<_$TransactionModelImpl> get copyWith =>
      __$$TransactionModelImplCopyWithImpl<_$TransactionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionModelImplToJson(
      this,
    );
  }
}

abstract class _TransactionModel implements TransactionModel {
  const factory _TransactionModel(
      {required final String? status,
      required final String? userId,
      required final String? transactionType,
      required final String? paymentMode,
      required final String? provider,
      required final int? amount,
      required final String? walletId,
      required final String? fromWalletId,
      required final String? description,
      required final String? date,
      required final String? business_number,
      required final String? reference,
      required final String? createdAt,
      required final String? updatedAt}) = _$TransactionModelImpl;

  factory _TransactionModel.fromJson(Map<String, dynamic> json) =
      _$TransactionModelImpl.fromJson;

  @override
  String? get status;
  @override
  String? get userId;
  @override
  String? get transactionType;
  @override
  String? get paymentMode;
  @override
  String? get provider;
  @override
  int? get amount;
  @override
  String? get walletId;
  @override
  String? get fromWalletId;
  @override
  String? get description;
  @override
  String? get date;
  @override
  String? get business_number;
  @override
  String? get reference;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;

  /// Create a copy of TransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionModelImplCopyWith<_$TransactionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
