// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'IevResponse.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

IevSubmissionResponse _$IevSubmissionResponseFromJson(
    Map<String, dynamic> json) {
  return _IevSubmissionResponse.fromJson(json);
}

/// @nodoc
mixin _$IevSubmissionResponse {
  String? get submittedBy => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  List<Answer>? get answers => throw _privateConstructorUsedError;
  List<AntigenAnswer>? get antigenAnswers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IevSubmissionResponseCopyWith<IevSubmissionResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IevSubmissionResponseCopyWith<$Res> {
  factory $IevSubmissionResponseCopyWith(IevSubmissionResponse value,
          $Res Function(IevSubmissionResponse) then) =
      _$IevSubmissionResponseCopyWithImpl<$Res, IevSubmissionResponse>;
  @useResult
  $Res call(
      {String? submittedBy,
      double? longitude,
      double? latitude,
      List<Answer>? answers,
      List<AntigenAnswer>? antigenAnswers});
}

/// @nodoc
class _$IevSubmissionResponseCopyWithImpl<$Res,
        $Val extends IevSubmissionResponse>
    implements $IevSubmissionResponseCopyWith<$Res> {
  _$IevSubmissionResponseCopyWithImpl(this._value, this._then);

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
    Object? answers = freezed,
    Object? antigenAnswers = freezed,
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
      answers: freezed == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<Answer>?,
      antigenAnswers: freezed == antigenAnswers
          ? _value.antigenAnswers
          : antigenAnswers // ignore: cast_nullable_to_non_nullable
              as List<AntigenAnswer>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IevSubmissionResponseImplCopyWith<$Res>
    implements $IevSubmissionResponseCopyWith<$Res> {
  factory _$$IevSubmissionResponseImplCopyWith(
          _$IevSubmissionResponseImpl value,
          $Res Function(_$IevSubmissionResponseImpl) then) =
      __$$IevSubmissionResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? submittedBy,
      double? longitude,
      double? latitude,
      List<Answer>? answers,
      List<AntigenAnswer>? antigenAnswers});
}

/// @nodoc
class __$$IevSubmissionResponseImplCopyWithImpl<$Res>
    extends _$IevSubmissionResponseCopyWithImpl<$Res,
        _$IevSubmissionResponseImpl>
    implements _$$IevSubmissionResponseImplCopyWith<$Res> {
  __$$IevSubmissionResponseImplCopyWithImpl(_$IevSubmissionResponseImpl _value,
      $Res Function(_$IevSubmissionResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? submittedBy = freezed,
    Object? longitude = freezed,
    Object? latitude = freezed,
    Object? answers = freezed,
    Object? antigenAnswers = freezed,
  }) {
    return _then(_$IevSubmissionResponseImpl(
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
      answers: freezed == answers
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<Answer>?,
      antigenAnswers: freezed == antigenAnswers
          ? _value._antigenAnswers
          : antigenAnswers // ignore: cast_nullable_to_non_nullable
              as List<AntigenAnswer>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IevSubmissionResponseImpl implements _IevSubmissionResponse {
  const _$IevSubmissionResponseImpl(
      {required this.submittedBy,
      required this.longitude,
      required this.latitude,
      required final List<Answer>? answers,
      required final List<AntigenAnswer>? antigenAnswers})
      : _answers = answers,
        _antigenAnswers = antigenAnswers;

  factory _$IevSubmissionResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$IevSubmissionResponseImplFromJson(json);

  @override
  final String? submittedBy;
  @override
  final double? longitude;
  @override
  final double? latitude;
  final List<Answer>? _answers;
  @override
  List<Answer>? get answers {
    final value = _answers;
    if (value == null) return null;
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<AntigenAnswer>? _antigenAnswers;
  @override
  List<AntigenAnswer>? get antigenAnswers {
    final value = _antigenAnswers;
    if (value == null) return null;
    if (_antigenAnswers is EqualUnmodifiableListView) return _antigenAnswers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'IevSubmissionResponse(submittedBy: $submittedBy, longitude: $longitude, latitude: $latitude, answers: $answers, antigenAnswers: $antigenAnswers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IevSubmissionResponseImpl &&
            (identical(other.submittedBy, submittedBy) ||
                other.submittedBy == submittedBy) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            const DeepCollectionEquality().equals(other._answers, _answers) &&
            const DeepCollectionEquality()
                .equals(other._antigenAnswers, _antigenAnswers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      submittedBy,
      longitude,
      latitude,
      const DeepCollectionEquality().hash(_answers),
      const DeepCollectionEquality().hash(_antigenAnswers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IevSubmissionResponseImplCopyWith<_$IevSubmissionResponseImpl>
      get copyWith => __$$IevSubmissionResponseImplCopyWithImpl<
          _$IevSubmissionResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IevSubmissionResponseImplToJson(
      this,
    );
  }
}

abstract class _IevSubmissionResponse implements IevSubmissionResponse {
  const factory _IevSubmissionResponse(
          {required final String? submittedBy,
          required final double? longitude,
          required final double? latitude,
          required final List<Answer>? answers,
          required final List<AntigenAnswer>? antigenAnswers}) =
      _$IevSubmissionResponseImpl;

  factory _IevSubmissionResponse.fromJson(Map<String, dynamic> json) =
      _$IevSubmissionResponseImpl.fromJson;

  @override
  String? get submittedBy;
  @override
  double? get longitude;
  @override
  double? get latitude;
  @override
  List<Answer>? get answers;
  @override
  List<AntigenAnswer>? get antigenAnswers;
  @override
  @JsonKey(ignore: true)
  _$$IevSubmissionResponseImplCopyWith<_$IevSubmissionResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Answer _$AnswerFromJson(Map<String, dynamic> json) {
  return _Answer.fromJson(json);
}

/// @nodoc
mixin _$Answer {
  String? get questionId => throw _privateConstructorUsedError;
  String? get answerText => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnswerCopyWith<Answer> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswerCopyWith<$Res> {
  factory $AnswerCopyWith(Answer value, $Res Function(Answer) then) =
      _$AnswerCopyWithImpl<$Res, Answer>;
  @useResult
  $Res call({String? questionId, String? answerText});
}

/// @nodoc
class _$AnswerCopyWithImpl<$Res, $Val extends Answer>
    implements $AnswerCopyWith<$Res> {
  _$AnswerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = freezed,
    Object? answerText = freezed,
  }) {
    return _then(_value.copyWith(
      questionId: freezed == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String?,
      answerText: freezed == answerText
          ? _value.answerText
          : answerText // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnswerImplCopyWith<$Res> implements $AnswerCopyWith<$Res> {
  factory _$$AnswerImplCopyWith(
          _$AnswerImpl value, $Res Function(_$AnswerImpl) then) =
      __$$AnswerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? questionId, String? answerText});
}

/// @nodoc
class __$$AnswerImplCopyWithImpl<$Res>
    extends _$AnswerCopyWithImpl<$Res, _$AnswerImpl>
    implements _$$AnswerImplCopyWith<$Res> {
  __$$AnswerImplCopyWithImpl(
      _$AnswerImpl _value, $Res Function(_$AnswerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = freezed,
    Object? answerText = freezed,
  }) {
    return _then(_$AnswerImpl(
      questionId: freezed == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String?,
      answerText: freezed == answerText
          ? _value.answerText
          : answerText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnswerImpl implements _Answer {
  const _$AnswerImpl({required this.questionId, required this.answerText});

  factory _$AnswerImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnswerImplFromJson(json);

  @override
  final String? questionId;
  @override
  final String? answerText;

  @override
  String toString() {
    return 'Answer(questionId: $questionId, answerText: $answerText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnswerImpl &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.answerText, answerText) ||
                other.answerText == answerText));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, questionId, answerText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnswerImplCopyWith<_$AnswerImpl> get copyWith =>
      __$$AnswerImplCopyWithImpl<_$AnswerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnswerImplToJson(
      this,
    );
  }
}

abstract class _Answer implements Answer {
  const factory _Answer(
      {required final String? questionId,
      required final String? answerText}) = _$AnswerImpl;

  factory _Answer.fromJson(Map<String, dynamic> json) = _$AnswerImpl.fromJson;

  @override
  String? get questionId;
  @override
  String? get answerText;
  @override
  @JsonKey(ignore: true)
  _$$AnswerImplCopyWith<_$AnswerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AntigenAnswer _$AntigenAnswerFromJson(Map<String, dynamic> json) {
  return _AntigenAnswer.fromJson(json);
}

/// @nodoc
mixin _$AntigenAnswer {
  String? get name => throw _privateConstructorUsedError;
  String? get response => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AntigenAnswerCopyWith<AntigenAnswer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AntigenAnswerCopyWith<$Res> {
  factory $AntigenAnswerCopyWith(
          AntigenAnswer value, $Res Function(AntigenAnswer) then) =
      _$AntigenAnswerCopyWithImpl<$Res, AntigenAnswer>;
  @useResult
  $Res call({String? name, String? response});
}

/// @nodoc
class _$AntigenAnswerCopyWithImpl<$Res, $Val extends AntigenAnswer>
    implements $AntigenAnswerCopyWith<$Res> {
  _$AntigenAnswerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? response = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AntigenAnswerImplCopyWith<$Res>
    implements $AntigenAnswerCopyWith<$Res> {
  factory _$$AntigenAnswerImplCopyWith(
          _$AntigenAnswerImpl value, $Res Function(_$AntigenAnswerImpl) then) =
      __$$AntigenAnswerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, String? response});
}

/// @nodoc
class __$$AntigenAnswerImplCopyWithImpl<$Res>
    extends _$AntigenAnswerCopyWithImpl<$Res, _$AntigenAnswerImpl>
    implements _$$AntigenAnswerImplCopyWith<$Res> {
  __$$AntigenAnswerImplCopyWithImpl(
      _$AntigenAnswerImpl _value, $Res Function(_$AntigenAnswerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? response = freezed,
  }) {
    return _then(_$AntigenAnswerImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AntigenAnswerImpl implements _AntigenAnswer {
  const _$AntigenAnswerImpl({required this.name, required this.response});

  factory _$AntigenAnswerImpl.fromJson(Map<String, dynamic> json) =>
      _$$AntigenAnswerImplFromJson(json);

  @override
  final String? name;
  @override
  final String? response;

  @override
  String toString() {
    return 'AntigenAnswer(name: $name, response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AntigenAnswerImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, response);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AntigenAnswerImplCopyWith<_$AntigenAnswerImpl> get copyWith =>
      __$$AntigenAnswerImplCopyWithImpl<_$AntigenAnswerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AntigenAnswerImplToJson(
      this,
    );
  }
}

abstract class _AntigenAnswer implements AntigenAnswer {
  const factory _AntigenAnswer(
      {required final String? name,
      required final String? response}) = _$AntigenAnswerImpl;

  factory _AntigenAnswer.fromJson(Map<String, dynamic> json) =
      _$AntigenAnswerImpl.fromJson;

  @override
  String? get name;
  @override
  String? get response;
  @override
  @JsonKey(ignore: true)
  _$$AntigenAnswerImplCopyWith<_$AntigenAnswerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
