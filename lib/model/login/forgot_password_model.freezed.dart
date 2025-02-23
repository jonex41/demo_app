// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_password_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ForgotPasswordModel _$ForgotPasswordModelFromJson(Map<String, dynamic> json) {
  return _ForgotPasswordModel.fromJson(json);
}

/// @nodoc
mixin _$ForgotPasswordModel {
  String? get pinId => throw _privateConstructorUsedError;
  String? get to => throw _privateConstructorUsedError;
  String? get smsStatus => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String? get verified => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ForgotPasswordModelCopyWith<ForgotPasswordModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPasswordModelCopyWith<$Res> {
  factory $ForgotPasswordModelCopyWith(
          ForgotPasswordModel value, $Res Function(ForgotPasswordModel) then) =
      _$ForgotPasswordModelCopyWithImpl<$Res, ForgotPasswordModel>;
  @useResult
  $Res call(
      {String? pinId,
      String? to,
      String? smsStatus,
      String? message,
      String? verified});
}

/// @nodoc
class _$ForgotPasswordModelCopyWithImpl<$Res, $Val extends ForgotPasswordModel>
    implements $ForgotPasswordModelCopyWith<$Res> {
  _$ForgotPasswordModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pinId = freezed,
    Object? to = freezed,
    Object? smsStatus = freezed,
    Object? message = freezed,
    Object? verified = freezed,
  }) {
    return _then(_value.copyWith(
      pinId: freezed == pinId
          ? _value.pinId
          : pinId // ignore: cast_nullable_to_non_nullable
              as String?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String?,
      smsStatus: freezed == smsStatus
          ? _value.smsStatus
          : smsStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      verified: freezed == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ForgotPasswordModelImplCopyWith<$Res>
    implements $ForgotPasswordModelCopyWith<$Res> {
  factory _$$ForgotPasswordModelImplCopyWith(_$ForgotPasswordModelImpl value,
          $Res Function(_$ForgotPasswordModelImpl) then) =
      __$$ForgotPasswordModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? pinId,
      String? to,
      String? smsStatus,
      String? message,
      String? verified});
}

/// @nodoc
class __$$ForgotPasswordModelImplCopyWithImpl<$Res>
    extends _$ForgotPasswordModelCopyWithImpl<$Res, _$ForgotPasswordModelImpl>
    implements _$$ForgotPasswordModelImplCopyWith<$Res> {
  __$$ForgotPasswordModelImplCopyWithImpl(_$ForgotPasswordModelImpl _value,
      $Res Function(_$ForgotPasswordModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pinId = freezed,
    Object? to = freezed,
    Object? smsStatus = freezed,
    Object? message = freezed,
    Object? verified = freezed,
  }) {
    return _then(_$ForgotPasswordModelImpl(
      pinId: freezed == pinId
          ? _value.pinId
          : pinId // ignore: cast_nullable_to_non_nullable
              as String?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String?,
      smsStatus: freezed == smsStatus
          ? _value.smsStatus
          : smsStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      verified: freezed == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ForgotPasswordModelImpl implements _ForgotPasswordModel {
  const _$ForgotPasswordModelImpl(
      {required this.pinId,
      required this.to,
      required this.smsStatus,
      required this.message,
      required this.verified});

  factory _$ForgotPasswordModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ForgotPasswordModelImplFromJson(json);

  @override
  final String? pinId;
  @override
  final String? to;
  @override
  final String? smsStatus;
  @override
  final String? message;
  @override
  final String? verified;

  @override
  String toString() {
    return 'ForgotPasswordModel(pinId: $pinId, to: $to, smsStatus: $smsStatus, message: $message, verified: $verified)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgotPasswordModelImpl &&
            (identical(other.pinId, pinId) || other.pinId == pinId) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.smsStatus, smsStatus) ||
                other.smsStatus == smsStatus) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.verified, verified) ||
                other.verified == verified));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, pinId, to, smsStatus, message, verified);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ForgotPasswordModelImplCopyWith<_$ForgotPasswordModelImpl> get copyWith =>
      __$$ForgotPasswordModelImplCopyWithImpl<_$ForgotPasswordModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ForgotPasswordModelImplToJson(
      this,
    );
  }
}

abstract class _ForgotPasswordModel implements ForgotPasswordModel {
  const factory _ForgotPasswordModel(
      {required final String? pinId,
      required final String? to,
      required final String? smsStatus,
      required final String? message,
      required final String? verified}) = _$ForgotPasswordModelImpl;

  factory _ForgotPasswordModel.fromJson(Map<String, dynamic> json) =
      _$ForgotPasswordModelImpl.fromJson;

  @override
  String? get pinId;
  @override
  String? get to;
  @override
  String? get smsStatus;
  @override
  String? get message;
  @override
  String? get verified;
  @override
  @JsonKey(ignore: true)
  _$$ForgotPasswordModelImplCopyWith<_$ForgotPasswordModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
