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
    baseUrl ??= 'https://echis.up.railway.app/api/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<BaseResponse<LoginResponse>> login(
      Map<String, dynamic> request) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse<LoginResponse>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'Enumerator/Login',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final _value = BaseResponse<LoginResponse>.fromJson(
      _result.data!,
      (json) => LoginResponse.fromJson(json as Map<String, dynamic>),
    );
    return _value;
  }

  @override
  Future<BaseResponse<IevSubmissionResponse>> submitIEVData(
      Map<String, dynamic> request) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse<IevSubmissionResponse>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'IEV/data/submit',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final _value = BaseResponse<IevSubmissionResponse>.fromJson(
      _result.data!,
      (json) => IevSubmissionResponse.fromJson(json as Map<String, dynamic>),
    );
    return _value;
  }

  @override
  Future<BaseResponse<dynamic>> forgotPasswordResetOtp(
      Map<String, dynamic> reqBody) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(reqBody);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse<dynamic>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'Enumerator/forgotpassword/complete',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final _value = BaseResponse<dynamic>.fromJson(
      _result.data!,
      (json) => json as dynamic,
    );
    return _value;
  }

  @override
  Future<BaseResponse<ForgotPasswordModel>> forgotPasswordConfirmOtp(
      Map<String, dynamic> reqBody) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(reqBody);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse<ForgotPasswordModel>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'Enumerator/forgotpassword/verifyOtp',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final _value = BaseResponse<ForgotPasswordModel>.fromJson(
      _result.data!,
      (json) => ForgotPasswordModel.fromJson(json as Map<String, dynamic>),
    );
    return _value;
  }

  @override
  Future<BaseResponse<ForgotPasswordModel>> forgotPasswordSendOtp(
      Map<String, dynamic> reqBody) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(reqBody);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse<ForgotPasswordModel>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'Enumerator/forgotpassword/sendOtp',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final _value = BaseResponse<ForgotPasswordModel>.fromJson(
      _result.data!,
      (json) => ForgotPasswordModel.fromJson(json as Map<String, dynamic>),
    );
    return _value;
  }

  @override
  Future<BaseResponse<dynamic>> getAllDataIEV() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse<dynamic>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'IEV/data',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final _value = BaseResponse<dynamic>.fromJson(
      _result.data!,
      (json) => json as dynamic,
    );
    return _value;
  }

  @override
  Future<BaseResponse<ActivityModel>> getAnalytics() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse<ActivityModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'Analytics/mobile/widget',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final _value = BaseResponse<ActivityModel>.fromJson(
      _result.data!,
      (json) => ActivityModel.fromJson(json as Map<String, dynamic>),
    );
    return _value;
  }

  @override
  Future<BaseResponse<List<String>>> getStates() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse<List<String>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'National/states',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final _value = BaseResponse<List<String>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json.map<String>((i) => i as String).toList()
          : List.empty(),
    );
    return _value;
  }

  @override
  Future<BaseResponse<List<String>>> getLga(dynamic state) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse<List<String>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'National/lgas?State=${state}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final _value = BaseResponse<List<String>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json.map<String>((i) => i as String).toList()
          : List.empty(),
    );
    return _value;
  }

  @override
  Future<BaseResponse<List<String>>> getWards(
    dynamic state,
    dynamic lga,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse<List<String>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'National/wards?Lga=${lga}&State=${state}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final _value = BaseResponse<List<String>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json.map<String>((i) => i as String).toList()
          : List.empty(),
    );
    return _value;
  }

  @override
  Future<BaseResponse<List<SettlementModel>>> getSettlement(
    dynamic state,
    dynamic lga,
    dynamic ward,
    dynamic teamCode,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse<List<SettlementModel>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'National/settlements?Lga=${lga}&Ward=${ward}&State=${state}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final _value = BaseResponse<List<SettlementModel>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<SettlementModel>(
                  (i) => SettlementModel.fromJson(i as Map<String, dynamic>))
              .toList()
          : List.empty(),
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
