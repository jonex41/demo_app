import 'package:demo_app/model/iev_response/IevResponse.dart';
import 'package:demo_app/model/login/login_res.dart';
import 'package:demo_app/network/rest_client.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../core/storage_service.dart';

class NetworkService extends GetxService {
  late final RestClient _restClient;
  final storageService = Get.find<StorageService>();

  Future<NetworkService> init() async {
    final options = BaseOptions(
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    );
    Dio dio = Dio(options);
    // dio.options.connectTimeout = const Duration(seconds: 8);
    //dio.options.receiveTimeout = const Duration(seconds: 8);

// customization
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
    _restClient = RestClient(dio);
    return this;
  }

  Future<LoginResponse?> loginUser(Map<String, dynamic> request) async {
    // try {
    var response = await _restClient.login(request);
    storageService.saveToken(response.result?.accessToken ?? '');
    if (response.statusCode != 200) throw Exception("Unable to Login");
    return response.result;
  }

  Future<IevSubmissionResponse?> submitIEVData(Map<String, dynamic> request) async {
    final response = await _restClient.submitIEVData(request);
    if (response.statusCode! != 201) throw Exception(response.message);
    return response.result;
  }
}
