// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'IevSubmissionNewResponse.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

IevSubmissionNewResponse _$IevSubmissionNewResponseFromJson(
    Map<String, dynamic> json) {
  return _IevSubmissionNewResponse.fromJson(json);
}

/// @nodoc
mixin _$IevSubmissionNewResponse {
  String? get submittedBy => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IevSubmissionNewResponseCopyWith<IevSubmissionNewResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IevSubmissionNewResponseCopyWith<$Res> {
  factory $IevSubmissionNewResponseCopyWith(IevSubmissionNewResponse value,
          $Res Function(IevSubmissionNewResponse) then) =
      _$IevSubmissionNewResponseCopyWithImpl<$Res, IevSubmissionNewResponse>;
  @useResult
  $Res call({String? submittedBy, double? longitude, double? latitude});
}

/// @nodoc
class _$IevSubmissionNewResponseCopyWithImpl<$Res,
        $Val extends IevSubmissionNewResponse>
    implements $IevSubmissionNewResponseCopyWith<$Res> {
  _$IevSubmissionNewResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? submittedBy = freezed,
    Object? longitude = freezed,
    Object? latitude = freezed,
  }) {
    return _then(_value.copyWith(
      submittedBy: freezed == submittedBy
          ? _value.submittedBy
          : submittedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IevSubmissionNewResponseImplCopyWith<$Res>
    implements $IevSubmissionNewResponseCopyWith<$Res> {
  factory _$$IevSubmissionNewResponseImplCopyWith(
          _$IevSubmissionNewResponseImpl value,
          $Res Function(_$IevSubmissionNewResponseImpl) then) =
      __$$IevSubmissionNewResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? submittedBy, double? longitude, double? latitude});
}

/// @nodoc
class __$$IevSubmissionNewResponseImplCopyWithImpl<$Res>
    extends _$IevSubmissionNewResponseCopyWithImpl<$Res,
        _$IevSubmissionNewResponseImpl>
    implements _$$IevSubmissionNewResponseImplCopyWith<$Res> {
  __$$IevSubmissionNewResponseImplCopyWithImpl(
      _$IevSubmissionNewResponseImpl _value,
      $Res Function(_$IevSubmissionNewResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? submittedBy = freezed,
    Object? longitude = freezed,
    Object? latitude = freezed,
  }) {
    return _then(_$IevSubmissionNewResponseImpl(
      submittedBy: freezed == submittedBy
          ? _value.submittedBy
          : submittedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IevSubmissionNewResponseImpl implements _IevSubmissionNewResponse {
  const _$IevSubmissionNewResponseImpl(
      {required this.submittedBy,
      required this.longitude,
      required this.latitude});

  factory _$IevSubmissionNewResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$IevSubmissionNewResponseImplFromJson(json);

  @override
  final String? submittedBy;
  @override
  final double? longitude;
  @override
  final double? latitude;

  @override
  String toString() {
    return 'IevSubmissionNewResponse(submittedBy: $submittedBy, longitude: $longitude, latitude: $latitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IevSubmissionNewResponseImpl &&
            (identical(other.submittedBy, submittedBy) ||
                other.submittedBy == submittedBy) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, submittedBy, longitude, latitude);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IevSubmissionNewResponseImplCopyWith<_$IevSubmissionNewResponseImpl>
      get copyWith => __$$IevSubmissionNewResponseImplCopyWithImpl<
          _$IevSubmissionNewResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IevSubmissionNewResponseImplToJson(
      this,
    );
  }
}

abstract class _IevSubmissionNewResponse implements IevSubmissionNewResponse {
  const factory _IevSubmissionNewResponse(
      {required final String? submittedBy,
      required final double? longitude,
      required final double? latitude}) = _$IevSubmissionNewResponseImpl;

  factory _IevSubmissionNewResponse.fromJson(Map<String, dynamic> json) =
      _$IevSubmissionNewResponseImpl.fromJson;

  @override
  String? get submittedBy;
  @override
  double? get longitude;
  @override
  double? get latitude;
  @override
  @JsonKey(ignore: true)
  _$$IevSubmissionNewResponseImplCopyWith<_$IevSubmissionNewResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
