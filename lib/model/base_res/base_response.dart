import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

//part "base_response.freezed.dart";
//part "base_response.g.dart";

part 'base_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T> extends Equatable {
  final int? statusCode;
  final T? result;
  final String? message;
  final String? error;

  const BaseResponse({
    this.statusCode,
    this.result,
    this.message,
    this.error,
  });

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    return _$BaseResponseFromJson<T>(json, fromJsonT);
  }

  Map<String, dynamic> toJson(
    Map<String, dynamic> Function(T value) toJsonT,
  ) {
    return _$BaseResponseToJson<T>(this, toJsonT);
  }

  @override
  List<Object?> get props => [
        statusCode,
        result,
        message,
        error,
      ];
}
