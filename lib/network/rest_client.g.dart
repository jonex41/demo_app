// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element

class _RestClient implements RestClient {
  _RestClient(
    this._dio, {
    this.baseUrl,
  }) {
<<<<<<< HEAD
    baseUrl ??= 'https://echis.up.railway.app/api/';
=======
    baseUrl ??= 'https://echis.up.railway.app/';
>>>>>>> 6346456 (feat: 🎸 integrated iev form submiasion)
  }

  final Dio _dio;

  String? baseUrl;

  @override
<<<<<<< HEAD
  Future<BaseResponse<LoginResponse>> login(
=======
  Future<BaseResponse<IevSubmissionResponse>> submitIEVData(
>>>>>>> 6346456 (feat: 🎸 integrated iev form submiasion)
      Map<String, dynamic> request) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request);
    final _result = await _dio.fetch<Map<String, dynamic>>(
<<<<<<< HEAD
        _setStreamType<BaseResponse<LoginResponse>>(Options(
=======
        _setStreamType<BaseResponse<IevSubmissionResponse>>(Options(
>>>>>>> 6346456 (feat: 🎸 integrated iev form submiasion)
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
<<<<<<< HEAD
              'Enumerator/Login',
=======
              'api/IEV/data/submit',
>>>>>>> 6346456 (feat: 🎸 integrated iev form submiasion)
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
<<<<<<< HEAD
    final _value = BaseResponse<LoginResponse>.fromJson(
      _result.data!,
      (json) => LoginResponse.fromJson(json as Map<String, dynamic>),
=======
    final _value = BaseResponse<IevSubmissionResponse>.fromJson(
      _result.data!,
      (json) => IevSubmissionResponse.fromJson(json as Map<String, dynamic>),
>>>>>>> 6346456 (feat: 🎸 integrated iev form submiasion)
    );
    return _value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
