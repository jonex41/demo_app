import 'package:demo_app/model/base_res/base_response.dart';
import 'package:demo_app/model/home/activity_model.dart';
import 'package:demo_app/model/iev_response/IevResponse.dart';
import 'package:demo_app/model/login/forgot_password_model.dart';
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
      receiveTimeout: const Duration(seconds: 6),
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

  Future<IevSubmissionResponse?> submitIEVData(
      Map<String, dynamic> request) async {
    final response = await _restClient.submitIEVData(request);
    if (response.statusCode! != 201) throw Exception(response.message);
    return response.result;
  }

  Future<bool> submitIEVDataNew(Map<String, dynamic> request) async {
    final response = await _restClient.submitIEVDataNew(request);
    if (response.statusCode! != 201) throw Exception(response.message);
    return true;
  }

  Future<BaseResponse<ForgotPasswordModel>> forgotPasswordSendOtp(
      Map<String, dynamic> request) async {
    final response = await _restClient.forgotPasswordSendOtp(request);
    if (response.statusCode! != 200) throw Exception(response.message);
    return response;
  }

  Future<bool> forgotPasswordConfirmOtp(Map<String, dynamic> request) async {
    final response = await _restClient.forgotPasswordConfirmOtp(request);
    if (response.statusCode! != 200) {
      throw Exception(response.message ?? response.result?.message ?? '');
    }

    if (response.result!.verified == "False") {
      throw Exception(response.result?.message ?? response.result!.verified);
    }
    return true;
  }

  Future<bool> forgotPasswordReset(Map<String, dynamic> request) async {
    final response = await _restClient.forgotPasswordResetOtp(request);
    if (response.statusCode! != 200) throw Exception(response.message);
    return true;
  }

  Future<List<dynamic>> getAllIEVData(int page) async {
    //final token = storageService.getToken();
    final response = await _restClient.getAllDataIEV(page);
    if (response.statusCode != 200) {
      throw Exception(response.message);
    }
    return response.result;
  }

  Future<ActivityModel?> getAnalytics() async {
    //final token = storageService.getToken();
    final response = await _restClient.getAnalytics();
    if (response.statusCode != 200) {
      throw Exception(response.message);
    }
    return response.result;
  }

  Future<List<String>?> getState() async {
    //final token = storageService.getToken();
    final response = await _restClient.getStates();
    if (response.statusCode != 200) {
      throw Exception(response.message);
    }
    return response.result;
  }

  Future<List<String>?> getLga(String state) async {
    //final token = storageService.getToken();
    final response = await _restClient.getLga(state);
    if (response.statusCode != 200) {
      throw Exception(response.message);
    }
    return response.result;
  }

  Future<List<String>?> getwards(String state, String lga) async {
    //final token = storageService.getToken();
    final response = await _restClient.getWards(state, lga);
    if (response.statusCode != 200) {
      throw Exception(response.message);
    }
    return response.result;
  }

  Future<List<SettlementModel>?> getSettlement(
      String state, String lga, String ward, String teamCode) async {
    //final token = storageService.getToken();
    final response =
        await _restClient.getSettlement(state, lga, ward, teamCode);
    if (response.statusCode != 200) {
      throw Exception(response.message);
    }
    return response.result;
  }
}
