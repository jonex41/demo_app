// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'send_otp_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SendOtpRes _$SendOtpResFromJson(Map<String, dynamic> json) {
  return _SendOtpRes.fromJson(json);
}

/// @nodoc
mixin _$SendOtpRes {
  String? get pinId => throw _privateConstructorUsedError;
  String? get to => throw _privateConstructorUsedError;
  String? get smsStatus => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  /// Serializes this SendOtpRes to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SendOtpRes
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SendOtpResCopyWith<SendOtpRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendOtpResCopyWith<$Res> {
  factory $SendOtpResCopyWith(
          SendOtpRes value, $Res Function(SendOtpRes) then) =
      _$SendOtpResCopyWithImpl<$Res, SendOtpRes>;
  @useResult
  $Res call({String? pinId, String? to, String? smsStatus, String? message});
}

/// @nodoc
class _$SendOtpResCopyWithImpl<$Res, $Val extends SendOtpRes>
    implements $SendOtpResCopyWith<$Res> {
  _$SendOtpResCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SendOtpRes
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pinId = freezed,
    Object? to = freezed,
    Object? smsStatus = freezed,
    Object? message = freezed,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SendOtpResImplCopyWith<$Res>
    implements $SendOtpResCopyWith<$Res> {
  factory _$$SendOtpResImplCopyWith(
          _$SendOtpResImpl value, $Res Function(_$SendOtpResImpl) then) =
      __$$SendOtpResImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? pinId, String? to, String? smsStatus, String? message});
}

/// @nodoc
class __$$SendOtpResImplCopyWithImpl<$Res>
    extends _$SendOtpResCopyWithImpl<$Res, _$SendOtpResImpl>
    implements _$$SendOtpResImplCopyWith<$Res> {
  __$$SendOtpResImplCopyWithImpl(
      _$SendOtpResImpl _value, $Res Function(_$SendOtpResImpl) _then)
      : super(_value, _then);

  /// Create a copy of SendOtpRes
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pinId = freezed,
    Object? to = freezed,
    Object? smsStatus = freezed,
    Object? message = freezed,
  }) {
    return _then(_$SendOtpResImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SendOtpResImpl implements _SendOtpRes {
  const _$SendOtpResImpl(
      {required this.pinId,
      required this.to,
      required this.smsStatus,
      required this.message});

  factory _$SendOtpResImpl.fromJson(Map<String, dynamic> json) =>
      _$$SendOtpResImplFromJson(json);

  @override
  final String? pinId;
  @override
  final String? to;
  @override
  final String? smsStatus;
  @override
  final String? message;

  @override
  String toString() {
    return 'SendOtpRes(pinId: $pinId, to: $to, smsStatus: $smsStatus, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendOtpResImpl &&
            (identical(other.pinId, pinId) || other.pinId == pinId) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.smsStatus, smsStatus) ||
                other.smsStatus == smsStatus) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, pinId, to, smsStatus, message);

  /// Create a copy of SendOtpRes
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendOtpResImplCopyWith<_$SendOtpResImpl> get copyWith =>
      __$$SendOtpResImplCopyWithImpl<_$SendOtpResImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SendOtpResImplToJson(
      this,
    );
  }
}

abstract class _SendOtpRes implements SendOtpRes {
  const factory _SendOtpRes(
      {required final String? pinId,
      required final String? to,
      required final String? smsStatus,
      required final String? message}) = _$SendOtpResImpl;

  factory _SendOtpRes.fromJson(Map<String, dynamic> json) =
      _$SendOtpResImpl.fromJson;

  @override
  String? get pinId;
  @override
  String? get to;
  @override
  String? get smsStatus;
  @override
  String? get message;

  /// Create a copy of SendOtpRes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendOtpResImplCopyWith<_$SendOtpResImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
