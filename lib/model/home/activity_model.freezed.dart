// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ActivityModel _$ActivityModelFromJson(Map<String, dynamic> json) {
  return _ActivityModel.fromJson(json);
}

/// @nodoc
mixin _$ActivityModel {
  int? get recentSubmissions => throw _privateConstructorUsedError;
  int? get totalPregnantWomen => throw _privateConstructorUsedError;
  int? get households => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ActivityModelCopyWith<ActivityModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivityModelCopyWith<$Res> {
  factory $ActivityModelCopyWith(
          ActivityModel value, $Res Function(ActivityModel) then) =
      _$ActivityModelCopyWithImpl<$Res, ActivityModel>;
  @useResult
  $Res call({int? recentSubmissions, int? totalPregnantWomen, int? households});
}

/// @nodoc
class _$ActivityModelCopyWithImpl<$Res, $Val extends ActivityModel>
    implements $ActivityModelCopyWith<$Res> {
  _$ActivityModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recentSubmissions = freezed,
    Object? totalPregnantWomen = freezed,
    Object? households = freezed,
  }) {
    return _then(_value.copyWith(
      recentSubmissions: freezed == recentSubmissions
          ? _value.recentSubmissions
          : recentSubmissions // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPregnantWomen: freezed == totalPregnantWomen
          ? _value.totalPregnantWomen
          : totalPregnantWomen // ignore: cast_nullable_to_non_nullable
              as int?,
      households: freezed == households
          ? _value.households
          : households // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActivityModelImplCopyWith<$Res>
    implements $ActivityModelCopyWith<$Res> {
  factory _$$ActivityModelImplCopyWith(
          _$ActivityModelImpl value, $Res Function(_$ActivityModelImpl) then) =
      __$$ActivityModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? recentSubmissions, int? totalPregnantWomen, int? households});
}

/// @nodoc
class __$$ActivityModelImplCopyWithImpl<$Res>
    extends _$ActivityModelCopyWithImpl<$Res, _$ActivityModelImpl>
    implements _$$ActivityModelImplCopyWith<$Res> {
  __$$ActivityModelImplCopyWithImpl(
      _$ActivityModelImpl _value, $Res Function(_$ActivityModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recentSubmissions = freezed,
    Object? totalPregnantWomen = freezed,
    Object? households = freezed,
  }) {
    return _then(_$ActivityModelImpl(
      recentSubmissions: freezed == recentSubmissions
          ? _value.recentSubmissions
          : recentSubmissions // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPregnantWomen: freezed == totalPregnantWomen
          ? _value.totalPregnantWomen
          : totalPregnantWomen // ignore: cast_nullable_to_non_nullable
              as int?,
      households: freezed == households
          ? _value.households
          : households // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ActivityModelImpl implements _ActivityModel {
  const _$ActivityModelImpl(
      {required this.recentSubmissions,
      this.totalPregnantWomen,
      this.households});

  factory _$ActivityModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActivityModelImplFromJson(json);

  @override
  final int? recentSubmissions;
  @override
  final int? totalPregnantWomen;
  @override
  final int? households;

  @override
  String toString() {
    return 'ActivityModel(recentSubmissions: $recentSubmissions, totalPregnantWomen: $totalPregnantWomen, households: $households)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivityModelImpl &&
            (identical(other.recentSubmissions, recentSubmissions) ||
                other.recentSubmissions == recentSubmissions) &&
            (identical(other.totalPregnantWomen, totalPregnantWomen) ||
                other.totalPregnantWomen == totalPregnantWomen) &&
            (identical(other.households, households) ||
                other.households == households));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, recentSubmissions, totalPregnantWomen, households);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivityModelImplCopyWith<_$ActivityModelImpl> get copyWith =>
      __$$ActivityModelImplCopyWithImpl<_$ActivityModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActivityModelImplToJson(
      this,
    );
  }
}

abstract class _ActivityModel implements ActivityModel {
  const factory _ActivityModel(
      {required final int? recentSubmissions,
      final int? totalPregnantWomen,
      final int? households}) = _$ActivityModelImpl;

  factory _ActivityModel.fromJson(Map<String, dynamic> json) =
      _$ActivityModelImpl.fromJson;

  @override
  int? get recentSubmissions;
  @override
  int? get totalPregnantWomen;
  @override
  int? get households;
  @override
  @JsonKey(ignore: true)
  _$$ActivityModelImplCopyWith<_$ActivityModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SettlementModel _$SettlementModelFromJson(Map<String, dynamic> json) {
  return _SettlementModel.fromJson(json);
}

/// @nodoc
mixin _$SettlementModel {
  String? get name => throw _privateConstructorUsedError;
  String? get teamCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SettlementModelCopyWith<SettlementModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettlementModelCopyWith<$Res> {
  factory $SettlementModelCopyWith(
          SettlementModel value, $Res Function(SettlementModel) then) =
      _$SettlementModelCopyWithImpl<$Res, SettlementModel>;
  @useResult
  $Res call({String? name, String? teamCode});
}

/// @nodoc
class _$SettlementModelCopyWithImpl<$Res, $Val extends SettlementModel>
    implements $SettlementModelCopyWith<$Res> {
  _$SettlementModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? teamCode = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      teamCode: freezed == teamCode
          ? _value.teamCode
          : teamCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SettlementModelImplCopyWith<$Res>
    implements $SettlementModelCopyWith<$Res> {
  factory _$$SettlementModelImplCopyWith(_$SettlementModelImpl value,
          $Res Function(_$SettlementModelImpl) then) =
      __$$SettlementModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, String? teamCode});
}

/// @nodoc
class __$$SettlementModelImplCopyWithImpl<$Res>
    extends _$SettlementModelCopyWithImpl<$Res, _$SettlementModelImpl>
    implements _$$SettlementModelImplCopyWith<$Res> {
  __$$SettlementModelImplCopyWithImpl(
      _$SettlementModelImpl _value, $Res Function(_$SettlementModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? teamCode = freezed,
  }) {
    return _then(_$SettlementModelImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      teamCode: freezed == teamCode
          ? _value.teamCode
          : teamCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SettlementModelImpl implements _SettlementModel {
  const _$SettlementModelImpl({this.name, this.teamCode});

  factory _$SettlementModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SettlementModelImplFromJson(json);

  @override
  final String? name;
  @override
  final String? teamCode;

  @override
  String toString() {
    return 'SettlementModel(name: $name, teamCode: $teamCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettlementModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.teamCode, teamCode) ||
                other.teamCode == teamCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, teamCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SettlementModelImplCopyWith<_$SettlementModelImpl> get copyWith =>
      __$$SettlementModelImplCopyWithImpl<_$SettlementModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SettlementModelImplToJson(
      this,
    );
  }
}

abstract class _SettlementModel implements SettlementModel {
  const factory _SettlementModel({final String? name, final String? teamCode}) =
      _$SettlementModelImpl;

  factory _SettlementModel.fromJson(Map<String, dynamic> json) =
      _$SettlementModelImpl.fromJson;

  @override
  String? get name;
  @override
  String? get teamCode;
  @override
  @JsonKey(ignore: true)
  _$$SettlementModelImplCopyWith<_$SettlementModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
