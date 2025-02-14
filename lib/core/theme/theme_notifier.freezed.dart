// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theme_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ThemesState {
  ThemeMode? get myTheme => throw _privateConstructorUsedError;
  Key? get key => throw _privateConstructorUsedError;
  GlobalKey<NavigatorState>? get navigatorKey =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ThemesStateCopyWith<ThemesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemesStateCopyWith<$Res> {
  factory $ThemesStateCopyWith(
          ThemesState value, $Res Function(ThemesState) then) =
      _$ThemesStateCopyWithImpl<$Res, ThemesState>;
  @useResult
  $Res call(
      {ThemeMode? myTheme, Key? key, GlobalKey<NavigatorState>? navigatorKey});
}

/// @nodoc
class _$ThemesStateCopyWithImpl<$Res, $Val extends ThemesState>
    implements $ThemesStateCopyWith<$Res> {
  _$ThemesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? myTheme = freezed,
    Object? key = freezed,
    Object? navigatorKey = freezed,
  }) {
    return _then(_value.copyWith(
      myTheme: freezed == myTheme
          ? _value.myTheme
          : myTheme // ignore: cast_nullable_to_non_nullable
              as ThemeMode?,
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as Key?,
      navigatorKey: freezed == navigatorKey
          ? _value.navigatorKey
          : navigatorKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<NavigatorState>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ThemesStateImplCopyWith<$Res>
    implements $ThemesStateCopyWith<$Res> {
  factory _$$ThemesStateImplCopyWith(
          _$ThemesStateImpl value, $Res Function(_$ThemesStateImpl) then) =
      __$$ThemesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ThemeMode? myTheme, Key? key, GlobalKey<NavigatorState>? navigatorKey});
}

/// @nodoc
class __$$ThemesStateImplCopyWithImpl<$Res>
    extends _$ThemesStateCopyWithImpl<$Res, _$ThemesStateImpl>
    implements _$$ThemesStateImplCopyWith<$Res> {
  __$$ThemesStateImplCopyWithImpl(
      _$ThemesStateImpl _value, $Res Function(_$ThemesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? myTheme = freezed,
    Object? key = freezed,
    Object? navigatorKey = freezed,
  }) {
    return _then(_$ThemesStateImpl(
      myTheme: freezed == myTheme
          ? _value.myTheme
          : myTheme // ignore: cast_nullable_to_non_nullable
              as ThemeMode?,
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as Key?,
      navigatorKey: freezed == navigatorKey
          ? _value.navigatorKey
          : navigatorKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<NavigatorState>?,
    ));
  }
}

/// @nodoc

class _$ThemesStateImpl implements _ThemesState {
  const _$ThemesStateImpl({this.myTheme, this.key, this.navigatorKey});

  @override
  final ThemeMode? myTheme;
  @override
  final Key? key;
  @override
  final GlobalKey<NavigatorState>? navigatorKey;

  @override
  String toString() {
    return 'ThemesState(myTheme: $myTheme, key: $key, navigatorKey: $navigatorKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThemesStateImpl &&
            (identical(other.myTheme, myTheme) || other.myTheme == myTheme) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.navigatorKey, navigatorKey) ||
                other.navigatorKey == navigatorKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, myTheme, key, navigatorKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ThemesStateImplCopyWith<_$ThemesStateImpl> get copyWith =>
      __$$ThemesStateImplCopyWithImpl<_$ThemesStateImpl>(this, _$identity);
}

abstract class _ThemesState implements ThemesState {
  const factory _ThemesState(
      {final ThemeMode? myTheme,
      final Key? key,
      final GlobalKey<NavigatorState>? navigatorKey}) = _$ThemesStateImpl;

  @override
  ThemeMode? get myTheme;
  @override
  Key? get key;
  @override
  GlobalKey<NavigatorState>? get navigatorKey;
  @override
  @JsonKey(ignore: true)
  _$$ThemesStateImplCopyWith<_$ThemesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
